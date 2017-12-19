% 2017 �� 10 �� 31 ��
% ���Ӽ���ÿ�����и������Ե�ƽ��ֵ

% 2017 �� 10 �� 6 ��
%  �� DPC ��������Ͷ����Ŀ��Ҧ˫��ʿ����

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
[ND, NL] = size(dist);  % ND = NL  ���ݼ���С
percent = 16;          % �ضϾ���ռ��

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ����Դ�����ṩ�ĽضϾ�����㷽ʽ
% Դ���벿�ֽ���
% 1��Դ����ֱ�Ӷ�ȡ����Եľ��룬���ǲ�������������ľ��� 0
% 2��Դ�����ж�ȡ�ľ����У�ֻ������������е��ϣ��£����ǲ���
% 3������������Ϊ n, ��Դ�����е� N = n*(n-1)/2
% 4���ضϾ���ȡ��N ��ռ�ٷֱ� 2 ����������ȡ��
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
% DPC ����
[cl,icl, time]=DPCF(dist,dc);

cl = cl';
icl = icl';
% ÿһ����������
K = length(icl);
ncl = zeros(K,1);
for i=1:K
    ncl(i) = sum( cl == i );
end

% ����ÿһ���ظ������Ե�ƽ��ֵ
average = zeros(K,length(xx(1,:)));
for i=1:K
    val = xx(cl == i,:);
    average(i,:) = mean(val);
end

save('ClusterResult.mat','cl','icl','ncl','xx','average');



disp(['clusters number : ',num2str(length(icl))]);
disp('running over!');