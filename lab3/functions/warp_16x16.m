function warped = warp_16x16(source)
    % WARP_16X16
    % By: Nicholas Granlund

    % Instantiate the warped picture
    warped = zeros(16, 16);

    % loop through the pixels in the image
    for x_pos = 1:16
        for y_pos = 1:16
            % Transform the coordinates with TRANSFORM_COORDINATES()
            position = transform_coordinates([x_pos; y_pos]);

            % Use SAMPLE_IMAGE_AT() on source image given transformed pos
            % TRANSFORM_COORDINATES takes [x y] and retuns [y x] (???)
            % flip pos
              warped(y_pos, x_pos) = sample_image_at(source, flip(position));

        end
    end

    % return

end