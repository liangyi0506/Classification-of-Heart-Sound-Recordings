function classifyResult = challenge(recordName)
%% Load the trained parameter matrices for Springer's HSMM model.
% The parameters were trained using 409 heart sounds from MIT heart
% sound database, i.e., recordings a0001-a0409.
load('Springer_B_matrix.mat');
load('Springer_pi_vector.mat');
load('Springer_total_obs_distribution.mat');
load('svmStruct_n.mat');

%% Load data and resample data
springer_options   = default_Springer_HSMM_options;
[PCG, Fs1]         = audioread([recordName '.wav']);  % load data
PCG_resampled      = resample(PCG,springer_options.audio_Fs,Fs1); % resample to springer_options.audio_Fs (1000 Hz)

%% Running runSpringerSegmentationAlgorithm.m to obtain the assigned_states
[assigned_states] = runSpringerSegmentationAlgorithm(PCG_resampled, springer_options.audio_Fs, Springer_B_matrix, Springer_pi_vector, Springer_total_obs_distribution, false); % obtain the locations for S1, systole, s2 and diastole

%% Running mergeSameSegment.m to obtain four merged records of the same assigned_state
[S1, S2, S3, S4] = mergeSameSegment(assigned_states,PCG_resampled);

%% Running extractFeaturesFromHsIntervals.m to obtain the features for normal/abnormal heart sound classificaiton
 features  = extractFeatures(S1,S2,S3,S4,assigned_states,PCG_resampled);
%  features = extractMLRfeatures(PCG);
 %% 用SVM分类
%features(:,[3,4,5,37,38,39]) = [];
classifyResult = predict(svmStruct,features);
    
%% 用MLR分类
% load('mlrFactors.mat')
% scores = mnrval(mlrFactors,features);
% scores = mnrval(mlrFactors2,features);
% s1=scores(:,1);
% s2=scores(:,2);
% if s1<s2
%     classifyResult = -1;
% else
%     classifyResult = 1;
% end

%% 用随机森林算法分类
% load('RF.mat');
% classifyResult = classRF_predict(features,model);


