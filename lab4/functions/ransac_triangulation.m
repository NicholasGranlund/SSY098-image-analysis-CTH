function [U, nbr_inliers] = ransac_triangulation(Ps, us, threshold) 
    % RANSAC_TRIANGULATION
    % By: Nicholas Granlund
   
    % Number of cameras
    N_cam = length(Ps);

    % Instantiate U
    U = zeros(3,N_cam);

    % Determine number of samples for each iteration 
    % has to be 2!
    N_samples = 2;

    % -----------------------------------
    % RANSAC parameters
    nbr_inliers = 0;
    eta = 0.95;
    k_max = inf;
    k = 0;
    success = true;
    % -----------------------------------

    % While it will be beneficial to keep searching for better fit
    % keep searching...
    % Also, if the RANSAC goes on for too long, break
    while k < k_max && k < 100
        
        % increment the iteration counter
        k = k+1;

        % pick N_sample random cameras and use as sample
        i = randperm(N_cam, N_samples);

        % Extract camera matrices and 2D points
        sample_ps = Ps(i);
        sample_us = us(:,i);
    
        % Estimate 3D point with minimal_triangulation()
        U_min = minimal_triangulation(sample_ps, sample_us);
    
        % Calculate the reprojection_error
        res = reprojection_errors(Ps, us, U_min);
    
        % Count number of inliers
        N_inliers = sum(res<threshold);
    
        % Check if this estimated 3D points has more number of inliers than
        % previous best
        if N_inliers > nbr_inliers
    
            % Update best number of inliers
            nbr_inliers = N_inliers;

            % Update U
            U = U_min;

            % Calculate inlier ratio epsilon
            eps = N_inliers/N_cam;

            % Compute maximum number of iterations
            k_max = round( abs( log(1-eta) / log(1-(eps.^N_samples))));

        end

    end

    % return

end