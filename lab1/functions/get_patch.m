function patch = get_patch(image, x, y, patch_radius)
% get_patch
% By: Nicholas Granlund

% Check if patch is within the boundaries of the image.
if y-patch_radius < 1 || y+patch_radius > size(image,1)
    error('ERROR: Patch outside image border (y-direction)')
elseif x-patch_radius < 1 || x+patch_radius > size(image,2)
    error('ERROR: Patch outside image border (x-direction)')
end

% Extract the patch from the image 
patch = image(y-patch_radius:y+patch_radius, x-patch_radius:x+patch_radius);

end

