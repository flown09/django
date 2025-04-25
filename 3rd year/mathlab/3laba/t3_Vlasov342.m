t=0:pi/50:10*pi;
x=sin(t);
y=cos(t);

%u=-2:0.01:2; v=-1:0.1:1;
%[x,y]=meshgrid(u,v);
%z=exp(-x.^2-y.^2);

plot3(x,y,t)
%mesh(x,y,z)
grid on