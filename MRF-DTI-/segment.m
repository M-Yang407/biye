%function[color_picture]=segment(im)
function[end_picture]=segment(im)
%tmp=imread('date\26.jpg');
tmp=imread(im);
tmp=tmp(:,:,1);
IM=double(tmp);
[M,N]=size(IM);

disp(M);disp(N);
IM=IM(20:99,10:109);%����ͼƬ�����뷶Χ

figure(1);
imshow(uint8(IM));%��ԭʼ����ͼƬ�������
%[maxX,maxY]=size(IM);%maxX��maxYΪͼ��IM��С

init=0;
yyy=0;%��������ͳ��
times=20;

[y1,y2,y3,IX,maxX,maxY,IM]=initial(IM);%��ʼ���ָ�ͼ�񣬿��Խ��иĽ���߷ָ�Ч��

%��ʼfigure(2)
%maxX��maxYΪͼ���С
%y1,y2,y3Ϊ�ֳɵ�3���е�Ԫ�ؾ��󼯺�
%y1Ϊ����ֵ��͵����y2Ϊ����ֵ�ڶ��͵����y3λ����ֵ��ߵ����
%IXΪ��ʼ��ǩ���� 

while(1)
    %timesTmp=times;
    %����yyy���е���
    yyy=yyy+1;
    %FenxiGeleiZhifang��������ͳ��ÿ������еĸ����Լ���ӦԪ��ֵ
    [y1,y2,y3]=FenxiGeleiZhifang(IX,IM,maxX,maxY);
    %GanChangFenbu1�������ص�StruInfo
    %StruInfo(:,:,1)=temp1,temp1Ϊÿ�����ص��Ϊ���1�ĸ���
    %StruInfo(:,:,2)=temp2,temp2Ϊÿ�����ص��Ϊ���2�ĸ���
    %StruInfo(:,:,3)=temp3,temp3Ϊÿ�����ص��Ϊ���3�ĸ���
    [StruInfo]=GanChangFenbu1(maxX,maxY,IX,IM);
    %QiuJunzhiFangcha����gauss(maxX,maxY,3)ΪP(X/Wi)�ĸ���
    [gauss]=QiuJunzhiFangcha(y1,y2,y3,IM,maxX,maxY);
    %BianXiangsuLeibie2����
    %��ʾfigure(3)
    [IX,times,IMMRF]=BianXiangsuLeibie2(maxX,maxY,StruInfo,gauss,IX,times);
    if yyy==30%����������yyy����ͳ�Ƶ�������
        [IX,times,IMMRF]=BianXiangsuLeibie2(maxX,maxY,StruInfo,gauss,IX,times);
        break;
    end
end
%��ģ��C��ֵ����(FCM)����ͼ��ָ�
[IX2,IMMM]=thefcm(IM);
%��ԭͼ����Χ�������0
IM2=zeros(maxX+2,maxY+2);



for i=1:maxX
    for j=1:maxY
        IM2(i+1,j+1)=IM(i,j);
    end
end
[N_maxX,N_maxY]=size(IM2);
LOF=zeros(maxX,maxY);
disp(N_maxX);disp(N_maxY);
disp(maxX);
disp(maxY);
COUNT=0;
for i=1:maxX
    for j=1:maxY
        X=IM2(i:i+2,j:j+2);
        disp(COUNT);
        COUNT=COUNT+1;
        [lof]=aerfa(X);
        LOF(i,j)=lof(5);
    end
end

end_picture1=LOF.*IMMM;
end_picture2=(1-LOF).*im2double(IMMRF);
end_picture=end_picture1+end_picture2;

%Picture=uint8(end_picture);
%disp(Picture);
%figure(7);
%imshow(Picture);
%color_picture=color(IMMM);


