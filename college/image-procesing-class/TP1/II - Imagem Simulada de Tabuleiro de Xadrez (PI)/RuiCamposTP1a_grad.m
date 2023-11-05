function [z] = RuiCamposTP1a_grad(x,y,theta, N, Imin, Imax)
%grad outputs value of a gradient
%   let z = ax+by+c+
%   the source point is (0,0) -> z(0,0) = Imax
%   the farthest point is always (N,N) -> z(N,N)=Imin
%   the direction of ilumination is given by theta
%   where theta is the angle with the x-axis from (0,0)
%   grad(z) = (a,b) -> b/a = tan(theta)
theta = deg2rad(theta);
dI = Imin-Imax;
a = dI/(1+tan(theta))/N;
b = a*tan(theta);
c = Imax;
z=x*a+y*b+c;
end

