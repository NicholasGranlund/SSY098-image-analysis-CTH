function [wgrad, w0grad] = partial_gradient(w, w0, example_train, label_train)
    % PARTIAL_GRADIENT
    % By: Nicholas Granlund

    % determine y= I * w + w0
    y = sum(dot(example_train,w)) + w0;

    % determine network output p
    p = exp(y) / (1 + exp(y));

    % Determine residual (network output - wanted output)
    r = (p - label_train);

    % Update ∇w and ∇w0
    wgrad = r .* example_train;
    w0grad = r;


end
