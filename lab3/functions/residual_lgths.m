function res = residual_lgths(A, t, pts, pts_tilde)
    % RESIDUAL_LGTHS    
    % BY: Nicholas Granlund

    % Determine the 
    pts_exact = A * pts + t;

    % Calculate the squared residuals
    res = sum((pts_exact - pts_tilde).^2, 1);

    % Round numbers close to zero as zero... (beyond computer prec)
    res = round(res, 25);

    % return
    
end