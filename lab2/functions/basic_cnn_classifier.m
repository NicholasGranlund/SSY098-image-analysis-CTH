function layers = basic_cnn_classifier()
    % BASIC_CNN_CLASSIFIER
    % By: Nicholas Granlund

    % construct the CNN
layers = [
            imageInputLayer([28 28 1]);
            convolution2dLayer(3,25)
            reluLayer
            maxPooling2dLayer(2,'stride',2)
            fullyConnectedLayer(10);
            softmaxLayer;
            classificationLayer];

end

