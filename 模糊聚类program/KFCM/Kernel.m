function d=Kernel(data, center, segma2)
%segma2      ��������
%d           kernel����
d=zeros(size(center,1),size(data,1));
data = data';
for k=1:size(center,1),
    %ÿһ��ѭ��������������㵽һ���������ĵľ���
    d(k,:)=exp(-(data-center(k)).^2/segma2);
end
d=2*(1-d);
end