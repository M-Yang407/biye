function out = distfcm(center, data)
%�������������������ĵľ���
% center ��������
% data ������
%   �˴���ʾ��ϸ˵��
% out   ����
out = zeros(size(center,1),size(data,1));
for k = 1:size(center,1),
    %ÿһ�ν���һ���������ľ���ļ���
    out(k,:) = sqrt(sum(((data-ones(size(data,1),1)*center(k,:)).^2)',1));
end
end
