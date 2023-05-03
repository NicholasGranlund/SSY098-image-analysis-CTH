function [w, w0] = process_epoch_seq(w, w0, lrate, examples_train, labels_train)
    % PROCESS_EPOCH_SEQ
    % By: Nicholas Granlund
        

    % Iterate through the training examples in sequence. 1,2,3...
    for i=1:length(examples_train)

        % The index
        j = i;

        % Extract example and label
        example_train = examples_train{j};
        label_train = labels_train(j);

        % Compute partial gradient
        [wgrad, w0grad] = partial_gradient(w, w0, example_train, label_train);

        % Update w and bias w0
        w0 = w0 - (lrate * w0grad);
        w = w - (lrate * wgrad);
    end
end

