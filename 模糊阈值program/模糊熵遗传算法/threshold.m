function threshold( im,b1,b2 )
%UNTITLED2 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
[row,col]=size(im);
img=zeros(row,col,3);
for i=1:row
    for j=1:col
        if im(i,j)<b1
            img(i,j,:)=[255,0,0];
        elseif and(im(i,j)<=b2,im(i,j)>=b1)
            img(i,j,:)=[0,255,0];
        else
            img(i,j,:)=[255,255,255];
        end
    end
end
figure();
title('���º�ͼ��');
imshow(uint8(img));

