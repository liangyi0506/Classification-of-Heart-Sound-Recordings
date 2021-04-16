% load('features.mat');
load('labels.mat');
%load('f_n.mat');
load('MLRfeatures.mat');
for i = 1:size(labels)
    if labels(i) == -1
        labels(i) = 2;
    end
end
mlrFactors2 = mnrfit(features,labels);
