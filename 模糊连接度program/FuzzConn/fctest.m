%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Fuzzy connectedness segmentation example
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;
close all;
clc;
%Read image and scale to [0,1]
I_ = imread('44.jpg');

I = double(I_)./255;
figure;
imshow(I);
title('ԭͼ');
%ԭͼ�������̬ѧ�����Աȶ����죩
[I_g] = processing(I_, 6);
%I_g_ = double(I_g)./255;
%����̬ѧ������ͼ����ԭͼ���߶Ƚ��
%I_g = (I_g + I_)/2;
figure;
imshow(I_g);
title('Ԥ����ͼ��');
hold on;
%SLIC(I_);



% disp(kseedsx);
% disp(kseedsy);
% %MΪ���ӵ�����
% %point_seed_x,point_seed_yΪ�Զ�ѡȡ�����ӵ�
% M = 1;point_seed_x=[];point_seed_y = [];I_kseed=[];
% for i =1:length(kseedsx)
%     I_kseed = [I_kseed I_(floor(kseedsx(i)), floor(kseedsy(i)))];
% end
% disp(I_kseed);
% for i=1:M
%     point = find(I_kseed == max(I_kseed));
%     point_seed_x = [point_seed_x floor(kseedsx(point))];
%     point_seed_y = [point_seed_y floor(kseedsy(point))];
%     I_kseed(point) = [];
%     kseedsx(point) = [];kseedsy(point) = [];
% end
% 
% figure(3);
% imshow(I);
% hold on;
% plot(point_seed_x, point_seed_y,'or');
% hold off;
%�����طָ�ȷ�����������ĳ�ʼ���ӵ�
%Super_peiels(I);

%Read image and scale to [0,1]
%I = double(imread('30.jpg'))./255;
%ԭͼ�������̬ѧ����
%[I_g] = processing(I);
%����̬ѧ������ͼ����ԭͼ���߶Ƚ��
%I = (I_g +I)/2;





[r,c]=size(I_g);

%Compute adjacency
%�����ڽ�U��(c,d)
n=1;
k1=0.1;
%A��ʾͼ��������������ڽӶ�U��(c,d)
%A(r*c,r*c)
%ͼ����ֻ�е�ǰ�����4��������ص�����ڽӶȣ�����Ϊ0
A=adjacency(I_g, n, k1);   %����̬ѧ����ͼƬ
A_ = adjacency(I, n, k1);  %��ԭͼ��
%Compute affinity
%�����׺Ͷ�
disp(size(I));
disp(size(A));
k2=2;
K=affinity(I, A, k2);       %��̬ѧͼƬ
K_ = affinity(I, A_, k2);    %ԭͼ��
%{
S=zeros(r,c);
for i=1:length(point_seed_x)
    S(point_seed_y(i), point_seed_x(i)) = 1;
end
%}
%Seed points, numbered from 1 and up
k=6;%���ӵ�ѡȡ�ĸ���

%k-meansȷ�Ͼ�������


%S=zeros(r,c);
%S(point_seed_x, point_seed_y) = 1;
figure(4);

[SS, x_, y_] = shengzhan(I_g, k);          %����̬ѧ
kuagntu(SS);

% figure(5);
% [S_, x_, y_] = shengzhan(I, 0, x_, y_);   %ԭͼ��
% kuagntu(S_);
%{
s=zeros(r,c);
n=0;m=0;
n_ = 0;m_ = 0;m_x=[];m_y=[];n_x=[];n_y=[];
for i=1:r
    for j=1:c
         if  SS(i, j) == 1 && S_(i, j) == 1
             s(i,j) = 1;
             n_x = [n_x i];
             n_y = [n_y j];
             n = n+1;
             n_ = n_+ I_(i, j);
         end
         if and(SS(i,j) == 0, S_(i,j) ==0)
             s(i,j) = 0;
             m_x = [m_x i];
             m_y = [m_y j];
             m = m + 1;
             m_ = m_ + I_(i,j);
         end
    end
end
disp(size(n_x));
disp(size(I_(n_x, n_y)));
%bar(I_(n_x, n_y));
%bar(I_(m_x, m_y));

m_j = m_/m;n_j = n_/n;
for i=1:r
    for j=1:c
        if or(and(SS(i,j)==1, S_(i, j) == 0), and(SS(i, j) == 0, S_(i, j) == 1)) 
             if abs(I_(i,j) - m_j) < abs(I_(i, j) - n_j)
                 s(i,j) = 0;
             else
                 s(i, j) = 1;
             end 
         end
     end
end
 S = s;
 figure;
 subplot(2,2,1),imshow(I_);
 subplot(2,2,2),imshow(S);
 %J = bwmorph(S,'dilate');%����ն�

 subplot(2,2,3),imshow(S);
 subplot(2,2,4),imshow(im2double(I_)+S);
 title('��Ͻ��');
 hold off;
%disp(x*128);disp(y*128);
%S(75:80,25:30)=1; %coat
%S(60:65,40:45)=1; %hand
%S(110:115,20:25)=1; %leg

%S(10:15,80:85)=2; %sky
%S(100:105,110:125)=3; %grass
%}
%Show seeds overlayed on image
%{
I_rgb=repmat(I_g_,[1,1,3]); %make rgb image (required by imoverlay)
disp(size(I_rgb));
figure(6)
image(I_rgb)
imoverlay(SS,SS>0); %requires image in range [0,1]
title('Seed xingtai regions');

%Compute FC
%ͼ�����������ص�������ӵ��ģ�����ӶȾ���FC
%K�׺ͶȾ���
%SΪ���ӵ����mask��ʾ
%SΪmaskͼ��,KΪģ���׺Ͷ�
disp(sprintf('Processing...'));
FC=afc(SS,K); %Absolute FC

%Show resulting FC-map
figure(7)
%��FCͼ����0-1��ʾ
imagesc(FC,[0,1])
colorbar
title('Fuzzy connectedness map');
%Threshold value
%thresh=0.79;

[thresh] = mohuzhi(FC);
disp(thresh);
%Show the 0.75-connected component overlayed on original image
figure(8)
image(I_rgb);
imoverlay(FC,FC>0);
title(sprintf('Fuzzy connected component at level %.2f',thresh));
%}
