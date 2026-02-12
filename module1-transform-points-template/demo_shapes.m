%% DEMO_SHAPES  Load sample shapes and visualize transformations.
%  Run this script AFTER you implement transform_points.m to see
%  your transformations in action.
%
%  Usage:
%    >> demo_shapes

clc;
fprintf('=== Sample Shapes Demo ===\n\n');

% Load the sample shapes
data = load('test_data/sample_shapes.mat');
fprintf('Loaded shapes: square, triangle, house, arrow\n\n');

% Pick a shape to demo (change this to try different shapes)
shape = data.square;
shape_name = 'Square';

% Close the polygon for plotting (repeat the first point)
close_shape = @(pts) [pts, pts(:,1)];

% ── Create a 2x2 figure showing all three transformations ──
figure('Name', 'transform_points Demo', 'Position', [100 100 900 700]);

% --- Original ---
subplot(2,2,1);
s = close_shape(shape);
fill(s(1,:), s(2,:), [0.8 0.8 1], 'EdgeColor', 'b', 'LineWidth', 2);
axis equal; grid on;
title(sprintf('Original %s', shape_name));
xlabel('x'); ylabel('y');

% --- Rotation by 45 degrees ---
subplot(2,2,2);
try
    rotated = transform_points(shape, 'rotation', 45);
    r = close_shape(rotated);
    fill(s(1,:), s(2,:), [0.9 0.9 0.9], 'EdgeColor', [0.7 0.7 0.7], 'LineWidth', 1);
    hold on;
    fill(r(1,:), r(2,:), [1 0.8 0.8], 'EdgeColor', 'r', 'LineWidth', 2);
    hold off;
    title('Rotation: 45°');
catch
    title('Rotation: NOT YET IMPLEMENTED');
end
axis equal; grid on;
xlabel('x'); ylabel('y');

% --- Scaling by [2, 0.5] ---
subplot(2,2,3);
try
    scaled = transform_points(shape, 'scaling', [2, 0.5]);
    sc = close_shape(scaled);
    fill(s(1,:), s(2,:), [0.9 0.9 0.9], 'EdgeColor', [0.7 0.7 0.7], 'LineWidth', 1);
    hold on;
    fill(sc(1,:), sc(2,:), [0.8 1 0.8], 'EdgeColor', [0 0.6 0], 'LineWidth', 2);
    hold off;
    title('Scaling: [2, 0.5]');
catch
    title('Scaling: NOT YET IMPLEMENTED');
end
axis equal; grid on;
xlabel('x'); ylabel('y');

% --- Translation by [3, 2] ---
subplot(2,2,4);
try
    translated = transform_points(shape, 'translation', [3, 2]);
    t = close_shape(translated);
    fill(s(1,:), s(2,:), [0.9 0.9 0.9], 'EdgeColor', [0.7 0.7 0.7], 'LineWidth', 1);
    hold on;
    fill(t(1,:), t(2,:), [1 1 0.8], 'EdgeColor', [0.8 0.6 0], 'LineWidth', 2);
    hold off;
    title('Translation: [3, 2]');
catch
    title('Translation: NOT YET IMPLEMENTED');
end
axis equal; grid on;
xlabel('x'); ylabel('y');

sgtitle(sprintf('%s — Before (grey) and After (color)', shape_name), 'FontWeight', 'bold');

fprintf('Demo complete! Try changing "shape = data.square" to:\n');
fprintf('  shape = data.triangle\n');
fprintf('  shape = data.house\n');
fprintf('  shape = data.arrow\n');
