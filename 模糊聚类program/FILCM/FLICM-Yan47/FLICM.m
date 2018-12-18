function [U,iter] =FLICM( image, H, W, U, m, cNum, winSize, maxIter, thrE )
%input 
%   image:0-255��double��
%output 
%   U:ά��Ϊ(H,W,cNum)��0-1��double��
sStep = (winSize-1)/2; %�ֲ����ڰ뾶
center=calcCenters( image, U, cNum, m);%���ó�ʼ�����Ⱦ��󣬼����ʼ��������
iter = 0;%��������
dMax = 10.0;%�ȳ�ʼ��һ���ϴ��ֵ��|U_new-U_old|
Uold=U;%Uold����Ҫ��
d1=zeros(cNum,1);%d1Ϊ��ʽ��17���е�G_ki
d2=zeros(cNum,1);%d2Ϊ��ʽ��19���еķ�ĸ��ǰ�벿��
while( (dMax>thrE) && iter<=maxIter )%����6
    for i=1:H
        for j=1:W
            for k=1:cNum
                sSum=eps(0);%����sSum
                for ii=-sStep:sStep %sStep�Ǵ��ڰ뾶��ii��jj�ǶԾֲ��������
                    for jj=-sStep:sStep
                        x=i+ii;
                        y=j+jj;
                        dist=sqrt((x-i)^2+(y-j)^2);%�ֲ������У��㣨x,y���͵㣨i,j���ľ���
                        if(x >= 1 && x <= H && y >= 1 && y <= W && (ii ~= 0 || jj ~= 0))%��x,y�����ܳ����߽磬Ҳ�����루i,j���غ�
                            val=image(x,y);%i�������j��ĻҶ�ֵ����ʽ��17��
                            sSum=sSum+1.0/(1.0+dist)*(1-Uold(x,y,k).^m)*abs(val-center(k))^2;%���k���������ĵľ���
                        end
                    end
                end
                d1(k)=sSum;%d1Ϊ��ʽ��17���е�G_ki
                d2(k)=abs(image(i,j)-center(k))^2;
            end
            d1(d1==0)=eps(0);%�ӽ���0�ļ�Сֵ
            d2(d2==0)=eps(0);%�ӽ���0�ļ�Сֵ
            for k=1:cNum
                dd = d1(k)+d2(k);%ÿ��k���õ���
				sSum = eps(0);%ÿ�ζ�Ҫ��Ϊ0
                for ii=1:cNum
                    sSum =sSum+(dd/(d1(ii)+d2(ii)))^(1.0/(m-1.0)); %��ʽ(19),���Ӳ��䣬��ĸһֱ�ڱ�
                end
				U(i,j,k)= 1.0 / sSum;
            end
        end
    end
    cenOld=center;
    center=calcCenters( image, U, cNum, m);%���þ������Ⱦ��󣬼����ʼ��������
    dMax= max(abs(cenOld-center));
    Uold = U;    %���������Ⱦ���
    iter=iter+1; %��¼��������
end


%��������
end