%A robust fuzzy local information c-means clustering algorithm
%write by 2016-10-28
%�������ѵ㣺ģ������Gki�Ĺ���
clear all;
close all;
clc
path='27.jpg';
tic;%tic %������һʱ��
t6=clock;
eval(['info=imfinfo(path)']);
switch info.ColorType
    case 'truecolor'    %���ɫͼƬ
       eval(['RGB=imread(path);']);
       I=rgb2gray(RGB);
       clear RGB;
    case 'indexed'      %����ͼƬ
       eval(['[X,map]=imread(path);']);
       I=ind2gray(X,map);
       clear X;
    case 'grayscale'     %�Ҷ�ͼ��
        eval(['I=imread(path);']);
end
% I=[ones(128,64)*20,ones(128,64)*120];
% I=uint8(I);
% I = imresize(I, [318 480]);
figure,imshow(I);
title('ԭʼͼƬ');
[m,n]=size(I);
pic=I;
%I = uint8(double(I) + wgn(m, n, 15));
%I=imnoise(I,'gaussian',0,0.02);
% I=imnoise(I,'salt & pepper',0.2);
figure,imshow(I);
title('���������ͼƬ');
picc=I;


width=3;                 %���ô������Ĵ�С
%��������λ����Ϣ
[neipos,wid]=fneighbor(I,width);
%����ͼ������
I=double(I);
data = reshape(I, numel(I), 1); %��ͼ������ת��Ϊһ������
%������ʼ��
options=[2;300;1e-5;0];
cluster_n=4;                    %���������
[center,U,obj_fcn,iter_n]=myfcm(data,neipos,wid,cluster_n,options);%����FCM����
%���������
maxU=max(U);%���������Ⱦ���ÿһ�е����ֵ
temp=sort(center);%������ÿ�н�����������
disp(size(maxU));
disp(size(U));
for n=1:cluster_n   %���������ָ�ͼ��
    eval(['cluster',int2str(n), '_index = find(U(', int2str(n), ',:) == maxU);']);
    %���壺�������Ⱦ����еĵ�n���ҵ����ڸ��е���������ȵ�������
    %�������Ŷ�ӦԪ�����ڵ�n��
    index=find(temp==center(n));
    %�ҵ�ԭ��������������������ĵ�������
    switch index
        case 1
            color_class=0;
        case 2
            color_class=80;
        case 3
            color_class=160;
        case cluster_n
            color_class=255;
        otherwise
%             color_class=fix(255*(index-1)/(cluster_n-1));
            color_class=128;
    end
    eval(['I(cluster',int2str(n), '_index(:))=', int2str(color_class),';']);
    %ֱ�����þ��������Ѱַ���и�ֵ
end
% I=mat2gray(I);%%%%%������Ҹ����εģ�ԭ����˼��2ֵ����
figure,imshow(uint8(I));
title('FLICM�ָ��ͼƬ');
% imwrite(I,'FLICM999.bmp');
disp(['����ʱ�䣺',num2str(etime(clock,t6))])
imwrite(uint8(I),'FLICM����.jpg');
imwrite(uint8(255-I),'�ֲ�ģ����Ϣ������Ʒ���NCMFLICM9991.bmp');

%�ָ���������
% [Vpc,Vpe,Vxb,SA]=evaluation(data,U,cluster_n,center,I);
% fprintf('ͼ��Ļ���ϵ��=%d,������=%d,��ȷ�ָ���=%d\n',Vpc,Vpe,SA);

