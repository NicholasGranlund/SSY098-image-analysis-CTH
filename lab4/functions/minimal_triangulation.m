function U = minimal_triangulation(Ps, us)
    % MINIMAL_TRIANGULATION
    % By: Nicholas Granlund

    % Initialize matrix A
    A = zeros(4, 4);
    
    % Iterate through the cameras
    for i = 1:length(Ps)

        % Camera matrix
        P = Ps{i};

        % 2D point
        u = us(:,i);

        % Construct A matrix for Ax = 0
        A(i*2-1:i*2,:) = u * P(3,:) - P(1:2,:);
    end
    
    % Find singular value decomposition of matrix A
    [~,~,V] = svd(A);
    
    % Calculate Homogenous 3D point
    % (solution to Ax = 0 is last column of V)
    U = V(1:3,end) / V(4,end);

    % return

end