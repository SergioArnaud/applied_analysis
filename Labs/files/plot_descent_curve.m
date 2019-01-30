
function  [gfx] = plot_descent_curve(a,b, fname = 'rosenbrock', x = [1.5; 1.5])

%{
    Ejemplo de la curva en R siguiendo el vector -g en la función de
    Rosenbrock en el punto (1.5, 1.5].
    
    Input:
        fname .- cadena con el nombre de la funcion.
        x     .- vector columna de dimension n.

    Output:

        gfx   .- vector columna de dimension n, 
                 es la aproximacion al gradiente en x.
%}

    g =  gradiente(fname,x);
    t = linspace(0,b,50)';

    for k = 1:50
        y(k) = feval(fname, x - t(k)*g);
    end

    y = y';

    plot(t,y,'--b', 'Linewidth',3)
    title(['Curva de descenso en el intervalo [',num2str(a),', ',num2str(b),']' ])
    xlabel('Eje T')
    ylabel('Valores de f(x -t g)')
end