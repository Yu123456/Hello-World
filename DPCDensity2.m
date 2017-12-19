function rho = DPCDensity2(dist,dc)
% 2017 �� 8 �� 31 ��
% DPC �ڶ��־ֲ��ܶȼ��㣬 exp �ֲ�����

% ���룺
% dist   �������
% dc     �ضϾ���

% �����
% rho   �ֲ��ܶ�

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