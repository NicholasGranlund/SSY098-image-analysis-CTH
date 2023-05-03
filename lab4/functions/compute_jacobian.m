function jacobian = compute_jacobian(Ps, U)
    % COMPUTE_JACOBIAN
    % By: Nicholas Granlund
    
    % Get the number of cameras
    N_cam = length(Ps);
    
    % Initialize the Jacobian matrix
    jacobian = zeros(2 * N_cam, 3);
    
    % Loop over the cameras and compute the partial derivatives
    for i = 1:N_cam

        % Extract the camera matrix 
        P = Ps{i};

        % Extract each row from camera matrix               (10.5)
        a = P(1,:);
        b = P(2,:);
        c = P(3,:);
        
        % compute depth lambda                              (10.7)
        lambda = c*[U;1];
        
        % Compute the partial derivatives of the residual w.r.t. the 3D point
        drx_dU = (a(1:3) * lambda - (a * [U;1]) * c(1:3)) / (lambda.^2);
        dry_dU = (b(1:3) * lambda - (b * [U;1]) * c(1:3)) / (lambda.^2);
      
        % Update the Jacobian matrix
        jacobian((2*i)-1:(2*i),:) = [drx_dU;dry_dU];

    end

    % return

end
