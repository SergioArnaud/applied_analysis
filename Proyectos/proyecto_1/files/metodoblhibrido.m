
function [W,x,iter] = metodoblhibrido(f, x, method='newton', tol=1.e-08, 
                                      maxiter = 250, maxjter = 20, c1 = 1.e-04)
%{
    Método de búsqueda de línea con la primer condición de Wolfe
    usando máximo descenso.
    usando los métodos de descenso:
        1. Máximo descenso
        2. Método de Newton
    Input:
        
        fname.- cadena de caracteres con el nombre de la función a minimizar.
        x    .- vector n-dimensional.
    
    Output:
        x    .- vector n-dimensional con la aproximación al mínimo local.
        iter .- contador con el número final de iteraciones externas.
%}
    iter = 0;        
    p = 1; 

    g  = gradiente(f,x)';
    W  = [x]; 

    while ( norm(g) > tol && iter < maxiter)

        if (strcmp(method,'max'))
            p = -g;
        end

        if (strcmp(method,'newton'))
            H = hessiana(f,x);
            %if (all(eig(H) > 1.e-08))
            %    p = - chol(H) \g; 
            %else
                p = -H\g;
            %end
        end

        %-----------------------------------------
        %            Búsqueda híbrida
        
        alfa = 1;
        alfa_back = 1; alfa_inter = 1; 
        jter = 0;   
        
        f_x  = f(x);
        s  = p'*g;  
        %if (abs(s) < 1.e-12)
        %    disp('No existe suficiente descenso  ')
        %    disp(sprintf('%2.0f  %2.10f',iter, s))
        %    break;
        %end

        while(true)  % búsqueda de línea
                
            %-----------------------------------------
            %           Paso Backtracking
            alfa_back = alfa/2;
            f_back  = f(x + alfa_back*p);
            wolfe_back = false;
            
            %-----------------------------------------
            %           Paso Interpolación
            
            f1   = f(x + alfa*p);
            d2 = f1 - f_x - s;
            alfa_inter = -(s)/(2*d2); 
            f_inter =f(x + alfa_inter*p);
            wolfe_inter = false;
            
            %-----------------------------------------
            %    Paso backtracking cumple W1
            if (f_back <= f_x + alfa_back*c1*s)
                wolfe_back = true;
            end
            
            %-----------------------------------------
            %    Paso interpolación cumple W1
            if (f_inter <= f_x + alfa_inter*c1*s)
                wolfe_inter = true;
            end
            
            if (wolfe_back && wolfe_inter)
                %a = 'las dos'
                alfa = max(alfa_back,alfa_inter);
            elseif(wolfe_inter)
                %a = 'inter'
                alfa = alfa_inter;
            elseif(wolfe_back)
                %a = 'backtrack'
                alfa = alfa_back;
            else
                alfa = min(alfa_back, alfa_inter);
            end
            
            if (jter > maxjter || norm(alfa*p) < 1.e-3) 
                alfa = 1.e-2;
                break;
            end
            
            if (wolfe_back || wolfe_inter)
                break
            end
             
            jter = jter +1;
        end   
        %          Fin de búsqueda híbrida
        %------------------------------------------
          
        W = [W, x];
        x = x + alfa*p;  
        fx = f(x); 
        g = gradiente(f,x)';
        iter = iter + 1;
        
    end      
end