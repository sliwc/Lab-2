clear
close
x = 0;
y = 0;
fx = (x^2 + y - 11)^2 + (x + y^2 - 7)^2;
dx = diff(fx, x);
dy = diff(fx, y);
ddx = 4*x^3 + 4*x*y - 42*x + 2*y^2 - 14;