function rho = DPCDensity2(dist,dc)
% 2017 年 8 月 31 日
% DPC 第二种局部密度计算， exp 局部距离

% 输入：
% dist   距离矩阵
% dc     截断距离

% 输出：
% rho   局部密度

[N,~] = size(dist);
rho = zeros(N,1);
% Gaussian kernel
for i=1:N-1
  for j=i+1:N
     rho(i)=rho(i)+exp(-(dist(i,j)/dc)*(dist(i,j)/dc));
     rho(j)=rho(j)+exp(-(dist(i,j)/dc)*(dist(i,j)/dc));
  end
end

end