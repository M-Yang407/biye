function [imOut,iter] = FLICM_clustering( imgFileName, cNum, m, winSize, maxIter, thrE )
%FLICM_clustering
%
% Usage:   [imOut,iter] = FLICM_clustering( imgFileName, cNum, m, winSize, maxIter, thrE )
% Inputs: 
%   imgFilename    Filename of the input image.
%   cNum           Number of clusters.
%   m              Weighting exponent on each fuzzy membership.
%   winSize        Size of the local window.
%   maxIter        Maximum number of iterations.
%   thrE           Threshold that stops the algorithm.
% Outputs:
%   imOut          The clustered image.
%   iter           The number of iterations made by the algorithm.
%
% Running example:
%   [imOut,iter] = FLICM_clustering('brain.tif',3,2,3,500,0.001);
%   figure, imshow(imOut)
%
%   author: Yan_47����Krinidis Stelios�����ģ�Krinidis S, Chatzis V. A robust fuzzy local information C-means clustering algorithm[J]. 
%   IEEE Transactions on Image Processing, 2010, 19(5): 1328-1337.д��matlabʵ�֡�
%   E-mail�� yan_siqi@qq.com
%   2016/12/7 to run on Matlab R2014a 



% ����ͼ��
image = imread( imgFileName );%0-255��Uint8��
if( size(image,3)>1 )%�Բ�ɫͼ��ת��Ϊ�Ҷ�ͼ��
    image = rgb2gray( image );
end
image = double( image );%0-255��double��

% �����ʼ�������Ⱦ���U,��СΪ(H,W,cNum)
[H,W] = size( image );
U=rand(H,W,cNum);
col_sum=sum(U,3);
U=U./col_sum(:,:,ones(cNum,1)); %����һ��ά����ͬ�ľ��󣬵�3ά����1�൱��û��

% FLICM
[U,iter] = FLICM( image, H, W, U, m, cNum, winSize, maxIter, thrE );

% Create output image
cmap = hsv(cNum);
[~,clus] = max( U, [], 3 );
Ir = zeros(size(image));    Ig = zeros(size(image));    Ib = zeros(size(image));
for i=1:cNum
    q = find( clus==i );
    Ir(q) = round(cmap(i,1)*255);
    Ig(q) = round(cmap(i,2)*255);
    Ib(q) = round(cmap(i,3)*255);
end
imOut(:,:,1) = uint8(Ir);
imOut(:,:,2) = uint8(Ig);
imOut(:,:,3) = uint8(Ib);

%��������
end