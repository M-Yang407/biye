%
%IXΪ��ǩ����ÿ��Ԫ��ֵ�������Ӧ������ڴ˴�Ϊ1-4��
%IMΪ����ָ�ͼ��MaxX��maxYΪͼ���Ӧ��С
function [y1,y2,y3,y4]=FenxiGeleiZhifang(IX,IM,maxX,maxY)

num1=0;
num2=0;
num3=0;
num4=0;

y1=zeros();y2=zeros();y3=zeros();y4=zeros();
%��ͼ����б���
for i=1:maxX
    for j=1:maxY
        if IX(i,j)==1
            num1=num1+1;
            y1(num1)=IM(i,j);
        elseif IX(i,j)==2
            num2=num2+1;
            y2(num2)=IM(i,j);
        elseif IX(i,j)==3
            num3=num3+1;
            y3(num3)=IX(i,j);
        else
            num4=num4+1;
            y4(num4)=IM(i,j);
        end
    end
end
l=0;
