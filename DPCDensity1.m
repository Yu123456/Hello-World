function rho = DPCDensity1(dist,dc)
% 2017 年 8 月 31 日
% DPC 第一种局部密度计算

% 输入：
% dist   距离矩阵
% dc     截断距离

% 输出：
% rho   局部密度

bd = dist < dc;
rho = sum(bd,2) - 1;     % 减去 1 是为了除去自身到自身的距离

end

