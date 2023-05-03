function [A,t] = estimate_affine( pts, pts_tilde )
    % ESTIMATE_AFFINE
    % By: Nicholas Granlund


    % --------------------------------------------------------------------
    % The affine transformation
    %[x~; y~] = [a,b;c,d]*[x,y] + [tx;ty] 
    
    % Can be rewritten
    %[x~; y~] = [x,y,0,0,1,0; 0,0,x,y,0,1]*[a;b;c;d;tx;ty]
    % which has the form:   x~ = M*z
    
    % The rewritten form can be solved for the affine transformation
    % parameters a,b,c,d,tx and ty. given known points of x~


    % --------------------------------------------------------------------
    
    % Number of points 2xN
    N = size(pts,2);
    
    % Instantiate M matrix containing initial points size (2*N)x6
    M = zeros(2*N, 6);
    
    for i=1:N
        % Generate M-matrix by iterating through initial points
        M(2*i-1:2*i, :) = [pts(1,i), pts(2,i), 0, 0, 1, 0;
                           0, 0, pts(1,i), pts(2,i), 0, 1];
        
    end
    
    
    % Extract ransformed points
    xtilde = pts_tilde(:);
    
    % Solve the linear equation for parameters a,b,c,d,tx and ty
    x = M \ xtilde;
    
    % Extract elements to determine affine transformation A
    A = [x(1), x(2);
         x(3), x(4)];
    
    % Extract elements to determine translation t
    t = x(5:6);
    
    % return

end