clear
clc

% Define symbolic variables
syms d Wpayload FS

% Define the equation
FS_equation = Wpayload + 8 * (2 + (exp(-d / 4.5)) / (0.3 * sqrt(2 * pi)));

% Create a range of d values
d_values = linspace(0.001, 15, 100);

% Create a range of Wpayload values
Wpayload_values = linspace(4, 13.2, 100);

% Create a meshgrid for d and Wpayload
[d_mesh, Wpayload_mesh] = meshgrid(d_values, Wpayload_values);

% Evaluate the equation for each combination of d and Wpayload
FS_values = double(subs(FS_equation, {d, Wpayload}, {d_mesh, Wpayload_mesh}));

% Plot the 3D graph with the 'winter' colormap matching the DR color scheme
figure;
surf(d_mesh, Wpayload_mesh, FS_values, 'EdgeColor', 'none');
colormap(winter);
title('3D Flight Score Graph');
xlabel('Distance (d)');
ylabel('Water Payload Carried (Wpayload)');
zlabel('Flight Score (FS)');
grid on;
