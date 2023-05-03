function [A, t] = least_squares_affine(pts, pts_tilde)
    % LEAST_SQUARES_AFFINE
    % By: Nicholas Granlund

    % Luckily, estimate_affine() alreade solves in LS means
    [A,t] = estimate_affine(pts, pts_tilde);
    
    % return

end