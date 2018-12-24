function [J] = shengzhan(I,K)

if( ~( size(I,3)-3 ))
    I = rgb2gray(I);%ת��Ϊ��ͨ���Ҷ�ͼ
end
I = im2double(I); %ͼ��Ҷ�ֵ��һ����[0,1]֮��

gausFilter = fspecial('gaussian',[5 5],0.5);
I = imfilter(I,gausFilter,'replicate');
 
%���ӵ�Ľ���ʽѡ��
%if( exist('x','var') == 0 && exist('y','var') == 0)
%    subplot(2,2,1),imshow(I,[]);
%    hold on;
subplot(2,2,1), imshow(I,[]);


J = zeros(size(I)); % �������ķ���ֵ����¼�����������õ�������
Isizes = size(I);

%��¼�������ص����ӵ��ָ������ľ�����
%��һ�δ��������ĸ��������ص�͵�ǰ���ӵ�ľ���
%�����ǰ����Ϊ��x,y����ôͨ��neigb���ǿ��Եõ����ĸ��������ص�λ��

neigb = [ -1 0;
          1  0;
          0 -1;
          0  1];

 %��ʼ�������������������д��������������ص���Ѿ��ָ�õ��������ص�ĻҶ�ֵ����
 %����reg_maxdis,������������
 for k=1:K
    %�����µ��������ص�neg_list��
    [X,Y] = ginput(1);
    x = round(Y);
    y = round(X);
    reg_mean = I(x, y);%��ʾ�ָ�õ������ڵ�ƽ��ֵ����ʼ��Ϊ���ӵ�ĻҶ�ֵ
    reg_var = I(x,y);
    disp([x,y]);
    reg_size = 1;%�ָ�ĵ������򣬳�ʼ��ֻ�����ӵ�һ��
    neg_free = 10000; %��̬�����ڴ��ʱ��ÿ������������ռ��С
    neg_list = zeros(neg_free,3);
    %���������б�����Ԥ�ȷ������ڴ�������������ص������ֵ�ͻҶ�ֵ�Ŀռ䣬����
    %���ͼ��Ƚϴ���Ҫ���neg_free��ʵ��matlab�ڴ�Ķ�̬����
    neg_pos = 0;%���ڼ�¼neg_list�еĴ����������ص�ĸ���
    pixdist = 0;
    f = 10;
    while and(pixdist < 0.06, reg_size<numel(I))
        for j=1:4
             xn = x + neigb(j,1);
             yn = y + neigb(j,2);    
             %������������Ƿ񳬹���ͼ��ı߽�
             ins = (xn>=1)&&(yn>=1)&&(xn<=Isizes(1))&&(yn<=Isizes(1));
             %�������������ͼ���ڲ���������δ�ָ�ã���ô������ӵ������б���
             if( ins && J(xn,yn)==0) 
                 neg_pos = neg_pos+1;
                 neg_list(neg_pos,:) = [ xn, yn, I(xn,yn)];%�洢��Ӧ��ĻҶ�ֵ
                 J(xn,yn) = 1;%��ע���������ص��Ѿ������ʹ� ������ζ�ţ����ڷָ�������
             end
        end 
        if or(~find(neg_list ~= 0), neg_pos == 0)
            break
        end
        
        %���������ڴ���ʲ����������µ��ڴ�ռ�
        if (neg_pos+10>neg_free)
            neg_free = neg_free + 100000;
            neg_list((neg_pos +1):neg_free,:) = 0;
        end
        
        
        %���������ķ���
        %�����д����������ص���ѡ��һ�����ص㣬�õ�ĻҶ�ֵ���Ѿ��ָ������ҶȾ�ֵ��
        %��ľ���ֵʱ����������������С��
        dist = abs(neg_list(1:neg_pos,3)-reg_mean);
        [pixdist,index] = min(dist);
      
        %����������µľ�ֵ
        reg_mean = (reg_mean * reg_size +neg_list(index,3))/(reg_size + 1);
        reg_size = reg_size + 1;
        %���ɵ����ӵ���Ϊ�Ѿ��ָ�õ��������ص�
        J(x, y)=2;%��־�����ص��Ѿ��Ƿָ�õ����ص�
        x = neg_list(index,1);
        y = neg_list(index,2);
        
        %���µ����ӵ�Ӵ����������������б����Ƴ�
        neg_list(index,:) = neg_list(neg_pos,:);
        neg_pos = neg_pos -1;
        
        

        %{
        %���º����������,��ʹ�����ֱ�߷������д���,�����ֱ�߾�������ĵ㴢������ӵ�)
        %neg_listΪ���������б�
        %neg_pos�����б��ڵĸ���
        %reg_size���ӵ����
        %[a, b] = nihe([1:1:length(neg_list(1:neg_pos,3))], neg_list(1:neg_pos, 3));%���ֱ��
        %dist = abs(neg_list(1:neg_pos, 3)'- a*[1:1:length(neg_list(1:neg_pos, 3))] -b);

        [a, b, c] = nihe([1:1:length(neg_list(1:neg_pos,3))], neg_list(1:neg_pos, 3));
        dist = abs(neg_list(1:neg_pos,3) - (4*a*c-b^2)/(4*a));
        disp(fprintf('dist:',dist));
        %dist = abs(neg_list(1:neg_pos,3)-reg_mean);
        [pixdist,index] = min(dist);
        disp(fprintf('pixdist:',pixdist));
        %����������µľ�ֵ
        reg_mean = (reg_mean * reg_size +neg_list(index,3))/(reg_size + 1);
        reg_size = reg_size + 1;
        %���ɵ����ӵ���Ϊ�Ѿ��ָ�õ��������ص�
        J(x, y)=2;%��־�����ص��Ѿ��Ƿָ�õ����ص�
        x = neg_list(index,1);
        y = neg_list(index,2);
        if neg_pos == 0
            break 
        end
        %���µ����ӵ�Ӵ����������������б����Ƴ�
        neg_list(index,:) = neg_list(neg_pos,:);
        neg_pos = neg_pos -1;
        


        
        %���º����������
        %neg_listΪ���������б�
        %neg_pos�����б��ڵĸ���
        %reg_size���ӵ����
        %[a, b] = nihe([1:1:length(neg_list(1:neg_pos,3))], neg_list(1:neg_pos, 3));
        %dist = abs(neg_list(1:neg_pos, 3)'- a*[1:1:length(neg_list(1:neg_pos, 3))] -b);
        reg_mean = mean(neg_list(1:neg_pos, 3)); 
        reg_var = var(neg_list(1:neg_pos, 3));
       
        disp(fprintf('�������Ӷ�%.5f <====> %.5f',reg_mean - f*reg_var, reg_mean + f*reg_var));
        
        [dist] = find(and(neg_list(1:neg_pos, 3) > reg_mean - f*reg_var, neg_list(1:neg_pos, 3)< reg_mean + f*reg_var));      
        %dist_min = abs(neg_list(dist);
        [pixdist,index] = min(dist);
        disp(fprintf('pixdist:',pixdist));
        %����������µľ�ֵ
        %reg_mean = (reg_mean * reg_size +neg_list(index,3))/(reg_size + 1);
        %reg_var = sqrt();
        reg_size = reg_size + 1;
        %���ɵ����ӵ���Ϊ�Ѿ��ָ�õ��������ص�
        J(x, y)=2;%��־�����ص��Ѿ��Ƿָ�õ����ص�
        %[J_x, J_y] = find(J == 2);
        %reg_mean = mean(mean(I(J_x, J_y)));
        %reg_var = std2((I(J_x, J_y)));
        x = neg_list(index,1);
        y = neg_list(index,2);
        if or(neg_pos == 0, index == 0)
            break 
        end
        disp(size(index))
        if size(index) == [0, 0] 
            neg_list(index) = neg_list(neg_pos);
        else
            %���µ����ӵ�Ӵ����������������б����Ƴ�
            neg_list(index,:) = neg_list(neg_pos,:);
        end
        neg_pos = neg_pos -1;
        disp(neg_pos);
        if neg_pos == 0
            break
        end
        %}
    end

 end
 J = (J==2);%����֮ǰ���ָ�õ����ص���Ϊ2
 hold off;
 subplot(2,2,2),imshow(J);
 J = bwmorph(J,'dilate');%����ն�
 subplot(2,2,3),imshow(J);
 subplot(2,2,4),imshow(I+J);
%}
%{
%function [J] = shengzhan(I) 
I =imread('30.jpg');
if( ~( size(I,3)-3 ))
    I = rgb2gray(I);%ת��Ϊ��ͨ���Ҷ�ͼ
end
I = double(I); %ͼ��Ҷ�ֵ��һ����[0,1]֮��
%Ireshape = imresize(I,[600,800]);
%I = Ireshape(51:475,200:699);
gausFilter = fspecial('gaussian',[5 5],0.5);
I = imfilter(I,gausFilter,'replicate');
 
%���ӵ�Ľ���ʽѡ��
if( exist('x','var') == 0 && exist('y','var') == 0)
    subplot(2,2,1),imshow(I,[]);
    hold on;
    [y,x] = getpts;%���ȡ��  �س�ȷ��
    x = round(x(1));%ѡ�����ӵ�
    y = round(y(1));
end
 
if( nargin == 0)
    reg_maxdist = 0.1;
    %nargin��matlab�����д�г��õ�һ�����ɣ���Ҫ���ڼ��㵱ǰ�����������������
    %����һ����Ը���nargin�ķ���ֵ��ȷ�����������������ȱʡֵ����ʵ���У����
    %�û�����Ĳ�������Ϊ�㣬��ôĬ��Ϊ0.2
end
J = zeros(size(I)); % �������ķ���ֵ����¼�����������õ�������
Isizes = size(I);
reg_mean = I(x,y);%��ʾ�ָ�õ������ڵ�ƽ��ֵ����ʼ��Ϊ���ӵ�ĻҶ�ֵ
reg_size = 1;%�ָ�ĵ������򣬳�ʼ��ֻ�����ӵ�һ��
neg_free = 10000; %��̬�����ڴ��ʱ��ÿ������������ռ��С
neg_list = zeros(neg_free,3);
%���������б�����Ԥ�ȷ������ڴ�������������ص������ֵ�ͻҶ�ֵ�Ŀռ䣬����
%���ͼ��Ƚϴ���Ҫ���neg_free��ʵ��matlab�ڴ�Ķ�̬����
neg_pos = 0;%���ڼ�¼neg_list�еĴ����������ص�ĸ���
pixdist = 0;
%��¼�������ص����ӵ��ָ������ľ�����
%��һ�δ��������ĸ��������ص�͵�ǰ���ӵ�ľ���
%�����ǰ����Ϊ��x,y����ôͨ��neigb���ǿ��Եõ����ĸ��������ص�λ��
neigb = [ -1 0;
          1  0;
          0 -1;
          0  1];
 %��ʼ�������������������д��������������ص���Ѿ��ָ�õ��������ص�ĻҶ�ֵ����
 %����reg_maxdis,������������
 l = 0.1;
 
 while (pixdist < 0.06 && reg_size < numel(I))
     %�����µ��������ص�neg_list��
     for j=1:4
         xn = x + neigb(j,1);
         yn = y + neigb(j,2);
         %������������Ƿ񳬹���ͼ��ı߽�
         ins = (xn>=1)&&(yn>=1)&&(xn<=Isizes(1))&&(yn<=Isizes(1));
         %�������������ͼ���ڲ���������δ�ָ�ã���ô������ӵ������б���
         if( ins && J(xn,yn)==0)
             neg_pos = neg_pos+1;
             neg_list(neg_pos,:) =[ xn, yn, I(xn,yn)];%�洢��Ӧ��ĻҶ�ֵ
             J(xn,yn) = 1;%��ע���������ص��Ѿ������ʹ� ������ζ�ţ����ڷָ�������
         end
     end
     
    %���������ڴ���ʲ����������µ��ڴ�ռ�
    if (neg_pos+10>neg_free)
        neg_free = neg_free + 100000;
        neg_list((neg_pos +1):neg_free,:) = 0;
    end
    %neg_listΪ����������ص�
    %�����д����������ص���ѡ��һ�����ص㣬�õ�ĻҶ�ֵ���Ѿ��ָ������ҶȾ�ֵ��
    %��ľ���ֵʱ����������������С��
    %{
    dist = abs(neg_list(1:neg_pos,3)-reg_mean);
    [pixdist,index] = min(dist);
    %����������µľ�ֵ
    reg_mean = (reg_mean * reg_size +neg_list(index,3))/(reg_size + 1);
    reg_size = reg_size + 1;
    %���ɵ����ӵ���Ϊ�Ѿ��ָ�õ��������ص�
    J(x,y)=2;%��־�����ص��Ѿ��Ƿָ�õ����ص�
    x = neg_list(index,1);
    y = neg_list(index,2);
    %}
    %ѡȡ�����������ص��еľ�ֵ�ͷ���
    reg_mean = mean(neg_list(1:neg_pos,3));
    reg_var = var(neg_list(1:neg_pos,3));
    [p, index]=find(and(neg_list(1:neg_pos,3) > reg_mean-l*reg_var, neg_list(1:neg_pos,3)<reg_mean+l*reg_var));
    reg_size = reg_size + 1;
    J(x, y) = 2;
    x = neg_list(min(index), 1);
    y = neg_list(min(index), 2);

    %���µ����ӵ�Ӵ����������������б����Ƴ�
   
    neg_list(min(index),:) = neg_list(neg_pos,:);
    neg_pos = neg_pos -1;
 end

 J = (J==2);%����֮ǰ���ָ�õ����ص���Ϊ2
 hold off;
 subplot(2,2,2),imshow(J);
 J = bwmorph(J,'dilate');%����ն�

 subplot(2,2,3),imshow(J);
 subplot(2,2,4),imshow(I+J);
%}