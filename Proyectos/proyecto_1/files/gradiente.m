function  [gfx] = gradiente(f, x, h = 1.e-08)

%{
    Aproximacion del gradiente por diferencias hacia adelante 
    de una funcion  de R^n a R.
    
    Input:
        f   .- apuntador a la función
        x   .- vector columna de dimension n.

    Output:

        gfx .- vector columna de dimension n, 
                 es la aproximacion al gradiente en x.
%}
    
    n = length(x);
    
    fx = f(x);                            
    xt = x;
    
    for i = 1:n
        xt(i) = xt(i) + h;
        fxh = f(xt);
        gfx(i) = (fxh - fx)/h;
        xt(i) = x(i);
    end
end