
function [W,x,iter] = MetodoBL(fname, x, method='newton', line_search='quadratic',
                               tol=1.e-04, maxiter = 50, maxjter = 30, c1 = 0.1)

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
            if (strcmp(line_search,'linear'))
                alfa = alfa/2;
                xt = x + alfa*p;
                f1 = feval(fname, xt);
                jter = jter +1;
            end
            
            if (strcmp(line_search,'quadratic'))
                d2 = f1 - f - s;
                alfa = -( s)/(2*d2);       
                f1 = feval(fname, x + alfa*p);
                jter = jter +1;    
            end
        end   
        % Fin de búsqueda de línea
        %----------------------------------------------------------------------
        
        
        %--------------------------------------------------------------
        % Graficación
        
        t = linspace(0,1,50)';
        ft = zeros(50,1); rt = zeros(50,1);
        for k = 1:50        
            ft(k) = feval(fname, x+t(k)*p);  % función 
            rt(k) = fx + t(k)*(c1*p'*g);
        end
        
        fx = feval(fname,x+alfa*p);
        
        plot(t,ft,'--b',t,rt,'--m',alfa,fx,'dr', 'LineWidth',3)
        title('Gráfica de búsqueda de línea','Fontsize',16)
        xlabel('EJE  T','Fontsize',16)
        ylabel(' f(x + tp)','Fontsize',16  )
        legend('f(x)','recta','punto')
        pause

        % Fin de graficación
        %-----------------------------------------------------  
          
          
        W = [W x];
        x = x + alfa*p;  
        fx = feval(fname,x); 
        g = gradiente(fname,x);
        iter = iter + 1;
    end      

end