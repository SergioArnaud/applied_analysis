function [fx] = rosenbrock(X)
%{
    Función de Rosenbrock: f: R^2 --> R cuyo mínimo local es muy 
    difícil de alcanzar por medio de los métodos de optimización.
    
    Input:
         x.- vector de longitud 2
    Output:
        fx.- número real con el valor de la función.
%}

    if (length(size(X)) > 2)
        x = X(:,:,1);
        y = X(:,:,2);
    else
        x = X(1);
        y = X(2);
    end
    
    fx = 100.*(y - x.^2).^2 + (1 - x).^2;
end