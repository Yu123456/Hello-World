function rho = DPCDensity1(dist,dc)
% 2017 �� 8 �� 31 ��
% DPC ��һ�־ֲ��ܶȼ���

% ���룺
% dist   �������
% dc     �ضϾ���

% �����
% rho   �ֲ��ܶ�

bd = dist < dc;
rho = sum(bd,2) - 1;     % ��ȥ 1 ��Ϊ�˳�ȥ��������ľ���

end

