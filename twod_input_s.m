clear
clc

% Prompt the user to enter the value for s
s_value = input('Enter the value for s: ');

% Define symbolic variables
syms d bpada

% Define the equation for bpada
bpada_equation = (5 * exp(-d^2 / (2 * s_value^2))) / (s_value * sqrt(2 * pi));

% Create a range of d values
d_values = linspace(0.001, 15, 100);

% Evaluate the equation for each d value
bpada_values = double(subs(bpada_equation, d, d_values));

% Plot the 2D graph with the 'winter' colormap
figure;
scatter(d_values, bpada_values, 20, winter(size(d_values, 2)), 'filled');
title('2D Graph of Flight Score');
xlabel('Distance from Center of Landing Zone (d)');
ylabel('PADA Landing Bonus (bpada)');
grid on;
