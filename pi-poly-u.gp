set term png
set o "pi-poly-u.png"

set logscale x 2
set logscale y

p "pi-poly-u.res" u  2:5 w lp, 1/x**2
