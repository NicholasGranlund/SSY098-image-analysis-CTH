function all_residuals = compute_residuals(Ps, us, U)
    % COMPUTE_RESIDUALS
    % By: Nicholas Granlund

    % this function is more or less an adaptation of the function
    % reprojection_error. But is altered to allow for the 2Nx1 output...

    % Number of cameras
    N_cam = length(Ps);

    % Call check_depths() function
    positive = check_depths(Ps, U);
    
    % Initialize 'errors' vector
    all_residuals = zeros(2*N_cam,1);
    
    for i=1:N_cam
    
        % If point has positive depth, continue
        if positive(i)

            % Extract each row from camera matrix               (10.5)
            a = Ps{i}(1,:);
            b = Ps{i}(2,:);
            c = Ps{i}(3,:);

            % Calculate depth lambda (c^T * Uhat)               (10.7)
            lambda = c*[U;1];

            % Calulate the reprojection (a^T*Uhat / lambda)     (10.8)
            xhat = a*[U;1] / lambda;
            yhat = b*[U;1] / lambda;

            % Compute the resiudal vector                       (10.9)
            residual_vec = [xhat;yhat] - us(:,i);

            % Save to array
            all_residuals((2*i)-1:2*i) = residual_vec;

        % If point has negative depth, infinite error
        else
        
            all_residuals((2*i)-1:2*i) = inf;

        end
    
    end

    % return

end

