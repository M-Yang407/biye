function [img_imerode] = processing(img)
figure;
title('ԭͼ');
imshow(img);
se = strel('disk', 10);
img_imerode = imclose(img,se);
subplot(1,2,1),imshow(img),title('ԭͼ');
subplot(1,2,2),imshow(img_imerode), title('��ʴͼ��');