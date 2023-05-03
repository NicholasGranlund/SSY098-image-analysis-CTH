function U = refine_triangulation(Ps, us, Uhat)
    % REFINE_TRIANGULATION 
    % By: Nicholas Granlund

    % Uhat is the "initial guess" which is the solution found by ransac
    % hence it will be U0
    U = Uhat;

    % Stepsize
    mu = 1;

    % Do a number of iterations to refine
    for i=1:4

        % Compute the residuals for this U
        r = compute_residuals(Ps, us, U);

        % Print residual to verify that it decreases
        % UNCOMMENT IF YOU WANT PRINT
        %fprintf('\nResidual for iter=%.0f:   %.2f\n',i,sum(r.^2))

        % Compute jacobian
        J = compute_jacobian(Ps, U);

        % Calculate new U
        U = U - mu*((J'*J)\J')*r;

        % start over

    end

    % return

end

