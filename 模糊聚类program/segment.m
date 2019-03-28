%function[color_picture]=segment(im)
%function[end_picture]=segment(im)
%tmp=imread('date\26.jpg');
tmp=imread('27.jpg');
%�������
figure(1);
title('ԭͼ��')
imshow(tmp);
tmp=add_noise(tmp);
figure(2);
title('���������ͼ��');
imshow(tmp);

tmp=tmp(:,:,1);
IM=double(tmp);
[M,N]=size(IM);

%disp(M);disp(N);
%IM=IM(20:99,10:109);%����ͼƬ�����뷶Χ

figure(3);
title('ͼƬɾ��');
imshow(uint8(IM));%��ԭʼ����ͼƬ�������
tic;
[r,c]=size(IM);


%ģ��C��ֵ
%[IX2,IMMM]=thefcm(IM);
%��ģ��C��ֵ����(FCM)����ͼ��ָ�

data=zeros(r*c,1);
for i=1:r
    for j=1:c
        data((i-1)*c+j)=double(IM(i,j));
    end
end
cluster_n=4;
[center,u,obj_fcn]=FCM(data,cluster_n);
disp(center);
disp(size(u));
disp(size(obj_fcn));
%���������������׼ȷ���࣬��������ÿ�η��������ز�ȷ������
[CENTER,index_center]=sort(center);
U=zeros(size(u));
for i=1:cluster_n
    U(i,:)=u(index_center(i),:);
end
%{

%����ָ�ϵ��Vpc
Vpc=0;
%����ָ���
Vpe=0;
[Ucluster_n,Udata_n]=size(U);
for i=1:Ucluster_n
    for j=1:Udata_n
        Vpc=Vpc+(U(i,j)^2);
        Vpe=Vpe+U(i,j)*log(U(i,j));
    end
end
Vpc=Vpc/Udata_n;
Vpe=-Vpe/Udata_n;
disp('-----------�ָ�ϵ��Vpc-------------');
disp(Vpc);
disp('-----------�ָ���Vpe---------------');
disp(Vpe);
%}
img_seg=IM*0;

for i=1:r
    for j=1:c
        temp=U(:,(i-1)*c+j);
        [a,b]=max(temp);
        img_seg(i,j)=b;
        if img_seg(i,j)==1
            IMMM(i,j)=0;
        elseif img_seg(i,j)==2
            IMMM(i,j)=80;
        elseif img_seg(i,j)==3
            IMMM(i,j)=160;
        else
            IMMM(i,j)=250;
        end
    end
end

figure(4);
imshow(uint8(IMMM));
title('FCMͼ��');

%[maxX,maxY]=size(IM);%maxX��maxYΪͼ��IM��С

init=0;
yyy=0;%��������ͳ��
times=20;

[y1,y2,y3,y4,IX,maxX,maxY,IM]=initial(IM);%��ʼ���ָ�ͼ�񣬿��Խ��иĽ���߷ָ�Ч��

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
    [y1,y2,y3,y4]=FenxiGeleiZhifang(IX,IM,maxX,maxY);
    %GanChangFenbu1�������ص�StruInfo
    %StruInfo(:,:,1)=temp1,temp1Ϊÿ�����ص��Ϊ���1�ĸ���
    %StruInfo(:,:,2)=temp2,temp2Ϊÿ�����ص��Ϊ���2�ĸ���
    %StruInfo(:,:,3)=temp3,temp3Ϊÿ�����ص��Ϊ���3�ĸ���
    %StruInfo(:,:,4)=temp4,temp4Ϊÿ�����ص��Ϊ���4�ĸ���
    [StruInfo]=GanChangFenbu1(maxX,maxY,IX,IM);
    %QiuJunzhiFangcha����gauss(maxX,maxY,3)ΪP(X/Wi)�ĸ���
    [gauss]=QiuJunzhiFangcha(y1,y2,y3,y4,IM,maxX,maxY);
    %BianXiangsuLeibie2����
    %��ʾfigure(3)
    [IX,times,IMMRF]=BianXiangsuLeibie2(maxX,maxY,StruInfo,gauss,IX,times);
    if yyy==30%����������yyy����ͳ�Ƶ�������
        [IX,times,IMMRF]=BianXiangsuLeibie2(maxX,maxY,StruInfo,gauss,IX,times);
        break;
    end
end
IMMRF=uint8(IMMRF);
figure(5);
imshow(IMMRF);
title('MRFͼ��');
imwrite(IMMRF,'ͼ��.jpg')
CStruInfo=zeros(cluster_n,r*c);


%��ԭͼ����Χ�������0
IM2=zeros(maxX+2,maxY+2);
%figure(8)
%imshow(IMMM)

for i=1:maxX
    for j=1:maxY
        IM2(i+1,j+1)=IM(i,j);
    end
end
[N_maxX,N_maxY]=size(IM2);

%{
%FCM-MRF����
chuan = 3;
mrf_fcm = zeros(r,c);
m_aver = zeros(r-chuan+1,c-chuan+1);
m_fangcha = zeros(r-chuan+1,c-chuan+1);
for i = ceil(chuan/2):r - ceil(chuan/2)
    for j = ceil(chuan/2):c - ceil(chuan/2)
        m_aver(i-ceil(chuan/2)+1,j-ceil(chuan/2)+1) = mean(mean(IMMM(i-floor(chuan/2):i+floor(chuan/2),j-floor(chuan/2):j+floor(chuan/2))));
        m_fangcha(i-ceil(chuan/2)+1,j-ceil(chuan/2)+1) = std2(IMMM(i-floor(chuan/2):i+floor(chuan/2),j-floor(chuan/2):j+floor(chuan/2)));
        if abs(IMMM(i,j)-m_aver(i-ceil(chuan/2)+1, j-ceil(chuan/2)+1)) < m_fangcha(i-ceil(chuan/2)+1, j-ceil(chuan/2)+1)
            mrf_fcm(i,j) = 1;
        else
            mrf_fcm(i,j) = 0;
        end
    end
end


end_picture1=mrf_fcm.*im2double(IMMM);
end_picture2=(1-mrf_fcm).*im2double(IMMRF);
end_picture=(end_picture1+end_picture2);
end_picture=end_picture./max(max(end_picture));
Picture=uint8(end_picture*255);
figure(6);
imshow(Picture);
title('���ͼƬ');
imwrite(Picture, 'mrf_fcm.jpg');
%}


LOF=zeros(maxX,maxY);
COUNT=0;
for i=1:maxX
    for j=1:maxY
        X=IM2(i:i+2,j:j+2);
        COUNT=COUNT+1;
        [lof]=aerfa(X);
        LOF(i,j)=lof(5);
    end
end

end_picture1=LOF.*im2double(IMMM);
end_picture2=(1-LOF).*im2double(IMMRF);
end_picture=(end_picture1+end_picture2);
end_picture=end_picture./max(max(end_picture));
Picture = end_picture;
%Picture=uint8(end_picture*255);
figure(6);
imshow(Picture);
title('ͼ��');
imwrite(Picture, 'mrf_fcm_lof.jpg');
%{
%���������㷨��Vpc��Vpe
STR=zeros(size(U));
for i=1:r
    for j=1:c
        for k=1:cluster_n
            STR(k,(i-1)*c+j)=StruInfo(i,j,k);
        end
    end
end
lof=zeros(1,r*c);
disp(r);
disp(c);
for i=1:r
    for j=1:c
        lof((i-1)*c+j)=LOF(i,j);
    end
end
lof=repmat(lof,cluster_n,1);
V=(lof.*U+(1-lof).*STR);
%����ָ�ϵ��Vpc
vpc=0;
%����ָ���
vpe=0;
[Ucluster_n,Udata_n]=size(U);
for i=1:Ucluster_n
    for j=1:Udata_n
        vpc=vpc+(V(i,j)^2);
        vpe=vpe+V(i,j)*log(V(i,j));
    end
end

vpc=vpc/Udata_n;
vpe=-vpe/Udata_n;
disp('-----------�ָ�ϵ��Vpc-------------');
disp(vpc);
disp('-----------�ָ���Vpe---------------');
disp(vpe);




SA=zhengquelv(Picture);
disp(SA);
toc;
%color_picture=color(IMMM);
%}
%}
%}
