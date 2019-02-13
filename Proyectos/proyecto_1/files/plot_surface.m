function [] = plot_surface(f, x_dom=[-1,1], y_dom=[-1,1], n=40)
    x = linspace(x_dom(1),x_dom(2),n);
    y = linspace(y_dom(1),y_dom(2),n);
    [X,Y] = meshgrid(x,y);
    surf(X,Y,f(cat(3,X,Y)),'FaceAlpha',0.4)
end