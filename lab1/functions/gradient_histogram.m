function histogram = gradient_histogram(grad_x, grad_y)
% gradient_histogram
% By: Nicholas Granlund

% Calculate the angle (given from -pi to pi)
angle = atan2(grad_y,grad_x);
% Calculate the magnitude
magnitude = sqrt(grad_y.^2 + grad_x.^2);
% Define the edges
edges = linspace(-pi,pi,9);

% Detemine the bins for each gradient
[~,~,bin] = histcounts(angle,edges);

% Initialize the histogram vector
histogram = zeros(1,8);

% Iterate through the gradients and sort the magntudes into the correct bin
for i=1:size(bin,1)*size(bin,2)
        histogram(bin(i)) = histogram(bin(i)) + magnitude(i);
end

% Shift bins so it corresponds to [0, 2*pi] instead of [-pi, pi]
histogram = [histogram(5:end), histogram(1:4)];

end

