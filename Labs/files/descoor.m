
function [x,iter,W] = descoor(fname,x,method='max',tol=1.e-05,maxiter = 1000,maxjter = 6,c1 = 0.1)

%{
    Método para aproximar mínimos locales para una función
    f: R^n --> R  dos veces continuamente diferenciable,
    usando los métodos de descenso:
        1. Por coordenadas
        2. Máximo descenso
    Input:
        
        fname.- cadena de caracteres con el nombre de la función a minimizar.
        x    .- vector n-dimensional.
    
    Output:
        x    .- vector n-dimensional con la aproximación al mínimo local.
        iter .- contador con el número final de iteraciones externas.
%}
    

    iter = 0;        

    n  = length(x);
    g  = gradiente(fname,x);
    ng = norm(g);
    W  = [x];  
    
    %-----------------------------------------------------------------------
    % parte iterativa
    while ( ng > tol && iter < maxiter)
        
        if (strcmp(method,'coor') )
            [a, k] = max(abs(g));
             b = g(k);
             p = zeros(n,1);
             if (b > 0)
                 p(k) = -1;
             else
                 p(k) = 1;
             end  
        end

        if (strcmp(method,'max'))
            p = -g;
        end

        %---------------------------------------------
        alfa  = 1;              % paso completo
        xt = x + alfa*p;
        % busqueda de línea
        f  = feval(fname,x);  % valor de la función
        f1 = feval(fname, xt);% valor de la función en el punto de prueba
        s  = p'*g;            % derivada direccional
        jter = 0;             % iteraciones internas
        
        while( (f1>f+alfa*c1*s) && jter < maxjter)  % búsqueda de línea
           alfa = alfa/2;
           xt = x + alfa*p;
           f1 = feval(fname, xt);% valor de la función en el punto de prueba
           jter = jter +1;
        end   
        %--------------------------------------
        
        x = x + alfa*p;
        W = [W x];
        g = gradiente(fname,x);
        ng = norm(g);
        iter = iter + 1; 
    end

end