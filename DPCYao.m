% 2017 年 10 月 31 日
% 增加计算每个簇中各个属性的平均值

% 2017 年 10 月 6 日
%  用 DPC 方法聚类投资项目，姚双博士论文

clear all
close all
clc
disp('DPC Clustering Investment Projects running ...');
disp('The only input needed is a object file')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% object name
objName = 'InvestP.mat';
obj = load(objName);
xx = obj.matrix;
dist = pdist2(xx,xx);
dist = sqrt(dist);
[ND, NL] = size(dist);  % ND = NL  数据集大小
percent = 16;          % 截断距离占比

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 根据源代码提供的截断距离计算方式
% 源代码部分解释
% 1、源代码直接读取对象对的距离，但是不包含自身到自身的距离 0
% 2、源代码中读取的距离中，只包含距离矩阵中的上（下）三角部分
% 3、假设对象个数为 n, 则源代码中的 N = n*(n-1)/2
% 4、截断距离取，N 的占百分比 2 的四舍五入取整
N = ND*(ND-1)/2.0;
sda = zeros(N,1);
k = 0;
for i=1:ND-1
    for j=i+1:ND
        k = k+1;
        sda(k) = dist(i,j);
    end
end
position = round(N*percent/100);
sda = sort(sda);
dc = sda(position);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% DPC 聚类
[cl,icl, time]=DPCF(dist,dc);

cl = cl';
icl = icl';
% 每一个簇样本数
K = length(icl);
ncl = zeros(K,1);
for i=1:K
    ncl(i) = sum( cl == i );
end

% 计算每一个簇各个属性的平均值
average = zeros(K,length(xx(1,:)));
for i=1:K
    val = xx(cl == i,:);
    average(i,:) = mean(val);
end

save('ClusterResult.mat','cl','icl','ncl','xx','average');



disp(['clusters number : ',num2str(length(icl))]);
disp('running over!');