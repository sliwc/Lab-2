function [X, traj, f, k, Err] = Lab_2_sdm(x0,tol)
k = 0; ea = 1;
X = x0; 
traj = [];
f = Lab_2_Fun(0,0);
Err = NaN;
%x = 0; y = 0; tol = 10^-4; X = [x y];
x = X(1); y = X(2);
while ea > tol
    % evaluate gradient
    dx = 4*x^3 +4*x*y - 42*x + 2*y^2 - 14;
    dy = 4*y^3 - 26*y + 4*x*y + 2*x^2 - 22;
    grad = [dx; dy];

    % evaluate hessian
    ddx = 12*x^2 +4*y - 42;
    ddy = 12*y^2 + 4*x - 26;
    dxdy = 4*x + 4*y;
    hess = [ddx dxdy; dxdy ddy];

    %evaluate step size
    gradt = transpose(grad);
    hesst = [ddy -dxdy; -dxdy ddx];
    hdet = ddy*ddx - (-dxdy)^2;
    h = hesst/hdet;
    h = det(h);

    %Evaluate Steepest Descent Formula
    nextx = x-grad.*h;
    nexty = y-grad.*h;
    xnew = [nextx nexty];

    %store solution in a vector
    traj = [traj xnew];
    k = k+1;
    % Evaluate error
    ea = norm(xnew-X);
    Err = [Err ea];
    X = xnew;
    f(k+1) = Lab_2_Fun(X(1),X(2));
end

