graf = 1;
N=512;
Imin = 1;
Imax = 1;
theta = 90;

%%%angles%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
theta = deg2rad(theta);
down  = sign(cos(theta));
right = sign(sin(theta));

%%%CREATING CHESSBOARD%%%%%%%%%%%%%%%%%%%%%

black = zeros(N/8);
white = 255*ones(N/8);

four_squares = [black, white; white, black];
quadrant     = [four_squares four_squares; four_squares four_squares];
chess        = [quadrant, quadrant; quadrant, quadrant];

%%A escolhar a posição da fonte%%%%%%%%%%%%%%
%gradiente aponta para baixo e para a direita
if down>=0 && right>=0
    c = Imax;
    a = (Imin-Imax)/N/(1+tan(theta));
    b = a*tan(theta);
end

%gradiente aponta para cima e para a direita
if down<=0 && right>=0
    a = (Imax-Imin)/(N+1)/(1-tan(theta));
    b = a*tan(theta);
    c = Imin-a-N*a*tan(theta);
end

%gradiente aponta para cima e para a esquerda
if down<=0 && right<=0
    c = Imin;
    a = (Imax-Imin)/N/(1+tan(theta));
    b = a*tan(theta);
end

%gradiente aponta para baixo e para a esquerda
if down>=0 && right<=0
    x = Imin;
    Imin = Imax;
    Imax = x;
    a = (Imax-Imin)/(N+1)/(1-tan(theta));
    b = a*tan(theta);
    c = Imin-a-N*a*tan(theta);
end

%%%CRIAÇÃO DO GRADIENTE%%%%%%%
gradient = zeros(N);

for x=1:N
    for y=1:N
        gradient(x,y)=a*x+b*y+c;
    end
end

%%APLICAR GRADIENTE E MOSTRAR
IMG = uint8(chess.*gradient);

if graf==true
    imshow(IMG)
end

figure
graf = 1;
N=512;
Imin = 0.2;
Imax = 0.9;
theta = -90;

%%%angles%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
theta = deg2rad(theta);
down  = sign(cos(theta));
right = sign(sin(theta));

%%%CREATING CHESSBOARD%%%%%%%%%%%%%%%%%%%%%

black = zeros(N/8);
white = 255*ones(N/8);

four_squares = [black, white; white, black];
quadrant     = [four_squares four_squares; four_squares four_squares];
chess        = [quadrant, quadrant; quadrant, quadrant];

%%A escolhar a posição da fonte%%%%%%%%%%%%%%
%gradiente aponta para baixo e para a direita
if down>=0 && right>=0
    c = Imax;
    a = (Imin-Imax)/N/(1+tan(theta));
    b = a*tan(theta);
end

%gradiente aponta para cima e para a direita
if down<=0 && right>=0
    a = (Imax-Imin)/(N+1)/(1-tan(theta));
    b = a*tan(theta);
    c = Imin-a-N*a*tan(theta);
end

%gradiente aponta para cima e para a esquerda
if down<=0 && right<=0
    c = Imin;
    a = (Imax-Imin)/N/(1+tan(theta));
    b = a*tan(theta);
end

%gradiente aponta para baixo e para a esquerda
if down>=0 && right<=0
    x = Imin;
    Imin = Imax;
    Imax = x;
    a = (Imax-Imin)/(N+1)/(1-tan(theta));
    b = a*tan(theta);
    c = Imin-a-N*a*tan(theta);
end

%%%CRIAÇÃO DO GRADIENTE%%%%%%%
gradient = zeros(N);

for x=1:N
    for y=1:N
        gradient(x,y)=a*x+b*y+c;
    end
end

%%APLICAR GRADIENTE E MOSTRAR
IMG = uint8(chess.*gradient);

if graf==true
    imshow(IMG)
end





