
function [fx] = rosenbrock(x)
%{
    Función de Rosenbrock: f: R^2 --> R cuyo mínimo local es muy 
    difícil de alcanzar por medio de los métodos de optimización.
    
    Input:
         x.- vector de longitud 2
    Output:
        fx.- número real con el valor de la función.
%}
    fx = 100*(x(2) - x(1)^2)^2 + (1 - x(1))^2;
end