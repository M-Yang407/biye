function [IX,times,IMMRF]=BianXiangsuLeibie2(maxX,maxY,StruInfo,gauss,IX,times)    

%times=0;
IX1=zeros(maxX,maxY);

temp1=StruInfo.*gauss;
%����ͼ��ı���
for i=1:maxX
    for j=1:maxY
        tmp=max(temp1(i,j,:));
        %tmpΪÿ������ֵ����Ӧ��P(W/S)�����ֵ
        for k=1:4
            if tmp==temp1(i,j,k)
                %����(i,j)λ�õ����ؽ������¸��±�ǩ
                IX1(i,j)=k;
            end
        end
        
        if IX(i,j)==IX1(i,j)
            IX(i,j)=IX1(i,j);
        else
            times=times+1;
            IX(i,j)=IX1(i,j);                       %ȡxij���������
        end
        %IXΪ����ǰ�ı�ǩ���󣬽�IX���и���
    end
end

%����������ͼ����������ʾ��
%�ûҶ�250,160,80,0�ֱ����4�ֲ�ͬ���ı�ʾ
IMMRF=zeros(maxX,maxY);

for i=1:maxX
    for j=1:maxY
        if IX(i,j)==4
            IMMRF(i,j)=80;
        elseif IX(i,j)==3
            IMMRF(i,j)=160;                           %����������
        elseif IX(i,j)==2
            IMMRF(i,j)=250;
        else
            IMMRF(i,j)=0;
        end
    end
end
IMMRF1=uint8(IMMRF);
%figure(3);
%imshow(IMMRF1);

