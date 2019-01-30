
function [fx] = funcuad(x)
%{
    Función cuadrática 
        f(x) = (1/2)*x'*A*x + b'*x + c
        
    Donde 
        x es un vector de dimensión cuatro,
        A es la matriz de Pascal de dimensión cuatro,
        b es el vector columna de unos de dimensión cuatro,
        c = 1.
    
    El único mínimo de f(x) es en el vector 
        x* = [1 0 0 0]'.
        
    Input:
        x  .- vector de longitud 4
    Output:
        fx .- número real
%}

    A = [1 1 1 1; 1 2 3 4; 1 3 6 10;1 4 10 20];
    b = [ 1 1 1 1]';                              
    c = 1;                                        

    fx = (1/2)*x'*A*x + b'*x + c;  
end