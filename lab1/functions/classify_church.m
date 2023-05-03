 function label = classify_church(image, feature_collection)
% classify_church
% By: Nicholas Granlund

% Compute feature points of the new image
points = detectSIFTFeatures(image);
features = extractFeatures(image,points);

% Find corresponding features from the different churces (indexes)
corrs = matchFeatures(features, feature_collection.descriptors', 'MatchThreshold', 100, 'MaxRatio', 0.7);

% Gather the indexes from the features in feature_collection
indexes = double(corrs(:,2));

% Determine what church has the most similar features
label = mode(feature_collection.labels(indexes));

end

