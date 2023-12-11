clear
clc

% Define symbolic variables
syms d bpada s

% Define the equations
bpada = (5 * exp(-d^2 / (2 * s^2))) / (s * sqrt(2 * pi));
%TS = 91.53295 + (24 * bpada);

% Create a range of d values
d_values = linspace(0.001, 15, 100);

% Vary s between 0.5 to 10
s_values = linspace(0.5, 10, 100);

% Create a meshgrid for d and s
[d_mesh, s_mesh] = meshgrid(d_values, s_values);

% Evaluate the equations for each combination of d and s
bpada_values = double(subs(bpada, {d, s}, {d_mesh, s_mesh}));
%TS_values = double(subs(TS, {d, s}, {d_mesh, s_mesh}));

% Plot the 3D gradient graph with the 'winter' colormap
figure;
scatter3(d_mesh(:), s_mesh(:), bpada_values(:), 20, bpada_values(:), 'filled');
colormap(winter);
title('3D Gradient Graph of Bpada');
xlabel('d');
ylabel('s');
zlabel('Bpada');
grid on;
colorbar;
