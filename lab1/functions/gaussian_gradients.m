function [grad_x, grad_y] = gaussian_gradients(img, std)
% gaussian gradients
% By: Nicholas Granlund

% Applies gaussian filter to image with given std
img = gaussian_filter(img, std);

% Computes the gaussian gradient of said image
[grad_x, grad_y] = gradient(img);
end

