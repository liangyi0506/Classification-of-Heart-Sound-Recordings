function f = extractFeatures(S1,S2,S3,S4,assigned_states,PCG_resampled)
%This function is to obtain respective features from the four states S1,S2,S3,S4
%INPUTS:
%           同一段心音中各阶段的记录——S1,S2,S3,S4
%OUTPUTS:
%        每一阶段心音的特征——features


%% run getEnergy.m to obtain short_time energy
features(1,1) =  getEnergy(S1);
features(2,1) =  getEnergy(S2);
features(3,1) =  getEnergy(S3);
features(4,1) =  getEnergy(S4);

%% run getZCR.m to calcuates the zero-crossing rate
features(1,2) = getZCR(S1);
features(2,2) = getZCR(S2);
features(3,2) = getZCR(S3);
features(4,2) = getZCR(S4);

%% run getLandmarks.m to calcuates the max-enegry points
features(1,3:5) = getLandmarks(S1);
features(2,3:5) = getLandmarks(S2);
features(3,3:5) = getLandmarks(S3);
features(4,3:5) = getLandmarks(S4);

%% run getMFCC.m to calcuates MFCC features
features(1,6:17) = getMFCC(S1,1000);
features(2,6:17) = getMFCC(S2,1000);
features(3,6:17) = getMFCC(S3,1000);
features(4,6:17) = getMFCC(S4,1000);

%%将上述特征值做成一个单独的特征向量
count = 0;
h = size(features,1);
w = size(features,2);
for i = 1:h
    for j = 1:w
        count = count+1;
        f(count) = features(i,j);
    end
end

features2  = extractFeaturesFromHsIntervals(assigned_states,PCG_resampled);
f = [f,features2];
        