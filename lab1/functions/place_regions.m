function region_centres = place_regions(centre, radius)
% place_regions
% By: Nicholas Granlund

% Initialize the matrix for the centres
region_centres = zeros(2,9);

% This is not the prettiest code, but it does the job
region_centres(1,1) = centre(1)-2*radius;
region_centres(2,1) = centre(2)+2*radius;

region_centres(1,2) = centre(1);
region_centres(2,2) = centre(2)+2*radius;

region_centres(1,3) = centre(1)+2*radius;
region_centres(2,3) = centre(2)+2*radius;

region_centres(1,4) = centre(1)-2*radius;
region_centres(2,4) = centre(2);

region_centres(1,5) = centre(1);
region_centres(2,5) = centre(2);

region_centres(1,6) = centre(1)+2*radius;
region_centres(2,6) = centre(2);

region_centres(1,7) = centre(1)-2*radius;
region_centres(2,7) = centre(2)-2*radius;

region_centres(1,8) = centre(1);
region_centres(2,8) = centre(2)-2*radius;

region_centres(1,9) = centre(1)+2*radius;
region_centres(2,9) = centre(2)-2*radius;

end

