function positive = check_depths(Ps, U)
    % CHECK_DEPTHS
    % By: Nicholas Granlund

    % Number of cameras
    N_cam = length(Ps);

    % Initialize 'positive' vector
    positive = zeros(1,N_cam);

    % Iterate through the cameras
    for i=1:N_cam
            
            %   Check depth of point U
            lambda_times_u = Ps{i}*[U;1];

            % lambda_times_u = [lambda*x; lambda*y; lambda]
            % so the depth is third element of u
            lambda = lambda_times_u(3);
    
            % If point depth is negative - false
            if lambda < 0
                positive(i) = 0;
            % If point depth is positive - true
            else 
                positive(i) = 1;
            end
    end

    % return

end