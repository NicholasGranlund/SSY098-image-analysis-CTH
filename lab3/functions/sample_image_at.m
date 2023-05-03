function value = sample_image_at(img, position)
    % SAMPLE_IMAGE_AT
    % By: Nicholas Granlund

    % Determine the closest actual positions with round()
    y_pos = round(position(1));
    x_pos = round(position(2));

    % If position y is out of bounds, return 1
    if y_pos <= 0 || y_pos > size(img, 1)
        value = 1;

    % If position x is out of bounds, return 1
    elseif x_pos <= 0 || x_pos > size(img, 2)
        value = 1;

    % If x and y is in the picture, return closest value
    else
        value = img(y_pos, x_pos);
    end

    % return

end