function [g] = processing(img,moshi)
%��ͼ�����Ԥ����
%ʹ��canny���Ӻ�ֱ��ͼ�����㷨�������Ϸ�������Ԥ����
se = strel('disk', 3);
[r,c,channel] = size(img);
if channel == 3
    img_gray = rgb2gray(img);
else
    img_gray = img;
end

% img_gray_ = double(img_gray);
% %������˹�񻯴���
% w = fspecial('laplacian', 0);
% g1 = imfilter(img_gray, w, 'replicate');
% g = img-g1;
% 
% %��ͼ������ֵ�ָ�����Ͳ��ֽ���ȥ��
% thres = 30;
% while 1
%     T = zeros(r,c);
%     mean_1 = 0;
%     mean_2 = 0;
%     for i=1:r
%         for j=1:c
%             if img_gray_(i,j) >= thres
%                 mean_1 = mean_1 + img_gray_(i,j);
%                 T(i,j) = 1;
%             else
%                 mean_2 = mean_2 + img_gray_(i,j);
%             end
%         end
%     end
%     thres_1 = length(find(T == 1));
%     thres_2 = length(find(T == 0));
%     thres_1 = mean_1 / thres_1;
%     thres_2 = mean_2 / thres_2;
%     if abs(thres - (thres_1+thres_2)/2) < 1
%         break
%     end
%     thres = (thres_1+thres_2)/2;
% end
% 
% %canny��Ե����㷨
% % canny_img = edge(img_gray, 'sobel',0.09);
% % for i =1 :r
% %     for j=1:c
% %         if canny_img(i,j) == 0
% %             canny_img(i,j) = 255;
% %         else
% %             canny_img(i,j) = 0;
% %         end
% %     end
% % end
% %ֱ��ͼ�����㷨
% 
% 
% 
% J=histeq(img_gray);  %ֱ��ͼ���⻯
% 
% J = J.*uint8(T);
% k1 = 0.5;
% A = k1*g + (1-k1)*J;
% figure;
% imshow(A);
% title('�ں�laplacian��ֱ��ͼ����');
% 
% I = find(T == 1);
% 
% I_img = img_gray(I);
% t = thres+30;
% while 1
%     thres_1 = [];
%     thres_2 = [];
%     for i=1:length(I_img)
%         if I_img(i) < t
%             thres_1 = [thres_1 I_img(i)];
%         else
%             thres_2 = [thres_2 I_img(i)];
%         end
%     end
%     mean_1 = mean(thres_1);
%     mean_2 = mean(thres_2);
%     if abs(t-(mean_1+mean_2)/2)<1
%         break
%     else
%         t = (mean_1+mean_2)/2;
%     end
% end
% I_1 = zeros(r,c);I_2 = zeros(r,c);
% a = find(img_gray>t);
% I_1(a) = img_gray(a);
% I_1_hist = histeq(I_1);
% b = find(img_gray<=t);
% I_2(b) = img_gray(b);
% I_2_hist = histeq(I_2);
% %�ڶ�����ֵ�����ͼ�����ֱ��ͼ���⴦��
% figure;
% imshow(I_1);
% title('������ֵ');
% figure;
% imshow(I_2);
% title('С����ֵ');
% % %canny_img = canny_img.*T;
% figure,
% subplot(181),imshow(img);
% title('ԭͼ')
% subplot(182),imshow(g);
% title('������˹�񻯴���')
% subplot(183),imshow(J);
% title('ֱ��ͼ����');
% subplot(184),imshow(A);
% title('�ں�ͼ��');
% subplot(185),imhist(img_gray,64);
% title('ԭͼ��ֱ��ͼ');
% subplot(186),imhist(J,64);
% title('���⻯���ֱ��ͼ');
% subplot(187),imhist(g,64);
% title('������˹�񻯺�ֱ��ͼ');
% subplot(188),imhist(A,64);
% title('�ںϺ�ֱ��ͼ');
% g = img;
% 
% k_ = 0.1;
% K = zeros(r,c);
% window = 11;
% sita = (std2(img_gray))^2;
% for i=1+floor(window/2):r-floor(window/2)
%     for j=1+floor(window/2):c-floor(window/2)
%         sita_window = (std2(img_gray(i-floor(window/2):i+floor(window/2), j-floor(window/2):j+floor(window/2))))^2;
%         K(i,j) = k_*(sita_window^2 / sita^2)-k_;
%     end
% end
% disp(uint8(K));
% g = double(J) + K.*double(g);
% disp(g);
% figure;
% imshow(g);
% title('������˹�� �ں� ֱ��ͼ�����㷨 ͼ����ǿ');
% G = zeros(r,c);
% for i = 1:r
%     for j = 1:c
%         if img(i,j)^2>255
%             G(i,j)=255;
%         else
%             G(i,j) = img(i,j)^2;
%         end
%     end
% end
% 
if nargin == 1
    g = imclose(img, se);
end
if moshi == 1
    g = imerode(img, se); %gΪ��ʴͼ��
elseif moshi == 2
    g = imopen(img, se);%g1Ϊ������
elseif moshi == 3
    g = imclose(img,se);%g2������
elseif moshi == 4
    g2 = imclose(img, se);
    g = imopen(g2, se);%g3Ϊ�տ�����
elseif moshi == 5
    g =  imdilate(img, se);%g4Ϊ��������
elseif moshi == 6
    g1 = imopen(img, se);
    g2 = img-g1;
    g3 = imclose(img, se);
    g4 = g3 - img;
    
    g = g2+img-g4;
else
    err('param should be 1-5');
end

