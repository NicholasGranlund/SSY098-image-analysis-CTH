function label = classify_digit(digit_image, position, radius, digits_training)
% classify_digit
% By: Nicholas Granlund

% The current highest acchieved similarity
highest_sim = 0;

% The image gradient descriptor
I = gradient_descriptor(digit_image, position, radius);

% Iterate through the trained digits
for i=1:length(digits_training)
 
    % Extrac the descriptor from the current image
    J = digits_training(i).descriptor;

    % calculate similarit with dot product
    sim = dot(I,J);

    % check if similarity is higher than previous highest
    if sim > highest_sim

        % store the label of the highest similar digit
        label = digits_training(i).label;
        
        % update the highest achieved similarity
        highest_sim = sim;
    end

end

