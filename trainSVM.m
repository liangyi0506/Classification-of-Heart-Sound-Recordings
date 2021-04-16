%% 读取训练样本需要的标签
load('features.mat');
load('labels.mat');
%  load('f_n.mat');
%% 训练svm模型
svmStruct = fitcsvm(features_data,labels);


