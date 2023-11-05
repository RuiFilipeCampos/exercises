%CT Class%%%%%%%%%%%%%%
% Example of usage:
%       CTobj = RuiCampos_TP6_CTobj(matrix)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%The constructor method stores relevant information, such as
%the normalized 3-dimensional matrix and its dimensions.
%
%For each object, a unique 'rand_mask' 2D array is created. The matrix consists
%of a sample of the Unif(0,1) distribution, placed in a region outside
%a circle with radius of the size of any given slice. The corresponding
%'rem_mask' and 'add_border' arrays are created simultaneously.
%       rand_mask -> rand() outside circle, 1 inside circle
%       rem_mask -> 0's outside circle, 1's inside circle
%       add_border -> 1's outside circle, 0's inside circle
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


classdef RuiCampos_TP6_CTobj < handle
    properties
        vol                    %3D array containing all images (input)
        
        Nslices                %depth of input matrix
        Nl                     %number of lines in image slice
        Nc                     %number of columns in image slice
        
        rand_mask              %rand() outside circle, 1 inside circle
        rem_mask               %0's outside circle, 1's inside circle
        add_border             %1's outside circle, 0's inside circle
    end
    methods
        %% Constructor Method
        function self = RuiCampos_TP6_CTobj(vol)
            self.vol = (vol + 3024)/6100;
            
            [self.Nl, self.Nc, self.Nslices] = size(self.vol);
            
            self.rand_mask  = ones(self.Nl, self.Nc);
            self.rem_mask   = ones(self.Nl, self.Nc);
            self.add_border = zeros(self.Nl, self.Nc);
            
            for i=1:self.Nl
                for j=1:self.Nc
                    if (i-self.Nl/2)^2+(j-self.Nl/2)^2>(self.Nc/2)^2
                        self.rand_mask(i,j) = rand;
                        self.rem_mask(i,j) = 0;
                        self.add_border(i, j) = 1;
                    end
                end
            end
            
        end
        %% Visualization Tools
        function show_slice(self, i)
            imshow(self.vol(:,:,i))
            title("Slice #" + string(i))
        end
        
        function img = getSlice(self, i)
            img = self.vol(:,:,i);
        end
        %% Methods for Segmentation Alhorithm.
        function noisy_slice = add_noise(self, slice, show)
            slice       = slice + self.add_border;
            noisy_slice = slice.*self.rand_mask;
            if show==1
                figure('Name', 'Debug: result of add_noise')
                imshow(noisy_slice), title("result of add_noise")
            end
        end
        
        
        function slice = remove_noise(self, slice, show)
            slice = slice.*self.rem_mask;
            if show == 1
                figure('Name', 'Debug: result of remove_noise')
                imshow(slice), title("result of remove_noise")
            end
        end
        
        
        function areas = getAreas(self, labeled_segments, number_of_segments)
            areas    = zeros(1, number_of_segments);
            for label=1:number_of_segments
                segment      = labeled_segments == label;
                areas(label) = sum(sum(segment));
            end
        end
        
        function largest_segment = findLargestSegment(self, binary_image, allow_margin)
            [labeled_segments, number_of_segments] = bwlabel(binary_image, 4);
            areas = self.getAreas(labeled_segments, number_of_segments);
            
            if allow_margin == 1
                [~, label_of_largest] = max(areas);
                largest_segment = labeled_segments == label_of_largest;
            else %remove margin, construct new areas vector
                labeled_segments_without_margin = labeled_segments(3:self.Nl-2, ...
                                                                   3:self.Nc-2);
                
                new_areas = self.getAreas(labeled_segments_without_margin, number_of_segments);
                areas = areas.*(areas == new_areas); %remove areas that have changed
                
                [~, label_of_largest] = max(areas);
                largest_segment = labeled_segments == label_of_largest;
            end
        end
        
        
        %% Segmentation Algorithm
        function [lungs] = getLungs(self, i, show)
            if ~exist('show', 'var')
                show = 0;
            end
            
            slice = self.getSlice(i);
            
            noisy_slice = self.add_noise(slice, 0);
            noisy_slice = imadjust(noisy_slice, [], [], 0.9);
            
            T = graythresh(noisy_slice);
            
            binary = im2bw(noisy_slice, T);
            binary = self.remove_noise(binary, 0);
            
            body =  self.findLargestSegment(binary, 1);  % get body
            lungs = ~body;                              %invert
            lung1 = self.findLargestSegment(lungs, 0); %find first lung
            lungs = lungs - lung1;
            lung2 = self.findLargestSegment(lungs, 0); %propose second lung
            
            
            if sum(sum(lung1))/sum(sum(lung2)) > 10
                lungs = lung1;         %lung2 too small, not a lung
            else
                lungs = lung1 + lung2; %lung2 about the right size
            end
            
            if show == 1
                figure('Name', "Segmenting Lung")
                subplot(1,4,1), self.show_slice(i)
                subplot(1,4,2), imshow(noisy_slice),  title ("With Noise")
                subplot(1,4,3), imshow(binary),       title ("segmented")
                subplot(1,4,4), imshow(lungs),        title ("final result")
            end
        end
    end
    
end