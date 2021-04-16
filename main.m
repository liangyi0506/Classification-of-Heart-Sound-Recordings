%%
%本程序读取training-a�?50个心音信号作为训练集，后150个心音信号作为测试数据，采用SVM支持向量机和逻辑回归分类�?
%进行心音信号的分�?
%%
clear;
clc;
rng1=[0 1 408 1];%训练 rng=[r1 c1 r2 c2]定义读取csv文件的行列始末段
rng2=[0 1 489 1];%测试
rng3=[0 1 30 1];
rng4=[0 1 54 1];
rng5=[0 1 765 1];
rng55=[766 1 2140 1];
rng6=[0 1 113 1];

train_label1=csvread('./training-a/REFERENCE.csv',0,1,rng1);%读取训练标签
for i=1:length(train_label1)
    if train_label1(i)<0
        train_label1(i)=2;
    end
end
train_label2=csvread('./training-b/REFERENCE.csv',0,1,rng2);%读取训练标签
for i=1:length(train_label2)
    if train_label2(i)<0
        train_label2(i)=2;
    end
end
train_label3=csvread('./training-c/REFERENCE.csv',0,1,rng3);%读取训练标签
for i=1:length(train_label3)
    if train_label3(i)<0
        train_label3(i)=2;
    end
end
train_label4=csvread('./training-d/REFERENCE.csv',0,1,rng4);%读取训练标签
for i=1:length(train_label4)
    if train_label4(i)<0
        train_label4(i)=2;
    end
end
train_label5=csvread('./training-e/REFERENCE.csv',0,1,rng5);%读取训练标签
for i=1:length(train_label5)
    if train_label5(i)<0
        train_label5(i)=2;
    end
end
train_label6=csvread('./training-f/REFERENCE.csv',0,1,rng6);%读取训练标签
for i=1:length(train_label6)
    if train_label6(i)<0
        train_label6(i)=2;
    end
end
train_label=[train_label1;train_label2;train_label3;train_label4;train_label5;train_label6];
test_label=csvread('./validation/REFERENCE.csv',0,1);%读取测试标签
for i=1:length(test_label)
    if test_label(i)<0
        test_label(i)=2;
    end
end
figure();
subplot(211);
bar(test_label);%画出测试数据的正确分类标�?
%%
%对原始数据进行特征提取，构建n维的训练数据矩阵，样本大小为150
train_data=[];
test_data=[];
for i=1:9
    ss=feature_extraction(strcat('./training-a/a000',num2str(i),'.wav'));
    train_data=[train_data;ss];
end
for i=10:99
    ss=feature_extraction(strcat('./training-a/a00',num2str(i),'.wav'));
    train_data=[train_data;ss];
end
for i=100:409
    ss=feature_extraction(strcat('./training-a/a0',num2str(i),'.wav'));
    train_data=[train_data;ss];
end

for i=1:9
    ss=feature_extraction(strcat('./training-c/c000',num2str(i),'.wav'));
    train_data=[train_data;ss];
end
for i=10:31
    ss=feature_extraction(strcat('./training-c/c00',num2str(i),'.wav'));
    train_data=[train_data;ss];
end

for i=1:9
    ss=feature_extraction(strcat('./training-d/d000',num2str(i),'.wav'));
    train_data=[train_data;ss];
end
for i=10:55
    ss=feature_extraction(strcat('./training-d/d00',num2str(i),'.wav'));
    train_data=[train_data;ss];
end

for i=1:9
    ss=feature_extraction(strcat('./training-e/e0000',num2str(i),'.wav'));
    train_data=[train_data;ss];
end
for i=10:99
    ss=feature_extraction(strcat('./training-e/e000',num2str(i),'.wav'));
    train_data=[train_data;ss];
end
for i=100:766
    ss=feature_extraction(strcat('./training-e/e00',num2str(i),'.wav'));
    train_data=[train_data;ss];
end


for i=1:9
    ss=feature_extraction(strcat('./training-f/f000',num2str(i),'.wav'));
    train_data=[train_data;ss];
end
for i=10:99
    ss=feature_extraction(strcat('./training-f/f00',num2str(i),'.wav'));
    train_data=[train_data;ss];
end
for i=100:114
    ss=feature_extraction(strcat('./training-f/f0',num2str(i),'.wav'));
    train_data=[train_data;ss];
end

%对原始数据进行特征提取，构建n维的测试数据矩阵

for i=767:999
    ss=feature_extraction(strcat('./training-e/e00',num2str(i),'.wav'));
    test_data=[test_data;ss];
end
for i=1000:2141
    ss=feature_extraction(strcat('./training-e/e0',num2str(i),'.wav'));
    test_data=[test_data;ss];
end

%%
%SVM支持向量机分类器
% Factor = svmtrain( train_data,train_label);
% predict_label = svmclassify(Factor, test_data);
% accuracy = length(find(predict_label == test_label))/length(test_label)*100;
% accuracy;
% subplot(212);
% bar(predict_label);%绘制预测矩阵与正确答案进行比�?

%逻辑回归
Factor = mnrfit(train_data, train_label);
Scores = mnrval(Factor, test_data);
S1=Scores(:,1);
S2=Scores(:,2);
predict_label=[];
for i=1:length(S1)
    if S1(i)<S2(i)
        predict_label=[predict_label;2];
    else
        predict_label=[predict_label;1];
    end
end
subplot(212);
bar(predict_label);
accuracy = length(find(predict_label == test_label))/length(test_label)*100;
accuracy
