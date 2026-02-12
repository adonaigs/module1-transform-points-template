function new_points = transform_points(points, type, T)
% TRANSFORM_POINTS  Apply a geometric transformation to 2D points.
%
%   new_points = transform_points(points, type, T)
%
%   Inputs:
%     points - 2xN matrix where each column is a 2D point [x; y]
%     type   - string specifying the transformation:
%                'rotation'    : rotate counterclockwise
%                'scaling'     : scale each axis independently
%                'translation' : shift all points by an offset
%     T      - transformation parameter:
%                'rotation'    : angle in degrees (scalar)
%                'scaling'     : [sx, sy] scale factors (1x2 vector)
%                'translation' : [tx, ty] translation offset (1x2 vector)
%
%   Output:
%     new_points - 2xN matrix of transformed points (same size as input)
%
%   Examples:
%     % Rotate a unit square 90 degrees counterclockwise
%     square = [0 1 1 0; 0 0 1 1];
%     rotated = transform_points(square, 'rotation', 90);
%
%     % Scale by 2x horizontally, 3x vertically
%     scaled = transform_points(square, 'scaling', [2, 3]);
%
%     % Translate right by 5, down by 3
%     shifted = transform_points(square, 'translation', [5, -3]);

% =========================================================================
% YOUR CODE BELOW — Implement each transformation type
% =========================================================================

if strcmp(type, 'rotation')
    % -----------------------------------------------------------------
    % ROTATION
    % -----------------------------------------------------------------
    % Steps:
    %   1. Convert the angle from degrees to radians using deg2rad()
    %   2. Build the 2x2 rotation matrix:
    %        R = [cos(theta)  -sin(theta);
    %             sin(theta)   cos(theta)]
    %   3. Multiply R * points to get the rotated points
    % -----------------------------------------------------------------

    % TODO: Implement rotation here


    new_points = points;  % Placeholder — replace with your code

elseif strcmp(type, 'scaling')
    % -----------------------------------------------------------------
    % SCALING
    % -----------------------------------------------------------------
    % Steps:
    %   1. Extract sx and sy from T:  sx = T(1);  sy = T(2);
    %   2. Build the 2x2 scaling matrix:
    %        S = [sx  0;
    %              0  sy]
    %   3. Multiply S * points to get the scaled points
    % -----------------------------------------------------------------

    % TODO: Implement scaling here


    new_points = points;  % Placeholder — replace with your code

elseif strcmp(type, 'translation')
    % -----------------------------------------------------------------
    % TRANSLATION
    % -----------------------------------------------------------------
    % Steps:
    %   1. Extract tx and ty from T:  tx = T(1);  ty = T(2);
    %   2. Create an offset matrix the same size as points
    %      Hint: use repmat([tx; ty], 1, size(points, 2))
    %   3. Add the offset to points
    % -----------------------------------------------------------------

    % TODO: Implement translation here


    new_points = points;  % Placeholder — replace with your code

else
    error('Unknown transformation type: "%s". Use ''rotation'', ''scaling'', or ''translation''.', type);
end

end
