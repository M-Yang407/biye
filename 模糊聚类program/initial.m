function [y1,y2,y3,y4,IX,maxX,maxY,IM]=initial(IM)
IM=uint8(IM);
IM=IM(:,:,1);
%figure(1);
%imshow(IM);
IM=double(IM);
[maxX,maxY]=size(IM);
%maxX��maxYΪԭʼͼ��Ĵ�С
%�ڴ˴�Ϊ80*100


%���ڸ���
seed_1=IM(1,1);

seed_2=0;
seed_3=0;
seed_4=0;c=0;
IX=zeros(maxX,maxY);
for k =1:3
    Sum=0;
    I1=zeros(maxX,maxY);
    for i=1:maxX
        for j=1:maxY
            %disp(maxX);
            %disp(maxY);
           % disp(c);
           
            I1(i,j)=min(min(min(abs(IM(i,j)-seed_1),abs(IM(i,j)-seed_2)),abs(IM(i,j)-seed_3)),IM(i,j)-seed_4);
            Sum=Sum+I1(i,j);
            c=c+1;
        end
    end
    if k==1
        P=I1./Sum;
        value_max=max(max(P));
        [row,col]=find(value_max==P);
      
        seed_2=IM(row(1),col(1));
    end
    if k==2
        P=I1./Sum;
        value_max=max(max(P));
        [row,col]=find(value_max==P);
        seed_3=IM(row(1),col(1));
    end
    if k==3
        P=I1./Sum;
        value_max=max(max(P));
        [row,col]=find(value_max==P);
        seed_4=IM(row(1),col(1));
    end
end

num1=1;
num2=1;
num3=1;
num4=1;
for i=1:maxX
    for j=1:maxY
        if and(and(abs(IM(i,j)-seed_1)<abs(IM(i,j)-seed_2),abs(IM(i,j)-seed_1)<abs(IM(i,j)-seed_3)),abs(IM(i,j)-seed_1)<abs(IM(i,j)-seed_4))
            y1(num1)=IM(i,j);
            num1=num1+1;
            IX(i,j)=1;
        elseif and(and(abs(IM(i,j)-seed_2)<abs(IM(i,j)-seed_1),abs(IM(i,j)-seed_2)<abs(IM(i,j)-seed_3)),abs(IM(i,j)-seed_2)<abs(IM(i,j)-seed_4))          
            y2(num2)=IM(i,j);
            num2=num2+1;
            IX(i,j)=2;
        elseif and(and(abs(IM(i,j)-seed_3)<abs(IM(i,j)-seed_1),abs(IM(i,j)-seed_3)<abs(IM(i,j)-seed_2)),abs(IM(i,j)-seed_3)<abs(IM(i,j)-seed_4))
            y3(num3)=IM(i,j);
            num3=num3+1;
            IX(i,j)=3;
        else
            y4(num4)=IM(i,j);
            num4=num4+1;
            IX(i,j)=4;
        end
    
    end
end

IMMM=zeros(maxX,maxY);
for i=1:maxX
    for j=1:maxY
        if IX(i,j)==2
            IMMM(i,j)=250;
        elseif IX(i,j)==3
            IMMM(i,j)=160;                           %����������
        elseif IX(i,j)==4
            IMMM(i,j)=80;
        else
            IMMM(i,j)=0;
        end
    end
end
IMMM=uint8(IMMM);
%figure(2);
%imshow(IMMM);

l=0;



%{
%����ֵ���г�ʼ���ָ�
v1=unidrnd(255)
v2=unidrnd(255)
v3=unidrnd(255)
v=[v1 v2 v3]
v=sort(v)
v1=v(1)
v2=v(end)
v3=v(end-1)

%v1��v2��v3Ϊ��ʼ����ֵ
%������ֵ���н�ͼ����зֳɲ�ͬ�����
v11=1;
v22=1;
v33=1;
tt=0;
IX=zeros(maxX,maxY);
while(tt<100)
    tt=tt+1;%���õ������г�ʼ��
    
    num1=0;
    num2=0;
    num3=0;
    %��ͼ����б���
    %����IX���б�ǩ������
    for i=1:maxX
        for j=1:maxY
            %�������ֵ���ڣ�v1��(v2-v1)/2��ʱ��num1���������ۼ�
            %����y1����ͳ�Ƶ�һ����������Ԫ�صļ���
            %����y1���и���v1��ֵ�Ĵ�С
            if and(abs(IM(i,j)-v1)<abs(IM(i,j)-v2),abs(IM(i,j)-v1)<abs(IM(i,j)-v3))
                num1=num1+1;
                y1(num1)=IM(i,j);
                IX(i,j)=1;
            %�������ֵ���ڣ�43-126��ʱ��num2���������ۼ�
            %����y2����ͳ�Ƶڶ�����������Ԫ�صļ���
            %����y2���и���v2��ֵ�Ĵ�С
            elseif and(abs(IM(i,j)-v2)<abs(IM(i,j)-v1),abs(IM(i,j)-v2)<abs(IM(i,j)-v3))
                num2=num2+1;
                y2(num2)=IM(i,j);
                IX(i,j)=2;
            %�������ֵ���ڣ�127-255��ʱ��num3���������ۼ�
            %����y3����ͳ�Ƶ�������������Ԫ�صļ���
            %����y3���и���v3��ֵ�Ĵ�С
            else
                num3=num3+1;
                y3(num3)=IM(i,j);
                IX(i,j)=3;
            end
        end
    end
    %����������е�Ԫ�صľ�ֵ���и�����ֵ
    v1=mean(y1);
    v2=mean(y2);
    v3=mean(y3);
    %����temp��Ϊ��������ѭ���������������ε�������������ֵ������
    temp=[abs(v1-v11)/v11,abs(v2-v22)/v22,abs(v3-v33)/v33];

    if max(temp)<0.005
        break;
    else
        %���¸���
        v11=v1;
        v22=v2;
        v33=v3;
    end
end

IMMM=zeros(maxX,maxY);
for i=1:maxX
    for j=1:maxY
        if IX(i,j)==3
            IMMM(i,j)=120;
        elseif IX(i,j)==2
            IMMM(i,j)=250;                           %����������
        else
            IMMM(i,j)=0;
        end
    end
end
IMMM=uint8(IMMM);
figure(2);
imshow(IMMM);

l=0;

%}