function [g2] = processing(img)
se = strel('disk', 3);
g = imerode(img, se); %gΪ��ʴͼ��
g1 = imopen(img, se);%g1Ϊ������
g2 = imclose(img,se);%g2������
g3 = imopen(g2, se);%g3Ϊ�տ�����
g4 =  imdilate(img, se);%g4Ϊ��������


%subplot(1,2,1),imshow(img),title('ԭͼ');
%subplot(1,2,2),imshow(img_close), title('��ʴͼ��');