function net = train_classifier(layers, imgs_train, labels_train, imgs_val, labels_val)
    % TRAIN_CLASSIFIER
    % By: Nicholas Granlund

    % set options to stochastic gradient descent with momentum
    options = trainingOptions('sgdm');

    % Train network defined by layers on training set
    net = trainNetwork(imgs_train, labels_train, layers, options);

    % Classify validation images on trained network
    label_prediction = classify(net,imgs_val);
    
    % Determine accuracy
    accuracy = sum(label_prediction == labels_val)/numel(labels_val);

    % Print results
    fprintf('\n\nAccuracy on validation set: %.2f%%',accuracy*100)

    fprintf('\n\n/ Nicholas Granlund')

end

