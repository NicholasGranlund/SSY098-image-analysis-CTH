% Script by: Nicholas Granlund

% Prepare the digits by adding descriptor to the struct digits_training
for i=1:length(digits_training)
    digits_training(i).descriptor = gradient_descriptor(digits_training(i).image, [20, 20], 6);
end
