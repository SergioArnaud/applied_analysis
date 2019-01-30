###### Definición.

Decimos que $x^* \in \R^n​$ es un **mínimo local** de $f : \R^n \to \R​$ continua si y solo si existe $r>0​$ tal que
$$
f(x^*) \leq f(x) \\
\forall x \in \R^n, \quad \Vert x^* - x \Vert_2 < r
$$

###### Definición.

Decimos que $x^* \in \R^n$ es un **mínimo local estricto** de $f : \R^n \to \R$ continua si y solo si existe $r>0$ tal que
$$
f(x^*) < f(x)
$$

$$
\forall x \in \R^n, \quad 0<\Vert x^* - x \Vert_2 < r
$$

###### Definición.

Decimos que $x^* \in \R^n$ es un **mínimo global** de $f:\R^n \to \R$ continua si y solo si
$$
f(x^*) \leq f(x) \quad \forall x \in \R^n
$$

###### Teorema (condiciones necesarias de primer orden).

Sean $f : \R^n \to \R​$, $x^* \in \R^n​$ tales que $f \in \mathcal{C}^1(\R^n)​$ y $x^*​$ es un mínimo local de $f(x)​$ entonces
$$
\nabla f(x^*) = 0
$$

###### Teorema (condiciones necesarias de segundo orden).

Sean $f : \R^n \to \R$, $x^* \in \R^n$ tales que $f \in \mathcal{C}^2(\R^n)$ y $x^*$ es un mínimo local de $f(x)$ entonces
$$
\begin{align*}
1) \ & \nabla f(x^*) = 0 \\
2) \ & \nabla^2f(x^*) \ \text{Es simétrica semipositiva definida}
\end{align*}
$$

###### Teorema (condiciones suficientes de segundo orden).

Sean $f : \R^n \to \R​$, $x^* \in \R^n​$ tales que $f \in \mathcal{C}^2(\R^n)​$ y $x^* \in \R^n​$ tales que:
$$
\begin{align*}
1) \ & \nabla f(x^*) = 0 \\
2) \ & \nabla^2f(x^*) \ \text{Es simétrica semipositiva definida}
\end{align*}
$$
Entonces $x^*$ es un mínimo local estricto de $f(x)​$

> *Demostración*
>
> Como $f \in \mathcal{C}^2(\R^n)​$ y $ \nabla^2f(x^*) ​$ es simétrica semipositiva definida existe $r>0​$ tal que $ \nabla^2f(x) ​$ es simétrica positiva definida para todo $x \in \mathcal{B}_r^{\Vert \cdot \Vert_2}(x^*)​$.
>
> Por el teorema de Taylor, para $x \in \mathcal{B}_r^{\Vert \cdot \Vert_2}(x^*)$, $x \not = x^*$ y para algún $t \in (0,1)$
> $$
> \begin{align}
> f(x) &= f(x^*) + \nabla f(x^*)^\top(x-x^*) + \frac{1}{2}(x-x^*)^\top \nabla^2 f(x^* + t(x-x^*))(x-x^*) \\
> &= f(x^*) + \frac{1}{2}(x-x^*)^\top \nabla^2 f(y)(x-x^*) 
> \end{align}
> $$
> Luego 
> $$
> f(x) - f(x^*) = \frac{1}{2}(x-x^*)^\top \nabla^2 f(y)(x-x^*)  > 0
> $$
> Concluyendo $f(x^*) < f(x)$ $_\square$



###### Definición.

Decimos que $p \in \R^n \setminus \{0\}$ es una **dirección de descenso** para $f : \R^n \to \R$, $f \in \mathcal{C}^1(\R^n)$ en $\hat{x} \in \R^n$ si y solo si
$$
\nabla f(x)^\top p < 0
$$

###### Observación



###### Ejercicio.

Probar que
$$
\text{arg}\min\limits_{p^\top p=1} \{\nabla f(\hat{x})^\top p\} ) = \frac{-\nabla f(\hat{x})}{\Vert \nabla f(\hat{x}) \Vert}
$$

###### Teorema

Sean $f:\R^n \to \R$, $\alpha$, $p \in \R^n$ tales que $f \in \mathcal{C}'(\R^n)$, $\nabla f(x)^T p < 0 $ entonces existe $t^*>0$ tal que
$$
f(\hat{x} + tp) < f(\hat{x}) \quad \quad \forall t \in (0,t*)
$$

> ###### Demostración
>
> Sea $g(t) = f(\hat{x} + tp)$ con $t\geq0$ 
>
> Entonces
> $$
> \begin{align*}
> &g:[0,\infty] \to \R \\
> &g \in \mathcal{C}'([0,\infty])
> \end{align*}
> $$
> Además
> $$
> \begin{align*}
> g'(t)& = \nabla f(\hat{x} +tp)^Tp\\
> g(0) &= f(\hat{x})\\
> g'(0) &= \nabla f(\hat{x})
> \end{align*}
> $$
> Por hipótesis $g'(0) < 0$, como $g'$ es continua existe $t^*> 0$ tal que $g(t) < 0  \ \forall t \in [0, t^*)$. Veamos que $g(t) < g(0) \forall t \in (0,t^*)$.
>
> Sea $t \in (0,t^*)$, por el teorema del valor medio
> $$
> \frac{g(t) - g(0)}{t-0} = g'(\xi) \quad \quad \xi \in (0,t)
> $$
> Tenemos que 
> $$
> \begin{align*}
> && 0 < \xi < t < t^* \\
> \therefore && g'(\xi) < 0\\ 
> \therefore && \frac{g(t) - g(0)}{t} < 0 \\
> \therefore && g(t) - g(0) < 0\\
> \therefore && g(t) < g(0) \quad _\square
> \end{align*}
> $$



###### Observación (Búsqueda de línea)

Consideremos la siguiente familia de rectas
$$
\begin{align*}
R_c(t) = g(0) + t(cg'(0)) && t\geq 0, \ c \in [0,1]
\end{align*}
$$


Para cualquier $c_1 \in (0,1)$
$$
\begin{align*}
R_{c_1} = g(0) + t(c_1 \cdot g'(0)) && \text{Wolfe 1} \\
\end{align*}
$$
Escojemos $\hat{t} \geq 0$ es tal que 
$$
\begin{align*}
g(\hat{t}) \leq R_{c_1}(\hat{t}) && \text{(Wolfe 2)} \\
\end{align*}
$$
Entonces
$$
g'(\hat{t}) \geq c_2 g'(0) \\
0 < c_2 < c_1 < 1
$$


###### Algoritmo (Método de direcciones de desceso con Búsqueda de Linea)

​	$x_0 \in \R^n​$

​	$0 < c_0 < c_1 < 0$

​	$k \leftarrow 0$​

​	Mientras ($\Vert \nabla f (x_k) \Vert_2 > 0$)

​		Determinar $p_k \in \R^n​$ tal que 

​				$\nabla f (x_k)^T p_k < 0 $

​		Encontrar $t_k \geq 0$ tal que

​				$g(t_k)\leq R_{c_1}(t_k)$

​				$g'(t_k)\geq c_2g'(0)$

​		$x_{k+1} \leftarrow x_k + t_k p_k​$

​		k $\leftarrow$ k+1				

###### Teorema

Sean $f : \R^n \to \R$, $x_k, p_k \in \R$ tales que $f \in \mathcal{C}^1(\R^n)$ y $\nabla f(x_k)^T p_k < 0 $, $f$ es acotada inferiormente en $\R^n$, entonces existe $(\hat{t_1}, \hat{t_2}) \subset (0, \infty)$ tal que $\forall t \in (t_1,t_2)$ 
$$
\begin{align*}
g(t) &\leq Rc_1(t) \\
g'(t) &\geq c_2 g'(0)
\end{align*}
$$

> ###### Demostración
>
> Existe $\hat{t} >0$ tal que $g\hat{t} = R_{c_1}(\hat{t})$
>
> Notemos que
> $$
> \begin{align*}
> R_1(t) &= g(0) + tg'(0) \\
> &\approx g(t) && \text{Para t cerca de 0}
> \end{align*}
> $$
> Como $g'(0) < 0$ y $0 < c_1 < 1$
> $$
> \begin{align*}
> && R_1(t) &< R_{c_1}(t) && \text{Muy cercanos de t} \\
> \implies && g(t) &< R_{c_1}(t) && \text{Para t cerca de 0}
> \end{align*}
> $$
> Tenemos que
> $$
> \begin{align*}
> \lim_{t\to+\infty} R_{c_i}(t) = -\infty
> \end{align*}
> $$
> Como $f(x)$ es acotado inferiormente se tiene que existe $\hat{t}>0$ tal que $g(\hat{t}) = R_{c_1}(\hat{t})$. Consideremos el problema
> $$
> \begin{align*}
> \sup\{t \geq 0 \ | \ g(t) < R_{c_1}(t)\}
> \end{align*}
> $$
> Como $f$ es acotada inferiormente existe dicho supremo, sea $t^*$ dicho supremo, entonces
> $$
> \begin{align*}
> g(t) \leq R_{c_1}(t) && \forall t \in (0,t^*) \quad 
> \end{align*}
> $$
> Con lo cual queda probada la primer afirmación. Para probar la segunda procedemos de la siguiente manera
> $$
> \begin{align*}
> g'(\xi^*) &= \frac{g(t^*) - g(0)}{t^* - 0}  && \text{Por el TVM para}\ \xi^* \in (0,t^*) \\
> &= c_1g'(0)
> \end{align*}
> $$
> Asimismo
> $$
> \begin{align*}
> &&0 < c_1 &< c_2 < 1 && \text{Con } g'(0) < 0 \\
> \implies && 0 > c_1g'(0) &> c_2g'(0) > g'(0)  \\
> \therefore && g'(\xi^*) &> c_2g'(0) \quad _\square
> \end{align*}
> $$
> 





###### Algoritmo (Búsqueda de línea)



###### Hipótesis

1. $f: \R^n \to \R$ continuamente diferenciable
2. $f(x)$ es acotada inferiormente
3. $\nabla f(x)$ es Lipschitz continua

###### Lema

Si la segunda confición de Wolfe se satisface, entonces
$$
\frac{(c_2 - 1)}{L}\frac{\nabla f(x_k)^\top p_k}{\Vert p_k \Vert_2^2} \leq \alpha_k
$$

> ###### Demostración.
>
> Denotemos
> $$
> \begin{align*}
> f(x_k) &= f_k \\
> \nabla f(x_k) &= \nabla f_k 
> \end{align*}
> $$
> Por la segunda condición de Wolfe
> $$
> \begin{align*}
> \nabla f(x_k + \alpha_k p_k)^\top p_k &\geq c_2(\nabla f_k^\top p_k) \\
> \nabla f(x_k + \alpha_k p_k)^\top p_k - \nabla f_k^\top p_k  &\geq (c_2-1)\nabla f_k^\top p_k \\
> 0 < (c_2-1)\nabla f_k^\top p_k &\leq (\nabla f_{k+1} - \nabla f_k)^\top p_k  && \text{Puesto que } x_{k+1} = x_k + \alpha_k p_k \\
> &\leq \Vert \nabla f_{k+1} - \nabla f_k\Vert_2 \ \Vert p_k \Vert_2 && \text{Por Cauchy-Schwarz} \\
> &\leq L\Vert x_{k+1} - xk\Vert_2 \ \Vert p_k \Vert_2 && \text{Porque es Lipschitz} \\
> &=  L\Vert \alpha_k p_k \Vert \ \Vert p_k \Vert_2 \\
> &=  L \alpha_k \Vert p_k \Vert_2^2 
> \end{align*}
> $$
> Nótese que la desigualdad se satisface si
> $$
> \begin{align*}
> \nabla f_{k+1}^\top p_k &= c_2(\nabla f_k^\top p_k) \\ \\
> p_k &= \beta (\nabla f_{k+1} - \nabla f_k \\ \\
> \Vert \nabla f_{k+1} - \nabla f_k \Vert_2 &= L \alpha_k \Vert p_k \Vert_2
> \end{align*}
> $$
> 



###### Teorema

En el método de obtiene una sucesión $\{x_k\}$ tal que

- $\nabla f(x_k) = 0$ para algún $k \in \N$
- $\sum\limits_{k=0}^\infty \cos^2 \theta_k \Vert \nabla f_k \Vert_2^2  < \infty$

> ###### Demostración
>
> Sea 
> $$
> \gamma_k \equiv \frac{(c_2 - 1)}{L}\frac{\nabla f(x_k)^\top p_k}{\Vert p_k \Vert_2^2}
> $$
> Por el lema
> $$
> \begin{align*}
> 0 < \gamma_k \leq \alpha_k \\
> -\alpha_k < -\gamma_k < 0 && \text{(A)}\\
> -c_1 (\nabla f_k^\top p_k) > 0 && \text{(B)}
> \end{align*}
> $$
> Multiplicamos (A) y (B) para proceder de la siguiente forma
> $$
> \begin{align*}
> && \alpha_k c_1 (\nabla f_k^\top p_k ) < c_1 \gamma_k (\nabla f_k^\top p_k) \\
> && f_{k+1} \leq f_k + \alpha_k c_1 (\nabla f_k^\top p_k ) < f_k + c_1 \gamma_k (\nabla f_k^\top p_k)\\
> \therefore && f_{k+1} < f_k + c_1 \frac{(c_2 - 1)}{L}\frac{(\nabla f(x_k)^\top p_k)^2}{\Vert p_k \Vert_2^2}
> \end{align*}
> $$
> Por otro lado, $\theta_k$ es el ángulo entre $p_k$ y $\nabla f_k$ de forma que
> $$
> \begin{align*}
> \cos^2 \theta_k = \frac{(\nabla f_k^\top p_k)^2}{\Vert p_k \Vert^2_2 \Vert \nabla f_k \Vert_2^2}
> \end{align*}
> $$
> Luego
> $$
> \begin{align*}
> f_{k+1} &< f_k - c_1 \frac{(1 - c_2)}{L}  \ \cos^2 \theta_k \Vert \nabla f_k \Vert_2^2 \\ 
> &= f_k - c^* \cos \theta_k \Vert \nabla f_k \Vert_2^2  && c^* := c_1 \frac{(1 - c_2)}{L}  \\
> &< f_{k-1} - c^*( \cos \theta_{k-1} \Vert \nabla f_{k-1}  \Vert_2^2 +  \cos \theta_k \Vert \nabla f_k \Vert_2^2)   \\
> \end{align*}
> $$
> Asi pues, Sea $-M$ una cota inferior de $f(x)$
> $$
> \begin{align*}
> &&  f_0 - c^* \sum_{i=0}^k \cos^2 \theta_i \Vert \nabla f_i \Vert_2^2  &> f_{k+1}\\ \\
> \implies &&  \sum_{i=0}^k \cos^2 \theta_i \Vert \nabla f_i \Vert_2^2 &< \frac{f_0 - f_{k+1}}{c^*} \\
> && &\leq \frac{f_0 - M}{c^*} 
> 
> \end{align*}
> $$
> 

###### Observación

La segunda condición del teorema implica que
$$
\lim_{k \to \infty} \cos^2 \theta_k \Vert \nabla f_k \Vert_2^2 = 0
$$
Asimismo, para $p_k = - \nabla f_k$, $\theta_k = \pi$ y $\cos \theta_k = -1$, por lo tanto
$$
\lim_{k \to \infty}  \Vert \nabla f_k \Vert_2^2 = 0
$$


###### Corolario

Supongamos que generamos una sucesión $\{x_k\}$ tal que $\nabla f (x_k) \neq 0$ $\forall k$.  Con $\{x_k\} \subset \Omega$ compacto en $\R^n$

Sea $\beta > 0$ (pero cercano a cero) tal que
$$
\theta_k > \frac{\pi}{2} + \beta \quad \quad \forall k \in \N
$$


































​			 			




















