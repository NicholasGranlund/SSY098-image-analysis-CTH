% REFINE_DUOMO
% By: Nicholas Granlund

% Amount of inliers
N = length(inl);

% Initialize the matrices to save data
Uref = zeros(3,N);
colors_inliers = zeros(N,3);

% Iterate through SIFT features
for i = 1:N
    index = inl(i);

    % Refine the estimation U
    Uref(:,i) = refine_triangulation(Ps, [u(:,index), u_tilde(:,index)], Uc(:,1));

    % Reconstruct color for SIFT feature
    colors_inliers(i,:) = colorsSIFT(index,:);
end

% Clean up
[Uref,removed_indices] = clean_for_plot(Uref);
colors_inliers = colors_inliers(~removed_indices,:);

% Plot scatter with color
figure()
s = 6;
scatter3(Uref(1,:),Uref(2,:),Uref(3,:),s,colors_inliers,'filled')

% Fix axis and view
xlim([-7 6])
ylim([-4 4])
zlim([9 16])
view([-45,-50])
camroll(45)
axis equal
title('Refined Duomo + colors','(Cattedrale di Santa Maria del Fiore)')
