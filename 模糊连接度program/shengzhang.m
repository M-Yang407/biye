function shengzhang( img )
%UNTITLED6 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
figure;
imshow(img)
x = ginput(1);
axis on
hold on
[row,col] = size(img);
Q = [];
M = [];
M_x = [];M_y = [];

