function [neipos,wid]=fneighbor(I,width)
% neighbor_posÿ���������ڵ�����λ��
% wid������ÿ��������ĵ��ŷʽ����
% IΪͼ�����
% width�������Ŀ��
[m,n]=size(I);
I_position=zeros(m,n);
I_position(:)=1:m*n;     %��ʼ��λ�ô���
cet=floor(width/2)+1;    %������������λ��
%����wid
for i=1:width
    for j=1:width
        wid((j-1)*width+i)=sqrt((i-cet)^2+(j-cet)^2);%ʹ�õ����������Ѱַ
    end
end
wid=wid';
%��չ��Ե
half_w=floor(width/2);
extended_image1=[I_position(:,1:half_w), I_position, I_position(:,(end-half_w+1):end)];   %��չ��
extended_image=[extended_image1(1:half_w,:); extended_image1; extended_image1(end-half_w+1:end,:)];  %��չ��
neipos=zeros(width*width,m*n);
for i=1:m
    for j=1:n
        temp=extended_image(i:i+2*half_w,j:j+2*half_w);
        neipos(:,(j-1)*m+i)=temp(:);                    %��������Ѱַ
    end
end
cet_pos=(cet-1)*width+cet;
%ɾ���Լ����Լ������
wid(cet_pos)=[];                  
neipos(cet_pos,:)=[];
        