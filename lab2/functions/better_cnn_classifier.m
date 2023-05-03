function layers = better_cnn_classifier()
    % BETTER_CNN_CLASSIFIER
    % By: Nicholas Granlund

    % construct the CNN
layers = [
            imageInputLayer([28 28 1]);
            convolution2dLayer(3,25)
            reluLayer
            convolution2dLayer(4,25)            % <-- add conv layer
            reluLayer
            convolution2dLayer(3,25)            % <-- add conv layer
            maxPooling2dLayer(2,'stride',2)
            fullyConnectedLayer(10);
            softmaxLayer;
            classificationLayer];

% We can se by adding a convolutional layers we can drastically increase
% the performance of the network, it needs fewer epochs to improve and
% rather quickly reaches ≈100% accuracy on mini batches, however we have
% increased the number of trainable parameters which in turn increases the
% computational complexity..

end

