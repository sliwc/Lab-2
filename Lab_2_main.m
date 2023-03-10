clear;
close all;
tol = 10^-4;
% Define call function numerically
[x1,y1] = meshgrid(-5:0.1:5,-5:0.1:5);
f = Lab_2_Fun(x1,y1);
%z = meshgrid(f);


% Initial guess
x0 = [-5;0];

% Call methods
%[X,traj,Z,k,Err] = Lab_2_sdm(x0,tol);
[X,traj,Z,k,Err] = Lab_2_Newton(x0,tol);


% Plot surface
surface = figure; figure(surface);
surf(x1,y1,f); shading interp;
hold on
%Add trajectory for finding minima (3D plot)
plot3(traj(1,:), traj(2,:), Z(1,:) ,'-k+')

% Plot contour (2D plot)
contour_graph = figure; figure(contour_graph);
contour(x1,y1,f,100); 
hold on;
plot(X(1,:), X(2,:), '-k+');

%final point
X
[~,index] = min(Z);
%function evaluation
foptimum = Z(index)
ERRAprox = Err(index)
iterations = k

trajt = transpose(traj);
Zt = transpose(Z);
eat = transpose(Err);

