function [fx] = fcuad(x)
%{
    Función cuadrática f: Rn --> R

    Input:
        x  .- vector de longitud n
    Output:
        fx .- número real
%}
    fx = norm(x)^2 +1;
end