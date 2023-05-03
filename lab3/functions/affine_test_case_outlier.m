function [pts, pts_tilde, A_true, t_true] = affine_test_case_outlier(outlier_rate)
    % AFFINE_TEST_CASE_OUTLIER
    % By: Nicholas Granlund

   
    % Number of data points
    N = 100;

    % Random point noise
    rand_noise = 0*rand(2,N);           % <-- Insert noise here

    % Number of these data points that will be outliers
    N_outliers = round(N*outlier_rate);

    % Generate a random 2x2 A matrix
    A_true = rand(2);

    % Generate a random 2x1 transform matrix
    t_true = rand([2, 1]) * 10;

    % Generate 2xN random points
    pts = rand([2, N]);

    % Generate affine transformation
    pts_tilde = (A_true * pts) + t_true + rand_noise;

    % ----------------------------------------------------------
    % Choose randomly N_outliers amount of points
    i = randperm(N,N_outliers);

    % Mess them up (uniformly)
    pts_tilde(i) = randn(1,N_outliers);
    % ----------------------------------------------------------

    % return
end