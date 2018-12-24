function [ th ] = mohuzhi( I )

%��������ֵ
%����ͼ��ĻҶ���Сֵ�����ֵ
tmin = min(I(:));
tmax = max(I(:));
%�趨��ʼ��ֵ
th = (tmin+tmax)/2;
%���忪�ر��������ڿ���ѭ������
ok = true;
%������������ֵ
while ok
    g1 = I >= th;
    g2 = I < th;
    u1 = mean(I(g1));
    u2 = mean(I(g2));
    thnew = (u1+u2)/2;
    %�趨������ֵ�ıȽϵ�����С��1ʱֹͣѭ��
    ok = abs(th - thnew) >= 1;
    th = thnew;
end

%min_I = min(min(I));
%max_I = max(max(I));
%disp(fprintf('��Сֵ:%.5f',min_I));disp(fprintf('���ֵ:%.5f',max_I));
%th = floor(th);

%{
%KSW���㷨

[X, Y] = size(I);
figure ();
% ����ͼ��ֱ��ͼ
hist = imhist(I);
p = hist/(X*Y); % ���Ҷȸ���
 
sumP = cumsum(p);
sumQ = 1-sumP;
%��256���Ҷ���Ϊ256���ָ���ֵ���ֱ�������ֵ�µĸ����ܶȺ���
c0 = zeros(3506, 3506);
c1 = zeros(3506, 3506);
for i = 6494:10000
    for j = 6494:i
        if sumP(i) > 0
            c0(i,j) = p(j)/sumP(i); %���������ֵ�µ�ǰ�������ܶȺ���
        else
            c0(i,j) = 0;
        end
        for k = i+1
            if sumQ(i) > 0;
                c1(i,k) = p(k)/sumQ(i); %���������ֵ�µı��������ܶȺ���
            else
                c1(i,k) = 0;
            end
        end
    end 
end
 
%���������ֵ�µ�ǰ���ͱ������ص��ۼ���
H0 = zeros(3506, 3506);
H1 = zeros(3506, 3506);
for i = 6494:10000
   for j = 6494:i
       if c0(i,j) ~=0
           H0(i,j) =  - c0(i,j).*log10(c0(i,j));  %���������ֵ�µ�ǰ����
       end
       for k = i+1:10000
          if c1(i,k) ~=0
              H1(i,k) =  -c1(i,k).*log10(c1(i,k));  %���������ֵ�µı�����
          end
       end
   end  
end
HH0 = sum(H0,2);
HH1 = sum(H1,2);
H = HH0 + HH1; 
[value, Threshold] = max(H);
 
%BW = im2bw(Imag, Threshold/10000);

%xlabel(['�����', num2str(Threshold)]);




%}

end

