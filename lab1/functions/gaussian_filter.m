function new_image = gaussian_filter(image, sigma)
% gaussian_filter
% By: Nicholas Granlund

% Set filter size (at least 4*std)
size = round(4*sigma);

% Create gaussian filter with std and filtersize
gaussianfilter = fspecial('gaussian',size,sigma);

% Return new filtered image
new_image = imfilter(image,gaussianfilter,'symmetric');


end

