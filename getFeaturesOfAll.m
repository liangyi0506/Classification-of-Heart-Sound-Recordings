%% 读取training-b文件夹
load('Springer_B_matrix.mat');
load('Springer_pi_vector.mat');
load('Springer_total_obs_distribution.mat');
springer_options   = default_Springer_HSMM_options;
%% 获取训练集a需要用到的特征

file_path = 'C:\Users\liangyi\workplace\MATLAB\sample2016\training-a\';

voice_path_list = dir(strcat(file_path,'*.wav'));%获取该文件夹中所有wav格式的音频  
len = length(voice_path_list);%获取音频总数量 
train_data_a=cell(1,len);
for j = 1:len %逐一读取音频 
    voice_name = voice_path_list(j).name;% 音频名  
    [voice,fs]=audioread(strcat(file_path,voice_name));  
    PCG_resampled  = resample(voice,springer_options.audio_Fs,fs); % resample to springer_options.audio_Fs (1000 Hz)
    train_data_a{j}=PCG_resampled;
end

features_data_a = zeros(len,88);
for i = 1:len
    [assigned_states] = runSpringerSegmentationAlgorithm(train_data_a{i}, springer_options.audio_Fs, Springer_B_matrix, Springer_pi_vector, Springer_total_obs_distribution, false); % obtain the locations for S1, systole, s2 and diastole
    [S1, S2, S3, S4] = mergeSameSegment(assigned_states,train_data_a{i});%Running mergeSameSegment.m to obtain four merged records of the same assigned_state
    features  = extractFeatures(S1,S2,S3,S4,assigned_states,train_data_a{i});% Running extractFeaturesFromHsIntervals.m to obtain the features for normal/abnormal heart sound classificaiton
    features_data_a(i,:) = features;
    fprintf(['---train_data_a ' num2str(i) ' 的特征提取完毕.\n']);
end

%% 获取训练集b需要用到的特征

file_path = 'C:\Users\liangyi\workplace\MATLAB\sample2016\training-b\';

voice_path_list = dir(strcat(file_path,'*.wav'));%获取该文件夹中所有wav格式的音频  
len = length(voice_path_list);%获取音频总数量 
train_data_b=cell(1,len);
for j = 1:len %逐一读取音频 
    voice_name = voice_path_list(j).name;% 音频名  
    [voice,fs]=audioread(strcat(file_path,voice_name));  
    PCG_resampled  = resample(voice,springer_options.audio_Fs,fs); % resample to springer_options.audio_Fs (1000 Hz)
    train_data_b{j}=PCG_resampled;
end

features_data_b = zeros(len,88);
for i = 1:len
    [assigned_states] = runSpringerSegmentationAlgorithm(train_data_b{i}, springer_options.audio_Fs, Springer_B_matrix, Springer_pi_vector, Springer_total_obs_distribution, false); % obtain the locations for S1, systole, s2 and diastole
    [S1, S2, S3, S4] = mergeSameSegment(assigned_states,train_data_b{i});%Running mergeSameSegment.m to obtain four merged records of the same assigned_state
    features  = extractFeatures(S1,S2,S3,S4,assigned_states,train_data_b{i});% Running extractFeaturesFromHsIntervals.m to obtain the features for normal/abnormal heart sound classificaiton
    features_data_b(i,:) = features;
    fprintf(['---train_data_b ' num2str(i) ' 的特征提取完毕.\n']);
end

%% 获取训练集c需要用到的特征

file_path = 'C:\Users\liangyi\workplace\MATLAB\sample2016\training-c\';

voice_path_list = dir(strcat(file_path,'*.wav'));%获取该文件夹中所有wav格式的音频  
len = length(voice_path_list);%获取音频总数量 
train_data_c=cell(1,len);
for j = 1:len %逐一读取音频 
    voice_name = voice_path_list(j).name;% 音频名  
    [voice,fs]=audioread(strcat(file_path,voice_name));  
    PCG_resampled  = resample(voice,springer_options.audio_Fs,fs); % resample to springer_options.audio_Fs (1000 Hz)
    train_data_c{j}=PCG_resampled;
end

features_data_c = zeros(len,88);
for i = 1:len
    [assigned_states] = runSpringerSegmentationAlgorithm(train_data_c{i}, springer_options.audio_Fs, Springer_B_matrix, Springer_pi_vector, Springer_total_obs_distribution, false); % obtain the locations for S1, systole, s2 and diastole
    [S1, S2, S3, S4] = mergeSameSegment(assigned_states,train_data_c{i});%Running mergeSameSegment.m to obtain four merged records of the same assigned_state
    features  = extractFeatures(S1,S2,S3,S4,assigned_states,train_data_c{i});% Running extractFeaturesFromHsIntervals.m to obtain the features for normal/abnormal heart sound classificaiton
    features_data_c(i,:) = features;
    fprintf(['---train_data_c ' num2str(i) ' 的特征提取完毕.\n']);
end

%% 获取训练集d需要用到的特征

file_path = 'C:\Users\liangyi\workplace\MATLAB\sample2016\training-d\';

voice_path_list = dir(strcat(file_path,'*.wav'));%获取该文件夹中所有wav格式的音频  
len = length(voice_path_list);%获取音频总数量 
train_data_d=cell(1,len);
for j = 1:len %逐一读取音频 
    voice_name = voice_path_list(j).name;% 音频名  
    [voice,fs]=audioread(strcat(file_path,voice_name));  
    PCG_resampled  = resample(voice,springer_options.audio_Fs,fs); % resample to springer_options.audio_Fs (1000 Hz)
    train_data_d{j}=PCG_resampled;
end

features_data_d = zeros(len,88);
for i = 1:len
    [assigned_states] = runSpringerSegmentationAlgorithm(train_data_d{i}, springer_options.audio_Fs, Springer_B_matrix, Springer_pi_vector, Springer_total_obs_distribution, false); % obtain the locations for S1, systole, s2 and diastole
    [S1, S2, S3, S4] = mergeSameSegment(assigned_states,train_data_d{i});%Running mergeSameSegment.m to obtain four merged records of the same assigned_state
    features  = extractFeatures(S1,S2,S3,S4,assigned_states,train_data_d{i});% Running extractFeaturesFromHsIntervals.m to obtain the features for normal/abnormal heart sound classificaiton
    features_data_d(i,:) = features;
    fprintf(['---train_data_d ' num2str(i) ' 的特征提取完毕.\n']);
end

%% 获取训练集e需要用到的特征

file_path = 'C:\Users\liangyi\workplace\MATLAB\sample2016\training-e\';

voice_path_list = dir(strcat(file_path,'*.wav'));%获取该文件夹中所有wav格式的音频  
len = length(voice_path_list);%获取音频总数量 
train_data_e=cell(1,len);
for j = 1:len %逐一读取音频 
    voice_name = voice_path_list(j).name;% 音频名  
    [voice,fs]=audioread(strcat(file_path,voice_name));  
    PCG_resampled  = resample(voice,springer_options.audio_Fs,fs); % resample to springer_options.audio_Fs (1000 Hz)
    train_data_e{j}=PCG_resampled;
end

features_data_e = zeros(len,88);
for i = 1:len
    [assigned_states] = runSpringerSegmentationAlgorithm(train_data_e{i}, springer_options.audio_Fs, Springer_B_matrix, Springer_pi_vector, Springer_total_obs_distribution, false); % obtain the locations for S1, systole, s2 and diastole
    [S1, S2, S3, S4] = mergeSameSegment(assigned_states,train_data_e{i});%Running mergeSameSegment.m to obtain four merged records of the same assigned_state
    features  = extractFeatures(S1,S2,S3,S4,assigned_states,train_data_e{i});% Running extractFeaturesFromHsIntervals.m to obtain the features for normal/abnormal heart sound classificaiton
    features_data_e(i,:) = features;
    fprintf(['---train_data_e ' num2str(i) ' 的特征提取完毕.\n']);
end

%% 获取训练集f需要用到的特征

file_path = 'C:\Users\liangyi\workplace\MATLAB\sample2016\training-f\';

voice_path_list = dir(strcat(file_path,'*.wav'));%获取该文件夹中所有wav格式的音频  
len = length(voice_path_list);%获取音频总数量 
train_data_f=cell(1,len);
for j = 1:len %逐一读取音频 
    voice_name = voice_path_list(j).name;% 音频名  
    [voice,fs]=audioread(strcat(file_path,voice_name));  
    PCG_resampled  = resample(voice,springer_options.audio_Fs,fs); % resample to springer_options.audio_Fs (1000 Hz)
    train_data_f{j}=PCG_resampled;
end

features_data_f = zeros(len,88);
for i = 1:len
    [assigned_states] = runSpringerSegmentationAlgorithm(train_data_f{i}, springer_options.audio_Fs, Springer_B_matrix, Springer_pi_vector, Springer_total_obs_distribution, false); % obtain the locations for S1, systole, s2 and diastole
    [S1, S2, S3, S4] = mergeSameSegment(assigned_states,train_data_f{i});%Running mergeSameSegment.m to obtain four merged records of the same assigned_state
    features  = extractFeatures(S1,S2,S3,S4,assigned_states,train_data_f{i});% Running extractFeaturesFromHsIntervals.m to obtain the features for normal/abnormal heart sound classificaiton
    features_data_f(i,:) = features;
    fprintf(['---train_data_f ' num2str(i) ' 的特征提取完毕.\n']);
end
%% 读取训练样本需要的标签
%% 
labels = csvread('train\REFERENCE.csv',0,1);
features_data = [features_data_a;features_data_b;features_data_c;features_data_d;features_data_e;features_data_f];

%% 训练svm模型
% svmStruct = fitcsvm(features_data,LABELS);

%% 训练MLR模型
% labels = LABELS;
% for i = 1:size(labels,1)
%     if labels(i) == -1
%         labels(i) = 2;
%     end
% end
% 
% MLRfactors = mnrfit(features_data,labels);
% scores = mnrval(MLRfactors,features);
% 
% s1=scores(:,1);
% s2=scores(:,2);
% if s1<s2
%     classifyResult = -1;
% else
%     classifyResult = 1;
% end

%% 训练RF模型
% 创建随机森林分类器
% load('f.mat');
% RFmodel = classRF_train(f,LABELS);
