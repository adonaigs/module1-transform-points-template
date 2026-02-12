%% TEST_TRANSFORM  Test suite for transform_points.m
%  Run this script to check your implementation:
%    >> test_transform
%
%  Target: 6/6 tests passing before submission.

clc;
fprintf('=== transform_points.m Test Suite ===\n\n');

passed = 0;
failed = 0;
total  = 6;
tol    = 1e-6;  % Tolerance for floating-point comparison

% Define a unit square for testing
%   (0,0) -- (1,0) -- (1,1) -- (0,1)
square = [0 1 1 0;
          0 0 1 1];

% =====================================================================
% TEST 1: Rotation by 90 degrees
% =====================================================================
% Rotating [1; 0] by 90 degrees should give [0; 1]
% Rotating the unit square 90 degrees CCW:
%   (0,0) -> (0,0),  (1,0) -> (0,1),  (1,1) -> (-1,1),  (0,1) -> (-1,0)
try
    result = transform_points(square, 'rotation', 90);
    expected = [0  0 -1 -1;
                0  1  1  0];
    if all(abs(result - expected) < tol, 'all')
        fprintf('  [PASS] Test 1: Rotation by 90 degrees\n');
        passed = passed + 1;
    else
        fprintf('  [FAIL] Test 1: Rotation by 90 degrees\n');
        fprintf('         Expected:\n');
        disp(expected);
        fprintf('         Got:\n');
        disp(result);
        failed = failed + 1;
    end
catch e
    fprintf('  [ERROR] Test 1: Rotation by 90 degrees\n');
    fprintf('          %s\n', e.message);
    failed = failed + 1;
end

% =====================================================================
% TEST 2: Rotation by 45 degrees
% =====================================================================
% Rotating [1; 0] by 45 degrees should give [sqrt(2)/2; sqrt(2)/2]
try
    point = [1; 0];
    result = transform_points(point, 'rotation', 45);
    expected = [cos(deg2rad(45)); sin(deg2rad(45))];
    if all(abs(result - expected) < tol, 'all')
        fprintf('  [PASS] Test 2: Rotation by 45 degrees\n');
        passed = passed + 1;
    else
        fprintf('  [FAIL] Test 2: Rotation by 45 degrees\n');
        fprintf('         Expected: [%.6f; %.6f]\n', expected(1), expected(2));
        fprintf('         Got:      [%.6f; %.6f]\n', result(1), result(2));
        failed = failed + 1;
    end
catch e
    fprintf('  [ERROR] Test 2: Rotation by 45 degrees\n');
    fprintf('          %s\n', e.message);
    failed = failed + 1;
end

% =====================================================================
% TEST 3: Scaling by [2, 3]
% =====================================================================
% Each x-coordinate doubles, each y-coordinate triples
try
    result = transform_points(square, 'scaling', [2, 3]);
    expected = [0 2 2 0;
                0 0 3 3];
    if all(abs(result - expected) < tol, 'all')
        fprintf('  [PASS] Test 3: Scaling by [2, 3]\n');
        passed = passed + 1;
    else
        fprintf('  [FAIL] Test 3: Scaling by [2, 3]\n');
        fprintf('         Expected:\n');
        disp(expected);
        fprintf('         Got:\n');
        disp(result);
        failed = failed + 1;
    end
catch e
    fprintf('  [ERROR] Test 3: Scaling by [2, 3]\n');
    fprintf('          %s\n', e.message);
    failed = failed + 1;
end

% =====================================================================
% TEST 4: Translation by [5, -3]
% =====================================================================
% Every point shifts right 5, down 3
try
    result = transform_points(square, 'translation', [5, -3]);
    expected = [5 6 6 5;
               -3 -3 -2 -2];
    if all(abs(result - expected) < tol, 'all')
        fprintf('  [PASS] Test 4: Translation by [5, -3]\n');
        passed = passed + 1;
    else
        fprintf('  [FAIL] Test 4: Translation by [5, -3]\n');
        fprintf('         Expected:\n');
        disp(expected);
        fprintf('         Got:\n');
        disp(result);
        failed = failed + 1;
    end
catch e
    fprintf('  [ERROR] Test 4: Translation by [5, -3]\n');
    fprintf('          %s\n', e.message);
    failed = failed + 1;
end

% =====================================================================
% TEST 5: Rotation preserves distances
% =====================================================================
% The distance from the origin should be unchanged after any rotation.
% Test with a triangle at various distances from the origin.
try
    triangle = [3 -1 2;
                4  7 -5];
    result = transform_points(triangle, 'rotation', 137);
    orig_dists = sqrt(sum(triangle.^2, 1));  % Distance of each point from origin
    new_dists  = sqrt(sum(result.^2, 1));
    if all(abs(orig_dists - new_dists) < tol)
        fprintf('  [PASS] Test 5: Rotation preserves distances from origin\n');
        passed = passed + 1;
    else
        fprintf('  [FAIL] Test 5: Rotation preserves distances from origin\n');
        fprintf('         Original distances: [%.4f, %.4f, %.4f]\n', orig_dists);
        fprintf('         Rotated distances:  [%.4f, %.4f, %.4f]\n', new_dists);
        failed = failed + 1;
    end
catch e
    fprintf('  [ERROR] Test 5: Rotation preserves distances from origin\n');
    fprintf('          %s\n', e.message);
    failed = failed + 1;
end

% =====================================================================
% TEST 6: Scaling changes area by sx * sy
% =====================================================================
% A unit square has area 1. Scaling by [2, 3] should give area 6.
% We check this by computing the area using the Shoelace formula.
try
    scaled = transform_points(square, 'scaling', [2, 3]);
    % Close the polygon (repeat first vertex)
    x = [scaled(1,:), scaled(1,1)];
    y = [scaled(2,:), scaled(2,1)];
    % Shoelace formula for polygon area
    area = abs(sum(x(1:end-1).*y(2:end) - x(2:end).*y(1:end-1))) / 2;
    expected_area = 2 * 3 * 1;  % sx * sy * original_area
    if abs(area - expected_area) < tol
        fprintf('  [PASS] Test 6: Scaling area = sx * sy * original area\n');
        passed = passed + 1;
    else
        fprintf('  [FAIL] Test 6: Scaling area = sx * sy * original area\n');
        fprintf('         Expected area: %.2f\n', expected_area);
        fprintf('         Got area:      %.2f\n', area);
        failed = failed + 1;
    end
catch e
    fprintf('  [ERROR] Test 6: Scaling area = sx * sy * original area\n');
    fprintf('          %s\n', e.message);
    failed = failed + 1;
end

% =====================================================================
% SUMMARY
% =====================================================================
fprintf('\n=== Results: %d/%d passed', passed, total);
if passed == total
    fprintf(' — ALL TESTS PASSING! Ready to submit.\n');
else
    fprintf(', %d failed. Keep working!\n', failed);
end
fprintf('===\n');
