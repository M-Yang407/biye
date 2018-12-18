function [center] =calcCenters(image, U, cNum, m)
% input
    % image:0-255��double��
    % U��0-1��double��
    % cNum������������Ŀ
    % m�����������ٶȵĲ�����ͨ��Ϊ2
% output
    % center������ΪcNum������
center=zeros(cNum,1);
mf=U.^m;
for k=1:cNum
    sSum=sum(sum(mf(:,:,k)));
    center(k)=sum(sum(mf(:,:,k).*image))/sSum; %�õ���������   
end

%��������
end