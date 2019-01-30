
function  [gfx] = plot_surface(fname, x_lim = [.8; 1.2], y_lim = [.8,1.2], n=50)

%{
% Grafica la función de Rosenbrock:
%
%  f(x) = 100*(x(2) - x(1)^2)^2 + (1 - x(1))^2
%
% con único mínimo en x* = [1, 1]'.
% La graficación es en la caja [0.8, 1.2]x[0.8, 1.2].
    
    Input:
        fname .- cadena con el nombre de la funcion.
        x     .- vector columna de dimension n.

    Output:

        gfx   .- vector columna de dimension n, 
                 es la aproximacion al gradiente en x.
%}

    x = linspace(x_lim(1),x_lim(2),n)';
    y = linspace(y_lim(1),y_lim(2),n)';
    
    [X,Y]= meshgrid(x,y);
    Z = zeros(n);


    for i = 1:n
        a = x(i);
        for j = 1:n
            Z(i,j) = feval(fname,[a,y(j)]');
        end
    end

    subplot (2, 1, 1)
    mesh(X,Y,Z);
    title(fname )
    axis square
    xlabel('X')
    ylabel('Y')
    
    subplot (2, 1, 2)
    contour(X,Y,Z,200)
    axis square
    hold on
    plot(1,1,'dr','Linewidth',5)
   

end