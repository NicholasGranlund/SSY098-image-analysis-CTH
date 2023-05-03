function [examples_train_aug,labels_train_aug] = augment_data(examples_train,labels_train,M)
    % AUGMENT_DATA
    % By: Nicholas Granlund

    % Number of original images 
    N = length(examples_train);

    % Initialize the new augmentet examples and labels
    examples_train_aug = cell(N * M,1);
    labels_train_aug = zeros(N * M,1);

    % keep counter of entry as index
    entry = 0;
    
    % loop through each original example
    for i = 1:N
        % loop through original sample and augment M times
        for j = 1:M

            % Increment index for entry
            entry = entry +1;

            % Apply a random rotation to the image
            angle = 360*rand();
            rotated_img = imrotate(examples_train{i}, angle);
            
            % Resize the rotated image to be 35x35
            examples_train_aug{entry} = imresize(rotated_img, [35 35]);

            % Save label
            labels_train_aug(entry) = labels_train(i);
        end
    end
end
