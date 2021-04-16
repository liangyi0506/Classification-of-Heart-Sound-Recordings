function ss = extractMLRfeatures(signal)
% [x,fs]=audioread('./training-a/a0001.wav');
x = signal;
x1=x(:,1); % 抽取�?1 声道
level = 4;
wname ='db6';%选取小波
t=wpdec(x1,level,wname,'shannon');%小波分解
% plot(t);

t0=wprcoef(t,[3,0]);
t1=wprcoef(t,[4,2]);
t2=wprcoef(t,[4,3]);
t3=wprcoef(t,[3,2]);
t4=wprcoef(t,[4,6]);
t5=wprcoef(t,[4,7]);
t6=wprcoef(t,[1,1]);

%构建特征向量
s0=norm(t0);
s1=norm(t1);
s2=norm(t2);
s3=norm(t3);
s4=norm(t4);
s5=norm(t5);
s6=norm(t6);
ss=[s0,s1,s2,s3,s4,s5,s6];%得到7维的特征向量
%  figure();
%  bar(ss);
 end
 
