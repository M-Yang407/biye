function [center,U,obj_fcn,iter_n]=myfcm(data,neipos,wid,cluster_n,options)%����FCM����
if nargin~=4 && nargin~=5
    error('����̫���̫��');
end
data_n=size(data,1);
in_n=size(data,2);
%������ʼ��
expo=options(1);       %FCM�еĲ���m
max_iter=options(2);   %����������
min_impro=options(3); %������ֹ����
display=options(4);   %���������Ƿ���ʾ
obj_fcn=zeros(max_iter,1);%Ŀ�꺯��ֵ����
%��ʼ�������Ⱦ���
U=myfcminit(cluster_n,data_n);
%ѭ������
for i=1:max_iter
    Uold=U;
%     if i>1
%         center1=center;
%     end
    [U,center,obj_fcn(i)]=myfcmstep(data,neipos,wid,U,cluster_n,expo);%���ú�������һ������
    if display==1
        fprintf('��������=%d,obj.fcn=%f\n',i,obj_fcn(i));
    end
    if i>1
        if(norm(U-Uold,Inf))< min_impro
%         if(sqrt(sum((center1-center).^2)))<min_impro
            break;
        end
    end
end
iter_n=i;     %iter_nΪʵ�ʵ�������
obj_fcn(iter_n+1:max_iter)=[];
