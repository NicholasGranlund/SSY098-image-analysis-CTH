% TRIANGULATE_SEQUENCE
% By: Nicholas Granlund

% Load struct 'triangulation_examples'
load sequence.mat

% Set threshold for RANSAC
threshold = 5;

% Set amount of triangulations to compute
N = length(triangulation_examples);

% initalize vector Us.
% not possible to predefine size of this vector
% since the amount of triangulated points with at least 2
% inliers is unknown...
Us = [];

% Iterate through N points
for i=1:N
    
    % Extract the i-th camera matrices ps
    ps = triangulation_examples(i).Ps;

    % Extract the i-th image points us
    us = triangulation_examples(i).xs;

    % Triangulate
    [U, nbr_inliers] = ransac_triangulation(ps, us, threshold);

    % Store triangulated points with at least 2 inliers
    if nbr_inliers >= 2
        Us = [Us U];
    end
end

% end of script

