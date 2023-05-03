function predicted_labels = classify(examples_val,w,w0)
    % CLASSIFY
    % By: Nicholas Granlund

    % Initialize the predicted labels
    predicted_labels = zeros(1,length(examples_val));

    % Iterate through the validation data
    for i=1:length(examples_val)

        % Extract image from validation data
        I = examples_val{i};

        % Compute y = (I * w) + w0
        y = sum(dot(I,w)) + w0;

        % Compute p
        p = exp(y) / (1 + exp(y));

        % Determine predicted label
        predicted_labels(i) = round(mean(p,'all'));
    end
end
