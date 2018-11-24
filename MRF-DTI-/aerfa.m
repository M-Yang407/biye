function [lof] = aerfa(X)
%LOF�㷨
%distΪm*m�ľ������ÿһ�д���һ���������������ݾ���������������Ըþ���Ϊ
%�Խ���Ϊ0�ģ����ڶԽ��߶ԳƵľ���,KΪk-����
%function lof = LOF(IM,K)
%A=importdata('data.mat');%��Ҫ������Ⱥ�����㷨��������ݼ�
%numData=size(A,1);
%for i=1:1:numData
%[~,dist]=knnsearch(A(i,:),A(:,:));
%KD=[KD;dist'];
%end

count=0;
for i=1:3
    for j=1:3
        count=count+1;
        IM(count)=X(i,j);        
    end
end
disp(IM)
disp(count)
%IM=[1 2 3 4 5 6 0.1 7 8 29];
m=length(IM);
K=5;
%dist��������֮��ľ�������m*m
for i=1:m
    for j=1:m
        dist(i,j)=IM(i)-IM(j);
    end
end


disp(m)
%m=size(dist,1);                 %mΪ��������distΪ����֮��ľ���
distance = zeros(m,m);
num = zeros(m,m);               %distance ��num������¼������˳�򣬺Ͷ�����˳��
kdistance = zeros(m,1);         %����ÿ�������kdistance
count  = zeros(m,1);            %k����Ķ�����
reachdist = zeros(m,m);         %��������֮���reachable-distance
lrd = zeros(m,1);
lof = zeros(m,1);
%����k-distance
%�����K����
for i=1:m 
    [distance(i,:),num(i,:)]=sort(dist(i,:),'ascend');%distance���������dist��������num��¼����ǰ����dist����λ����Ϣ
    kdistance(i)=distance(i,K+1);%���k���ھ��룬��Ϊ������һ��ֵΪ��������ľ���Ϊ0������k+1���ǵ�k���������
    count(i) = -1;               %�Լ��ľ���Ϊ0��Ҫȥ���Լ�
    for j = 1:m                  %�ų��ж�����ݶԸõ�����ͬ��k���ھ��룬���û����count(i)=k��
        if dist(i,j)<=kdistance(i)
            count(i) = count(i)+1;%����k�������������ݵ����
        end
    end
end 
%����ɴ����
for i = 1:m
    for j=1:i-1                  %�������һ���������εľ���
        reachdist(i,j) = max(dist(i,j),kdistance(j));
        reachdist(j,i) = reachdist(i,j);
    end
end
%����ֲ��ɴ��ܶ�
for i = 1:m
    sum_reachdist=0;
    for j=1:count(i)
        sum_reachdist=sum_reachdist+reachdist(i,num(i,j+1));
    end
    %����ÿ�����lrd
    lrd(i)=count(i)/(sum_reachdist+10^(-5));
end
% �õ��ֲ��쳣����lofֵ
for i=1:m
    sumlrd=0;
    for j=1:count(i)
        sumlrd=sumlrd+lrd(num(i,j+1))/lrd(i);
    end
    lof(i)=sumlrd/count(i);
end

%disp(lof);
%����ʱ�������ݵ�
%{
for i=1:1:m
    if lof(i)<1.5
         plot(i,IM(i),'b.');
         hold on;
    else
         plot(i,IM(i),'ro');
         hold on
     end
end
%}
for i=1:m
    lof(i)=2/(1+exp(lof(i)));
end


end



