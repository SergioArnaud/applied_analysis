## Tarea 1: Mínimos locales y direcciones de descenso



###### Ejercicio 1.

Encuentre el único mínimo de la función
$$
f(x,y) = \frac{x+y}{x^2+y^2+1}
$$

> ###### Solución
>
> Comencemos por calcular el gradiente
> $$
> \nabla f(x,y) = \left(\frac{(x^2 + y^2 +1) - 2x(x+y)}{(x^2 + y^2 +1)^2}, \frac{(x^2 + y^2 +1) - 2y(x+y)}{(x^2 + y^2 +1)^2} \right)
> $$
> Por las condiciones necesarias de primer orden
> $$
> \begin{align*}
> &&\nabla f(x,y) = 0 \\ \\
> \iff&& \begin{cases} y^2 - x^2 -2xy  + 1 = 0 \\   x^2 - y^2 -2xy +1 = 0  \end{cases} \\ \\
> \iff&& \begin{cases} x^2 = y^2 \\   x^2 - y^2 -2xy +1 = 0  \end{cases} \\ \\
> \iff&&  \begin{cases} 2x^2&=1 \\ &\text{o} \\   2x^2&=-1  \end{cases}  \\
> \iff&&  x = \pm\sqrt{\frac{1}{2}}
> \end{align*} \\ \\
> $$
> Asimismo, tras evaluar en los 4 puntos correspondientes obtenemos que el mínimo está dado por
> $$
> (x,y) = \left(-\sqrt{\frac{1}{2}},-\sqrt{\frac{1}{2}}\right)
> $$
> 

---

###### 	Ejercicio 2



![image-20190211204635886](assets/image-20190211204635886.png)


$$
\begin{align*}
&& \nabla f(x_1,x_2,x_3) &= \begin{pmatrix} 
2x_1 + x_2 + x_3 +2(x_1^2 + x_2^2 + x_3^2) \\
2x_2 + x_1 + x_3 +2(x_1^2 + x_2^2 + x_3^2) \\
2x_3 + x_2 + x_3 +2(x_1^2 + x_2^2 + x_3^2)
\end{pmatrix} \\ \\
\implies && f(0,0,0) &= \begin{pmatrix} 
0 \\
0 \\
0
\end{pmatrix} \\
\end{align*}
$$
Luego, 
$$
\begin{align*}
&&\nabla^2 f(x_1, x_2, x_3) &= \begin{pmatrix} 
2 + 4x_1 & 1 + 4x_2 & 1+4x_3 \\
1 + 4x_1 & 2 + 4x_2 & 1+4x_3 \\
1 + 4x_1 & 1 + 4x_2 & 2+4x_3
\end{pmatrix}  \\ \\
\implies && \nabla^2 f(0,0,0) &= \begin{pmatrix} 
2  & 1  & 1 \\
1  & 2  & 1 \\
1  & 1  & 2
\end{pmatrix}
\end{align*}
$$
La derivada es cero y la segunda derivada es simétrica, resta ver que es positiva definida para concluir, por las condiciones suficientes de segundo orden, que el punto es un mínimo local.

---

###### Ejercicio 3

Sea $\mathbb{A} \in \mathcal{M}_{n \times n}(\R)$ y $f : \R^n \to \R$ con $f(x) = \frac{1}{2} x^\top \mathbb{A}x + c^\top x + d$, demostrar que
$$
\begin{align*}
\nabla f(x) &= \frac{1}{2}(\mathbb{A} + \mathbb{A}^\top)x + c \ \\
\nabla^2 f(x) &= \frac{1}{2}(\mathbb{A} + \mathbb{A}^\top)
\end{align*}
$$



---


###### Ejercicio 4

Decimos que $\mathbb{A} \in \mathcal{M}_{n\times n}$ es positiva definida en $\R^n$ si y solo si $x^\top \mathbb{A}x > 0$ para todo $x \in \R^n − \{0\}$. Construya en forma general una matiz $\mathbb{A} \in \mathcal{M}_{n\times n}$ que sea positiva definida en $\R^n$ y que no sea simétrica. 

> ###### Solución
>
> Sabemos
> $$
> \begin{align*}
> p^\top \mathbb{A} p &= \sum_{j=1}^n \sum_{i=1}^n a_{ij} p_i p_j  && p\neq 0 \\
> &= \sum_{i=1}^n a_{ii} p_i^2 + \sum_{j=1}^n \sum_{i=1 \\ i\neq j}^n a_{ij} p_i p_j
> \end{align*}
> $$
> Luego
> $$
> \begin{align*}
> && p^\top \mathbb{A} p &> 0  \\
> \iff &&  \sum_{i=1}^n a_{ii} p_i^2 + \sum_{j=1}^n \sum_{i=1 \\ i\neq j}^n a_{ij}  p_i p_j &> 0
> \end{align*}
> $$
> Si hacemos $a_{ii} > 0 \ \forall i$, entonces $\sum_{i=1}^n a_{ii} p_i^2>0$ y basta encontrar $a_{ij}$ tales que
> $$
> \sum_{j=1}^n \sum_{i=1 \\ i\neq j}^n a_{ij}  p_i p_j \geq 0
> $$
> Esto es posible si consideramos $a_{ij} = - a_{ji} \forall i,j$. Es decir, cualquier matriz antisimétrica con diagonal positiva es definida positiva. $_\square​$

---

###### Ejercicio 5

Sea $x \in \R^n​$ tal que $\nabla f(x) \neq 0​$. Construya una sucesión $\{p_k\}​$ de direcciones (cada una unitaria) en $\R^n​$ que converja a $p^*​$, $\nabla f(x)^\top p^* = 0​$ y tales que $p_k \not \in \mathrm{Gen}(\nabla f(x))​$  $ \forall k​$.

> ###### Demostración
>
> Comencemos por tomar el segmento de recta que une a $\nabla f(x)$ con $p^*$.
> $$
> r(t) = \nabla f(x) + t(p^* - \nabla f(x)) \quad t \in [0,1] \nonumber
> $$
> Notemos que, para todo $t$ la derivada dirección del vector $r(t)$ está dada por
> $$
> \begin{align*}
> r(t)^\top \nabla f(x) &= (\nabla f(x) + t(p^* - \nabla f(x)))^\top \nabla f(x)\\
> &= \left((1-t)\nabla f(x) + tp^*\right)^\top\nabla f(x)  \\
> &= (1-t)\Vert \nabla f(x) \Vert_2^2 + \nabla f(x)^\top tp^* \\
> &= (1-t)\Vert \nabla f(x) \Vert_2^2
> \end{align*}
> $$
> Consideramos la siguiente función
> $$
> \begin{align*}
> \xi (t) &= r(t)^\top \nabla f(x) \quad \xi :[0,1] \to \R \\
> &= (1-t)\Vert \nabla f(x) \Vert_2^2
> \end{align*}
> $$
> Que es un segmento de recta decreciente en $t$. Consideremos la sucesión $\{x_n\} = \left\{\frac{\Vert \nabla f(x) \Vert_2^2}{2n}\right\}_{n=1}^\infty$ , $\{x_n\} \to 0$.
>
> Asimismo $\forall n$ podemos encontrar $t_n = t(x_n)$ tal que $\xi(t_n) = x_n$. Esto se debe a que $x_n \in (0, \Vert \nabla f(x) \Vert_2^2/2]  \ \forall n$ y a la aplicación tel teorema de valor intermedio.
>
> La sucesión deseada es $\{p_n\} = \{r(t_n)\}$  (falta normalizar $r(t_n)$)
>
> 

---

###### Ejercicio 6

Sean $x, p, s \in \R^n$ tales que $\nabla f(x)^\top p = \alpha < b = \nabla f(x)^\top s < 0$, con $\Vert p \Vert = \Vert s \Vert = 1$. Para $\gamma \in (\alpha, \beta)$ costruya un vector $p^*$ tal que 
$$
\nabla f(x)^\top p ^* = \gamma \quad y \quad \Vert p^* \Vert = 1
$$

> ###### Demostración
>
> Comencemos por tomar el segmento de recta que une a los puntos $p$ y $s$ parametrizado para comenzar en $s$ y terminar en $p$.
> $$
> r(t) = s + t(p - s) \quad t \in [0,1] \nonumber
> $$
> Luego
> $$
> \begin{align*}
> r(t)^\top \nabla f(x) &= (s + t(p-s))^\top \nabla f(x)\\
> &= (1-t)\beta + t\alpha < 0 \quad t \in [0,1]
> \end{align*}
> $$
> Asimismo, definamos la función
> $$
> \begin{align*}
> \xi (t) = r(t)^\top \nabla f(x) && \xi :[0,1] \to \R
> \end{align*}
> $$
> Y notemos que es continua, $\xi(0) = \beta​$ y $\xi(1) = \alpha​$. Asi pues, como $\gamma \in (\alpha, \beta)​$ se sigue del TVI que existe $t^*\in(0,1)​$ tal que $\xi(t^*) = \gamma​$, de esta forma tomemos $p^{**} = s + t^*(p-s)​$. Concluimos obteniendo $p^* = \frac{p^{**}}{\Vert p^{**} \Vert}​$ $_\square​$ 
>



---

###### Ejercicio 7.

Sean $x, p, s \in \R^n$ tales que $\nabla f(x)^\top p = \alpha < b = \nabla f(x)^\top s < 0$, con $\Vert p \Vert = \Vert s \Vert = 1$. Para $\gamma \in (\alpha, \beta)$ costruya un vector $p^*$ tal que 
$$
\nabla f(x)^\top p ^* = \gamma \quad y \quad \Vert p^* \Vert = 1
$$

> ###### Demostración
>
> Basta tomar
> $$
> r(t) = s + t(p - s) \quad t \in [0,1] \nonumber
> $$
> Luego
> $$
> \begin{align*}
> r(t)^\top \nabla f(x) &= (s + t(p-s))^\top \nabla f(x)\\
> &= (1-t)\beta + t\alpha < 0 \quad t \in [0,1]
> \end{align*}
> $$
> Asimismo, definamos la función
> $$
> \begin{align*}
> \xi (t) = r(t)^\top \nabla f(x) && \xi :[0,1] \to \R
> \end{align*}
> $$
> Y notemos que es continua, $\xi(0) = \beta$ y $\xi(1) = \alpha$. Asi pues, como $\gamma \in (\alpha, \beta)$ se sigue del TVI que existe $t^*\in(0,1)$ tal que $\xi(t^*) = \gamma$, de esta forma tomemos $p^{**} = s + t^*(p-s)$. Concluimos obteniendo $p^* = \frac{p^{**}}{\Vert p^{**} \Vert}$ $_\square$ 
>
> 

---

###### Ejercicio 8

Demuestre que el problema
$$
\min_{\Vert p \Vert_1 = 1} \nabla f(x)^\top p
$$
Tiene como soluciones a los vectores canónicos $p^* = \pm e_i​$, tales que $\nabla f(x)^\top p^* = - \Vert \nabla f(x) \Vert_\infty​$

> ###### Demostración
>
> Comencemos por recordar que
> $$
> \min_{\Vert p \Vert_1 = 1}\{ \nabla f(x)^\top p\} = - \max_{\Vert p \Vert_1 = 1}\{ - \nabla f(x)^\top p\}
> $$
> Sea $p \in \R^n​$, entonces
> $$
> \begin{align*}
> -\nabla f(x)^\top p &\leq  \vert \nabla f(x)^\top p \ \vert \\ 
> &= \left\vert \sum_{i=1}^n \nabla f(x)_i^\top p_i \right\vert \\
> &\leq \sum_{i=1}^n \left\vert  \nabla f(x)_i^\top p_i \right\vert \\
> &\leq \sum_{i=1}^n \left\vert \ \Vert\nabla f(x)^\top \Vert_\infty  p_i \right\vert \\
> &= \Vert\nabla f(x)^\top \Vert_\infty \sum_{i=1}^n \left\vert \   p_i \right\vert \\
> &= \Vert\nabla f(x)^\top \Vert_\infty
> \end{align*}
> $$

---

###### Ejercicio 9

Demuestre que el problema
$$
\min_{\Vert p \Vert_\infty = 1} \nabla f(x)^\top p
$$
Tiene como soluciones a los vectores canónicos $p^*$ tales que $\Vert p^* \Vert_\infty = 1$ y $\nabla f(x)^\top p^* = - \Vert \nabla f(x) \Vert_1$ 

> ###### Demostración
>
> Comencemos por recordar que
> $$
> \min_{\Vert p \Vert_\infty = 1}\{ \nabla f(x)^\top p\} = - \max_{\Vert p \Vert\infty = 1}\{ - \nabla f(x)^\top p\}
> $$
> Sea $p \in \R^n$ tal que $\Vert p\Vert_\infty = \max_{i} |p_i|=1​$ entonces
> $$
> \begin{align*}
> -\nabla f(x)^\top p &\leq  \vert \nabla f(x)^\top p \ \vert \\ 
> &= \left\vert \sum_{i=1}^n \nabla f(x)_i^\top p_i \right\vert \\
> &\leq \sum_{i=1}^n \left\vert  \nabla f(x)_i^\top p_i \right\vert \\
> &= \sum_{i=1}^n \left\vert  \nabla f(x)_i^\top \right\vert \vert p_i \vert  \\ 
> &\leq \sum_{i=1}^n \left\vert  \nabla f(x)_i^\top \right\vert && \text{Porque } \vert p_i \vert \leq 1 \forall i \\ 
> &= \Vert \nabla f(x)^\top \Vert_1
> \end{align*}
> $$
> ​		n

---

###### Ejercicio 10.

Sea $x \in \R^n​$ tal que $\nabla f(x) \neq 0​$ y $\nabla^2 f(x)​$ es positiva definita. Sea $p^N = - (\nabla^2 f(x))^{-1} \nabla f(x)​$ la dirección de Newton. Demuestre que
$$
\lambda_1 \leq - \frac{\nabla f(x)^\top p^N}{\Vert \nabla f(x) \Vert^2} \quad \text{(1)} \nonumber\\
\lambda_n \geq -\frac{\nabla f(x)^\top p^N}{\Vert \nabla f(x) \Vert^2} \quad \text{(2)}
$$
Donde $\lambda_1, \lambda_n​$ son, respectivamente, el mínimo y el máximo valor propio de $\nabla^2 f(x)^{-1}​$ 

> ###### Demostración
>
> $$
> \begin{align*}
> \frac{\nabla f(x)^\top p^N}{\Vert \nabla f(x) \Vert^2} &= \frac{\nabla f(x)^\top   (\nabla^2 f(x))^{-1} \nabla f(x)}{\Vert \nabla f(x) \Vert^2} \\ \\
> \end{align*}
> $$
>
> Para reducir la notación hagamos $z = \nabla f(x) $ y $\mathbb{A} = \nabla^2 f(x)$. Recordemos que $\nabla^2 f(x)$ es simétrica y, por hipótesis, positiva definida, por el teorema espectral existe una matriz unitaria $\mathbb{U}$ tal que $\mathbb{U}^\top\mathbb{A} \mathbb{U}= \mathbb{D'} $ con $\mathbb{D}'$ una matriz diagonal con los valores propios de $\mathbb{A}$ (positivos) en la diagonal. 
>
> Asimismo, dado que es positiva sus valores propios son positivos y podemos considerar a $\mathbb{D}$ la matriz con los inversos de los valores propios de $\mathbb{A}$ obteniendo $\mathbb{U}^\top \nabla^2 f(x)^{-1} \mathbb{U} =  \mathbb{D}$.
> $$
> \begin{align*}
> \frac{ z^\top   \mathbb{A}^{-1} z}{\Vert z \Vert^2} &= \frac{ z^\top   (\mathbb{U}\mathbb{D'} \mathbb{U}^\top)^{-1} z}{\Vert z \Vert^2} \\
> &= \frac{ z^\top \mathbb{U}(\mathbb{D'})^{-1} \mathbb{U}^\top z}{\Vert z \Vert^2} \\
> &= \frac{ (z^\top \mathbb{U}) (\mathbb{D}) (z^\top \mathbb{U})^\top }{\Vert z \Vert^2} \\
> &= \frac{\sum_{i=1}^n \lambda_i (z^\top \mathbb{U})_i^2}{\Vert z \Vert^2}
> \end{align*}
> $$
> Para demostrar (1) procedemos de la siguiente manera
> $$
> \begin{align*}
> \frac{\sum_{i=1}^n \lambda_i (z^\top \mathbb{U})_i^2}{\Vert z \Vert^2} &\geq \frac{\min_i{\lambda_i} \sum_{i=1}^n  (z^\top \mathbb{U})_i^2}{\Vert z \Vert^2} \\
> &= \frac{\min_i{\lambda_i} \sum_{i=1}^n  |(z^\top \mathbb{U})_i|^2}{\Vert z \Vert^2} \\
> &= \frac{\min_i{\lambda_i} \Vert z^\top \mathbb{U}\Vert^2}{\Vert z \Vert^2} \\
> &= \frac{\min_i{\lambda_i} \Vert z^\top\Vert^2}{\Vert z \Vert^2} && \text{Puesto que } \mathbb{U} \text{ es unitaria}\\
> &= \min_i{\lambda_i}\\
> &= \lambda_1
> \end{align*}
> $$
> Para demostrar (2) procedemos de manera análoga
> $$
> \begin{align*}
> \frac{\sum_{i=1}^n \lambda_i (z^\top \mathbb{U})_i^2}{\Vert z \Vert^2} &\leq \frac{\max_i{\lambda_i} \sum_{i=1}^n  (z^\top \mathbb{U})_i^2}{\Vert z \Vert^2} \\
> &= \frac{\max_i{\lambda_i} \sum_{i=1}^n  |(z^\top \mathbb{U})_i|^2}{\Vert z \Vert^2} \\
> &= \frac{\max_i{\lambda_i} \Vert z^\top \mathbb{U}\Vert^2}{\Vert z \Vert^2} \\
> &= \frac{\max_i{\lambda_i} \Vert z^\top\Vert^2}{\Vert z \Vert^2} && \text{Puesto que } \mathbb{U} \text{ es unitaria}\\
> &= \max_i{\lambda_i} \\
> &= \lambda_n
> \end{align*}
> $$
> 



---











