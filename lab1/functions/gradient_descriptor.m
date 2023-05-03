function desc = gradient_descriptor(image, position, radius)
% gradient_descriptor
% By: Nicholas Granlund
 
% Initialize the desc vector
desc = zeros(1,72);

% Compute gaussian gradient for the image (std = radius)
[grad_x, grad_y] = gaussian_gradients(image, radius);

% Divide gradient into 3x3 regions
region_centres = place_regions(position, radius);

% iterate over the regions
for i=1:length(region_centres)

    % Extract the gradients from the specific region
    grad_x_reg = get_patch(grad_x, region_centres(1,i), region_centres(2,i), radius);
    grad_y_reg = get_patch(grad_y, region_centres(1,i), region_centres(2,i), radius);

    % Create bins from the gradients in the regions
    histogram = gradient_histogram(grad_x_reg, grad_y_reg);

    % Stack the bins in the descriptor vector
    desc(((i-1)*8)+1:i*8) = histogram;

end

% Normalize the descriptor vector
desc = desc / norm(desc);
end
