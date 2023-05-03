% TRIANGULATE_SEQUENCE_DUOMO
% By: Nicholas Granlund

% Load struct 'duomo'
% load duomo.mat

% Gather the camera matrices
Ps = {P,P_tilde};

% Set threshold for RANSAC
threshold = 2;

% Set amount of triangulations to compute
N = length(matches);

Us = [];
inl = [];

% Iterate through N points
for i=1:N

    % Extract the i'th image points us
    us = [u(:,i) , u_tilde(:,i)];

    % Triangulate the SIFT feature position in 3D
    [U, nbr_inliers] = ransac_triangulation(Ps, us, threshold);

    % Save triangulated points with at least 2 inliers
    if nbr_inliers >= 2
        Us = [Us U];
        inl = [inl i];
    end
end

% Clean up the points
Uc = clean_for_plot(Us);

% Plot
figure()
s = 6;
scatter3(Uc(1,:),Uc(2,:),Uc(3,:),s) 

% Fix axis and view
xlim([-7 6])
ylim([-4 4])
zlim([9 16])
view([-45,-50])
camroll(46)
axis equal
title('Unrefined Duomo','(Cattedrale di Santa Maria del Fiore)')

% Script done


