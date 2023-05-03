function errors = reprojection_errors(Ps, us, U)
    % REPROJECTION_ERRORS
    % By: Nicholas Granlund

    % Number of cameras
    N_cam = length(Ps);

    % Call check_depths() function
    positive = check_depths(Ps, U);
    
    % Instantiate 'errors' vector
    errors = zeros(N_cam,1);
    
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

            % Compute length of reprojection error
            errors(i) = sqrt(sum(residual_vec).^2);

        else
            % If point has negative depth, infinite error
            errors(i) = inf;

        end
    
    end

    % return
end