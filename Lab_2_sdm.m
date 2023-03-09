function [X, traf, f, k, Err] = Lab_2_sdm(x0,tol);
k = 0; ea  =1;
X = x0; traj = [];
f(0,0) = Lab_2_Fun;
Err = NaN;
While ea > tol,
    % evaluate gradient
    dx = 4*x^3 - 42*x + y^2 - 14;
    dy = 4*y^3 - 26*y + 2*x*y - 22;
    grad = [dx dy];

    % evaluate hessian
    ddx = 12*x^2 - 42;
    ddy = 12*y^2 - 26;
    dxdy = 2*y;
    hess = [ddx dxdy, dxdy ddy];
    %evaluate step size
    gradt = transpose(grad);
    h_upper = gradt*grad;
    h_lower = gradt*hess*grad;
    h = abs(h_upper/h_lower);

    %Evaluate Steepest Descent Formula
    nextx = x-grad*h;
    nexty = y-grad*h
    xnew = [nextx, nexty];

    %store solution in a vector
    traj = [traj xnew];
    k = k+1;
    % Evaluate error
    ea = norm(xnew-X);
    Err = [Err ea];
    X = xnew;
    f(k+1) = Lab_2_Fun(X);
end
