
 # Can we solve $2y+x=4$ for $x$?

 # The temping answer is: not without another equation.
 # A more useful answer is: not without <a href="https://en.wikipedia.org/wiki/Regularization">another constraint</a>.

 # (Edit, then shift+enter to compute. Save to share as gist.)
 # (Application to <a href="http://stemblab.github.io/cs-intro/">compressive sensing</a> at end.)

 # Let's plot $2y+x=4$ in fig1.

fig1 = figure
    xlabel: "x"
    ylabel: "y"

x = linspace -2, 4, 100 #;
y = (x) -> 2 - x/2 #;
plot x, y(x), fig:fig1

 # If we <b>do</b> have another equation, $x^2+y^2=r^2$ say,  we can
 # solve for the two intersections in fig2. With $r=2$:

fig2 = figure
    xlabel: "x"
    ylabel: "y"

r = 2 #;
c = (x) -> sqrt(r*r - x*x) #;
plot x, [y(x), c(x)], fig:fig2

 # An alternative is to choose the <i>least possible</i> $r$
 # (i.e., where the circle just touches the line).
 # You can experiment with $r$ above to find it ($\approx 1.8$).

 # Lets rephrase. Let $v=[x~y]^T$ be a vector. We find a
 # <i>unique</i> solution of $2y+x=4$, if we minimize
 # $||v||_2=x^2+y^2$. A simple example, but a powerful idea.
 
 # One application is <a href="https://en.wikipedia.org/wiki/Compressed_sensing">compressive sensing</a>. Consider solving
 # while minimizing the <a href="https://en.wikipedia.org/wiki/Norm_(mathematics)">Manhattan norm</a> $||v||_1=|x|+|y|$ (fig3).

fig3 = figure
    xlabel: "x"
    ylabel: "Manhattan norm"

l0 = (x) -> abs(x) + abs(2-x/2) #;
plot x, l0(x), fig:fig3

 # The Manhattan norm picks $x=0$, $y=2$ &mdash; which is also the
 # solution with the largest number of zeros (most sparse).
 # Compressive sensing is all about finding sparse solutions.

 # Say we have a quadratic $y=a_0+a_1x+a_2x^2$, and two known
 # points $(x_1,y_1)$ and $(x_2, y_2)$. Our linear system to
 # interpolate is
 #
 # $\begin{bmatrix}1 & x_1 & x_1^2 \\ 1 & x_2 & x_2^2\end{bmatrix} \begin{bmatrix}a_0\\a_1\\a_2\end{bmatrix} = \begin{bmatrix}y_1 \\ y_2\end{bmatrix}$
 #
 #
 # 
 # We can solve for the most sparse $[a_0~a_1~a_2]^T$ with the
 # Manhattan norm, as illustrated <a href="http://stemblab.github.io/cs-intro/">here</a>.
