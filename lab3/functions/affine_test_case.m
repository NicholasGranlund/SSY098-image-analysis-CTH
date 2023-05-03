function [pts, pts_tilde, A_true, t_true] = affine_test_case()
    % AFFINE_TEST_CASE
    % By: Nicholas Granlund

    % ------------------------------------------------------------------
    % This Matlab™ function is correlated to the affine transformation:
    % x~ = A*x + t
    
    % x:    point(s)
    % A:    linear transformation matrix
    % t:    translational vector

    % ------------------------------------------------------------------
    
    % Number of data points
    N = 100;

    % Random point noise
    rand_noise = 0*rand(2,N);           % <-- Insert noise here

    % Generate a random 2x2 A matrix
    A_true = rand(2);

    % Generate a random 2x1 transform matrix
    t_true = rand([2, 1]) * 10;

    % Generate 2xN random points
    pts = rand([2, N]);

    % Generate affine transformation
    pts_tilde = (A_true * pts) + t_true + rand_noise;

    % return
    
end