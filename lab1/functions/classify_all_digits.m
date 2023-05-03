% Script by: Nicholas Granlund

% Start counter for the amount of tested and correct digits
tested = 0;
correct = 0;

% iterate through the validation set
for i=1:length(digits_validation)
    % Extract correct label
    correct_label = digits_validation(i).label;

    % Determine the label through classification
    label = classify_digit(digits_validation(i).image, [20 20], 6, digits_training);

    % If correct, increment correct
    if correct_label == label
        correct = correct +1;
    end

    % increment tested
    tested = tested + 1;

end

% Display the percentage of correct classifications
percentage = correct / tested;
disp(['Correct classification: ' num2str(percentage*100) '%'])
