figure
x = 0:pi/30:2*pi;
for a=-0.1:0.02:0.1
    y=exp(-a*x).*sin(x);
    hold on
    plot(x,y)
end