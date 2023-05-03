function warped = align_images(source, target, thresh)
    % ALIGN_IMAGES
    % By: Nicholas Granlund
    
    % Detect SIFT and extract features for source img
    pts_source = detectSIFTFeatures(source);
    [source_features, source_validPoints] = extractFeatures(source,pts_source);

    % Detect SIFT and extract features for target img
    pts_target = detectSIFTFeatures(target);
    [target_features, target_validPoints] = extractFeatures(target,pts_target);
    
    % Determine correlation
    corrs = matchFeatures(source_features, target_features, 'MaxRatio', 0.8, 'MatchThreshold', 100);

    % Index for point of correlation
    source_index = corrs(:,1);
    target_index = corrs(:,2);

    % Extract the points of correlation
    source_corrs_points = double(source_validPoints.Location(source_index,:)');
    target_corrs_points = double(target_validPoints.Location(target_index,:)');
    
    % Use RANSAC to find best A and t
    [A,t] = ransac_fit_affine(source_corrs_points, target_corrs_points, thresh);
     
    % Return the warped image using A and t
    warped = affine_warp(size(target), source, A, t);
    
    % return

end