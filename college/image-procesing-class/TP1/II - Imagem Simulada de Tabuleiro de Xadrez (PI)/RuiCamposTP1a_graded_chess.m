function [IMG] = RuiCamposTP1a_graded_chess(N, Imin, Imax, theta, graf)
%graded_chess checks boundary conditions, raises error if they are not met
%otherwise, creates chess and applies gradient 


%CHECKING FOR INVALID INPUT
if rem(N, 8) ~= 0
    error("N must be divisible by 8! graded_chess(N, Imin, Imax, theta, graf)")
end

if theta > 90 || theta < 0
    error("Angle must be between 0 and 90 degrees. graded_chess(N, Imin, Imax, theta, graf)")
end

if Imin > 1 || Imin < 0
    error("Intensities must be between 0 and 1. graded_chess(N, Imin, Imax, theta, graf)")
end

if Imax > 1 || Imax < 0
    error("Intensities must be between 0 and 1. graded_chess(N, Imin, Imax, theta, graf)")
end

if Imin > Imax
    error("Imin must be smaller than Imax! graded_chess(N, Imin, Imax, theta, graf)")
end


%%%CREATING THE PICTURE%%%%%%%%%%%%
%IMG = RuiCamposTP1a_new_chess(N);

%%%CREATING THE GRADIENT%%%%%%%%%%%%
gradiente = ones(N);

for x=1:N
    for y=1:N
        z = RuiCamposTP1a_grad(x,y,theta, N, Imin, Imax);
        gradiente(x,y) = z;
    end
end

%%%APPLYING GRADIENT%%%%%%%%%%%%
img = RuiCamposTP1a_new_chess(N);
img = double(img);
img = img.*gradiente;
img_out = uint8(img);

%IMG = RuiCamposTP1a_apply_grad2(IMG, Imin, Imax, theta);

if graf==1
    imshow(img_out)
end
end

