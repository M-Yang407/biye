function [k_label_x, k_label_y] = SLIC(img)
%img = imread('27.jpg');
sigma = 1;%��׼���С
window = double(uint8(3*sigma)*2+1);
H = fspecial('gaussian', window, sigma);%�˲�����
img = imfilter(img, H, 'replicate');
%{
figure;
title('��˹�˲�ͼ��');
imshow(img);
hold on;
%}
[r, c, channel] = size(img);
%disp(channel);
%�Ҷ�ͼ��Ĵ���ʽ
if channel == 1
    for i=1:r
        for j=1:c
            A((i-1)*c+j, 1) = img(i,j);
            A((i-1)*c+j, 2) = img(i,j);
            A((i-1)*c+j, 3) = img(i,j);
        end
    end
    img = reshape(A, r,c,3);
end

img_size = size(img);   %����Ԫ�أ�ͼ��ĸߡ�ͼ��Ŀ�ͼ���ͨ����
%disp(img_size);
%�趨�����ظ���
K = 50;
%�趨�����ؽ���ϵ��
m_compactness = 20;

%ת����LABɫ�ʿռ�
cform = makecform('srgb2lab');       %rgb�ռ�ת����lab�ռ� matlab�Դ����÷�
img_Lab = applycform(img, cform);    %rgbת����lab�ռ�
%img_Lab = RGB2Lab(img);  %�����ò�֪��Ϊʲô
%imshow(img_Lab)
% %����Ե
% img_edge = DetectLabEdge(img_Lab);
% imshow(img_edge)

%�õ������ص�LABXY���ӵ���Ϣ
%KΪ�����ظ���
disp(fprintf('ͼ��:%d, ͼ���:%d', c, r));
img_sz = img_size(1)*img_size(2);%img_szͼ���С
disp(fprintf('ͼ���С: %d',img_sz));
superpixel_sz = img_sz/K;        %�����صĴ�Сsuperpixel_sz
disp(fprintf('�����ش�С: %f', superpixel_sz));
STEP = uint32(sqrt(superpixel_sz));%�����صı߳�STEP
disp(fprintf('�����ر߳�:%f', STEP));
xstrips = uint32(img_size(2)/STEP);%ͼ��ÿһ�еĳ����ظ���xstrips
disp(fprintf('xstrips:%d', xstrips));
ystrips = uint32(img_size(1)/STEP);%ͼ��ÿһ�еĳ����ظ���ystrips
disp(fprintf('ystrips:%d', ystrips));
xstrips_adderr = double(img_size(2))/double(xstrips);%ÿһ���������ĵ�x�����ƶ�����
disp(fprintf('xstrips_adderr:%f', xstrips_adderr));
ystrips_adderr = double(img_size(1))/double(ystrips);%ÿһ���������ĵ�y�����ƶ�����
disp(fprintf('ystrips_adderr:%f', ystrips_adderr));
numseeds = xstrips*ystrips;   %numseeds���ӵ�ĸ���
disp(fprintf('���ӵ����:%d', numseeds));

%���ӵ�xy��Ϣ��ʼֵΪ������������������
%���ӵ�Lab��ɫ��ϢΪ��Ӧ����ӽ����ص����ɫͨ��ֵ
kseedsx = zeros(numseeds, 1);
kseedsy = zeros(numseeds, 1);
kseedsl = zeros(numseeds, 1);
kseedsa = zeros(numseeds, 1);
kseedsb = zeros(numseeds, 1);
n = 1;
%�����г�ʼ���ӵ����ֵ���廯
for y = 1: ystrips
    for x = 1: xstrips 
        kseedsx(n, 1) = (double(x)-0.5)*xstrips_adderr;
        kseedsy(n, 1) = (double(y)-0.5)*ystrips_adderr;
        kseedsl(n, 1) = img_Lab(fix(kseedsy(n, 1)), fix(kseedsx(n, 1)), 1);
        kseedsa(n, 1) = img_Lab(fix(kseedsy(n, 1)), fix(kseedsx(n, 1)), 2);
        kseedsb(n, 1) = img_Lab(fix(kseedsy(n, 1)), fix(kseedsx(n, 1)), 3);
        n = n+1;
    end
end

n = 1;
%�������ӵ���㳬���ط���
%klabelsÿ��Ԫ�صı�ǩ
[klabels, kseedsx, kseedsy] = PerformSuperpixelSLIC(img_Lab, kseedsl, kseedsa, kseedsb, kseedsx, kseedsy, STEP, m_compactness);


%
img_Contours = DrawContoursAroundSegments(img, klabels);

%�ϲ�С�ķ���
nlabels = EnforceLabelConnectivity(img_Lab, klabels, K); 



%��ȡ���¾�������
M = max(max(nlabels));
k_label_x = zeros(1, M);
k_label_y = zeros(1, M);
k_label_num = zeros(1, M);
for i=1:r
    for j=1:c
        k_label_x(nlabels(i, j)) = k_label_x(nlabels(i, j)) + i;
        k_label_y(nlabels(i, j)) = k_label_y(nlabels(i, j)) + j;
        k_label_num(nlabels(i ,j)) = k_label_num(nlabels(i, j)) + 1;
    end
end
for i=1:M
    k_label_x(i) = k_label_x(i)/k_label_num(i);
    k_label_y(i) = k_label_y(i)/k_label_num(i);
end
plot(k_label_x, k_label_y, '*r');
hold off;

%���ݵõ��ķ�����ǩ�ҵ��߽�
img_ContoursEX = DrawContoursAroundSegments_EX(img, nlabels);
figure(2);

imshow(img_ContoursEX);
title('�����طָ�');




