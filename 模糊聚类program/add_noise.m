%clear;
%clc;
%I=imread('27.jpg');
%figure(1);
%imshow(I);
%title('ԭͼ');
function [disImg]=add_noise(I)
[row,col,nchannel]=size(I);
%In=awgn(I,3,'measured','linear');
disImg=uint8(double(I)+wgn(row,col,20));

%title('������ǿ��9%��');
%label_image=imread('E:\PROJECT code\biye\��ͬ�����ķָ���\3%�����ָ�');
%label_image_=uint8(label_image*255);
%disp(label_image_);
%figure(3);
%imshow(label_image_);