
function [W,x,iter] = MetodoBL(fname, x, method='newton', tol=1.e-04, maxiter = 50, maxjter = 30, c1 = 0.1)

%{
    Método de búsqueda de línea con la primer condición de Wolfe
    usando máximo descenso.
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
    p = 1; s = -1;

    fx = feval(fname,x);
    g  = gradiente(fname,x);
    ng = norm(g);
    W  = [x]; 

    while ( ng > tol && iter < maxiter &&  norm(p)> 1.e-04)

        if (strcmp(method,'max'))
            p = -g;
        end

        if (strcmp(method,'newton'))
            H = hessian(fname,x);
            p = -H\g; 
        end

        %-----------------------------------------
        % Búsqueda de línea
        alfa  = 1;              % paso completo
        xt = x + alfa*p;        % primer punto de prueba
        f  = feval(fname,x);  % valor de la función
        f1 = feval(fname, xt);% valor de la función en el punto de prueba
        s  = p'*g;            % derivada direccional
        jter = 0;             % iteraciones internas

        if (abs(s) < 1.e-06)
            disp('No existe suficiente descenso  ')
            disp(sprintf('%2.0f  %2.10f',iter, s   ))
            iter = maxiter; 
        end

        while( (f1>f+alfa*c1*s) && jter < maxjter)  % búsqueda de línea
           alfa = alfa/2;
           xt = x + alfa*p;
           f1 = feval(fname, xt); %valor de la función en el punto de prueba
           jter = jter +1;
        end   
        % Fin de búsqueda de línea
        %----------------------------------------------------------------------

        W = [W x];
        x = x + alfa*p;  
        fx = feval(fname,x); 
        g = gradiente(fname,x);
        iter = iter + 1;
    end      

end