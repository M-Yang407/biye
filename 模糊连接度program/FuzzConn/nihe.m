function [ a, b ] = nihe( x,y )
%UNTITLED4 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��

%ԭʼ����
            
[m, n] = size(x);
x2=sum(x.^2);       % ��(xi^2)
x1=sum(x);          % ��(xi)
x1y1=sum(x.*y');     % ��(xi*yi)
y1=sum(y');          % ��(yi)
 
a=(n*x1y1-x1*y1)/(n*x2-x1*x1);      %���ֱ��б��b=(y1-a*x1)/n
b=(y1-a*x1)/n;                      %���ֱ�߽ؾ�
%��ͼ
% �Ȱ�ԭʼ���ݵ�����ɫʮ�������
%figure
%plot(X,Y,'+');      
%hold on
% �ú�ɫ������ϳ���ֱ��
%px=linspace(120,165,45);%����ֱ����������Լ�ʵ�������д
%py=a*px+b;

%plot(px, py, 'r+');
end

