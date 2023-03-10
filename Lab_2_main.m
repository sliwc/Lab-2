clear;
close all;
tol = 10^-4;
% Define call function numerically
[x1,y1] = meshgrid(-5:0.1:5,-5:0.1:5);
f = Lab_2_Fun(x1,y1);
z = meshgrid(f);
% Plot surface
surface = figure; figure(surface);
surf(x1,y1,z); shading interp;

% Initial guess
x0 = [0,0];

% Call methods
[X,traj,Z,k,Err] = Lab_2_sdm(x0,tol);
%[X,traj,Z,k,Err] = Lab_2_Newton(x0,tol);

%fix traj size
traj(:,[2,3,4,5]) = [];
%traj(:,[2,4,6,8,10,12,14,16,18,20,22]) = [];

%Add trajectory for finding minima (3D plot)
plot3(traj(1,:), traj(2,:), Z(1,:) ,'-k+');

% Plot contour (2D plot)
contour_graph = figure; figure(contour_graph);
contour(x1,y1,f,100); hold on;
plot(X(1,:), X(2,:), '-k+');