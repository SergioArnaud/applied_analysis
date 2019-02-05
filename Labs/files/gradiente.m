
function  [gfx] = gradiente(fname, x, h = 1.e-06)

%{
    Aproximacion del gradiente por diferencias hacia adelante 
    de una funcion  de R^n a R.
    
    Input:
        fname .- cadena con el nombre de la funcion.
        x     .- vector columna de dimension n.

    Output:

        gfx   .- vector columna de dimension n, 
                 es la aproximacion al gradiente en x.
%}

    n = length(x);
    
    fx = feval(fname,x);                            
    gfx = zeros(n,1);   
    xt = x;
    
    for i = 1:n
        xt(i) = xt(i) + h;
        fxh = feval(fname, xt);
        gfx(i) = (fxh - fx)/h;
        xt(i) = x(i);
    end
end