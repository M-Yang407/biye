function [StruInfo]=GanChangFenbu1(maxX,maxY,IX,IM)

temp=zeros(maxX,maxY);
temp1=zeros(maxX,maxY);
temp2=zeros(maxX,maxY);
temp3=zeros(maxX,maxY);
temp4=zeros(maxX,maxY);

beita=1;
myu=zeros(maxX,maxY);
xigmaMyu=zeros(maxX,maxY);

for i=1:maxX
    for j=1:maxY
        %i==1,j==1Ϊͼ������Ͻǵĵ�һ�����ص�
        if and(i==1,j==1)
            %��3�ֲ�ͬ�����
            for m=1:4
                %deta����������������ȷ���1������ͬ�򷵻�0
                %IXΪ��ǰ�����mΪԤ�����
                temp(i,j)=temp(i,j)+deta(m,IX(i,j+1))-1;
                temp(i,j)=temp(i,j)+deta(m,IX(i+1,j))-1;
                temp(i,j)=temp(i,j)+deta(m,IX(i+1,j+1))-1;
                temp(i,j)=temp(i,j)+deta(m,IX(i,j))-1;
                %temp(i,j)=U(x)
                xigmaMyu(i,j)=exp(beita*temp(i,j))+xigmaMyu(i,j);
                %xigmaMyuΪZ
                if m==1
                    temp1(i,j)=temp(i,j);
                end
                if m==2
                    temp2(i,j)=temp(i,j);
                end
                if m==3
                    temp3(i,j)=temp(i,j);
                end
                if m==4
                    temp4(i,j)=temp(i,j);
                end
                temp(i,j)=0;
            end
        elseif and(i==1,j==maxY)
            for m=1:4
                temp(i,j)=temp(i,j)+deta(m,IX(i,j-1))-1;
                temp(i,j)=temp(i,j)+deta(m,IX(i+1,j-1))-1;
                temp(i,j)=temp(i,j)+deta(m,IX(i+1,j))-1;
                temp(i,j)=temp(i,j)+deta(m,IX(i,j))-1;
                xigmaMyu(i,j)=exp(beita*temp(i,j))+xigmaMyu(i,j);
                if m==1
                    temp1(i,j)=temp(i,j);
                end
                if m==2
                    temp2(i,j)=temp(i,j);
                end
                if m==3
                    temp3(i,j)=temp(i,j);
                end
                if m==4
                    temp4(i,j)=temp(i,j);
                end
                temp(i,j)=0;
            end
        elseif and(i==maxX,j==1)
            for m=1:4
                temp(i,j)=temp(i,j)+deta(m,IX(i,j+1))-1;
                temp(i,j)=temp(i,j)+deta(m,IX(i-1,j+1))-1;
                temp(i,j)=temp(i,j)+deta(m,IX(i-1,j))-1;
                temp(i,j)=temp(i,j)+deta(m,IX(i,j))-1;
                xigmaMyu(i,j)=exp(beita*temp(i,j))+xigmaMyu(i,j);
                if m==1
                    temp1(i,j)=temp(i,j);
                end
                if m==2
                    temp2(i,j)=temp(i,j);
                end
                if m==3
                    temp3(i,j)=temp(i,j);
                end
                if m==4
                    temp4(i,j)=temp(i,j);
                end
                temp(i,j)=0;
            end
        elseif and(i==maxX,j==maxY)
            for m=1:4
                temp(i,j)=temp(i,j)+deta(m,IX(i,j-1))-1;
                temp(i,j)=temp(i,j)+deta(m,IX(i-1,j-1))-1;
                temp(i,j)=temp(i,j)+deta(m,IX(i-1,j))-1;
                temp(i,j)=temp(i,j)+deta(m,IX(i,j))-1;
                xigmaMyu(i,j)=exp(beita*temp(i,j))+xigmaMyu(i,j);
                if m==1
                    temp1(i,j)=temp(i,j);
                end
                if m==2
                    temp2(i,j)=temp(i,j);
                end
                if m==3
                    temp3(i,j)=temp(i,j);
                end
                if m==4
                    temp4(i,j)=temp(i,j);
                end
                temp(i,j)=0;
            end
        elseif i==1
            for m=1:4
                temp(i,j)=temp(i,j)+deta(m,IX(i,j-1))-1;
                temp(i,j)=temp(i,j)+deta(m,IX(i+1,j-1))-1;
                temp(i,j)=temp(i,j)+deta(m,IX(i+1,j))-1;
                temp(i,j)=temp(i,j)+deta(m,IX(i+1,j+1))-1;
                temp(i,j)=temp(i,j)+deta(m,IX(i,j+1))-1;
                temp(i,j)=temp(i,j)+deta(m,IX(i,j))-1;
                xigmaMyu(i,j)=exp(beita*temp(i,j))+xigmaMyu(i,j);
                if m==1
                    temp1(i,j)=temp(i,j);
                end
                if m==2
                    temp2(i,j)=temp(i,j);
                end
                if m==3
                    temp3(i,j)=temp(i,j);
                end
                if m==4
                    temp4(i,j)=temp(i,j);
                end
                temp(i,j)=0;
            end
        elseif j==1
            for m=1:4
                temp(i,j)=temp(i,j)+deta(m,IX(i-1,j))-1;
                temp(i,j)=temp(i,j)+deta(m,IX(i-1,j+1))-1;
                temp(i,j)=temp(i,j)+deta(m,IX(i,j+1))-1;
                temp(i,j)=temp(i,j)+deta(m,IX(i+1,j+1))-1;
                temp(i,j)=temp(i,j)+deta(m,IX(i+1,j))-1;
                temp(i,j)=temp(i,j)+deta(m,IX(i,j))-1;
                xigmaMyu(i,j)=exp(beita*temp(i,j))+xigmaMyu(i,j);
                if m==1
                    temp1(i,j)=temp(i,j);
                end
                if m==2
                    temp2(i,j)=temp(i,j);
                end
                if m==3
                    temp3(i,j)=temp(i,j);
                end
                if m==4
                    temp4(i,j)=temp(i,j);
                end
                temp(i,j)=0;
            end
        elseif i==maxX
            for m=1:4
                temp(i,j)=temp(i,j)+deta(m,IX(i,j-1))-1;
                temp(i,j)=temp(i,j)+deta(m,IX(i-1,j-1))-1;
                temp(i,j)=temp(i,j)+deta(m,IX(i-1,j))-1;
                temp(i,j)=temp(i,j)+deta(m,IX(i-1,j+1))-1;
                temp(i,j)=temp(i,j)+deta(m,IX(i,j+1))-1;
                temp(i,j)=temp(i,j)+deta(m,IX(i,j))-1;
                xigmaMyu(i,j)=exp(beita*temp(i,j))+xigmaMyu(i,j);
                if m==1
                    temp1(i,j)=temp(i,j);
                end
                if m==2
                    temp2(i,j)=temp(i,j);
                end
                if m==3
                    temp3(i,j)=temp(i,j);
                end
                if m==4
                    temp4(i,j)=temp(i,j);
                end
                temp(i,j)=0;
            end
        elseif j==maxY
            for m=1:4
                temp(i,j)=temp(i,j)+deta(m,IX(i-1,j))-1;
                temp(i,j)=temp(i,j)+deta(m,IX(i-1,j-1))-1;
                temp(i,j)=temp(i,j)+deta(m,IX(i,j-1))-1;
                temp(i,j)=temp(i,j)+deta(m,IX(i+1,j-1))-1;
                temp(i,j)=temp(i,j)+deta(m,IX(i+1,j))-1;
                temp(i,j)=temp(i,j)+deta(m,IX(i,j))-1;
                xigmaMyu(i,j)=exp(beita*temp(i,j))+xigmaMyu(i,j);
                if m==1
                    temp1(i,j)=temp(i,j);
                end
                if m==2
                    temp2(i,j)=temp(i,j);
                end
                if m==3
                    temp3(i,j)=temp(i,j);
                end
                if m==4
                    temp4(i,j)=temp(i,j);
                end
                temp(i,j)=0;
            end
        else
            for m=1:4
                temp(i,j)=temp(i,j)+deta(m,IX(i-1,j-1))-1;      %2*u(x);u(x)=deta(xi-xj)-1,xiȡ����
                temp(i,j)=temp(i,j)+deta(m,IX(i-1,j))-1;
                temp(i,j)=temp(i,j)+deta(m,IX(i-1,j+1))-1;
                temp(i,j)=temp(i,j)+deta(m,IX(i,j-1))-1;
                temp(i,j)=temp(i,j)+deta(m,IX(i,j+1))-1;      %2*u(x);u(x)=deta(xi-xj)-1,xiȡ����
                temp(i,j)=temp(i,j)+deta(m,IX(i+1,j-1))-1;
                temp(i,j)=temp(i,j)+deta(m,IX(i+1,j))-1;
                temp(i,j)=temp(i,j)+deta(m,IX(i+1,j+1))-1;
                temp(i,j)=temp(i,j)+deta(m,IX(i,j))-1;
                xigmaMyu(i,j)=exp(beita*temp(i,j))+xigmaMyu(i,j);

                if m==1
                    temp1(i,j)=temp(i,j);
                end
                if m==2
                    temp2(i,j)=temp(i,j);
                end
                if m==3
                    temp3(i,j)=temp(i,j);
                end
                if m==4
                    temp4(i,j)=temp(i,j);
                end
                temp(i,j)=0;
            end
        end
    end
end

temp1=exp(beita*temp1);
temp1=temp1./xigmaMyu;
%temp1Ϊÿ�����ص��P(X=1)�ĸ���
temp2=exp(beita*temp2);
temp2=temp2./xigmaMyu;
%temp2Ϊÿ�����ص��P(X=2)�ĸ���
temp3=exp(beita*temp3);
temp3=temp3./xigmaMyu;
%temp3Ϊÿ�����ص��P(X=3)�ĸ���
temp4=exp(beita*temp4);
temp4=temp4./xigmaMyu;
%temp4Ϊÿ�����ص��P(X=4)�ĸ���
StruInfo=cat(3,temp1,temp2,temp3,temp4);
%cat(3,A,B)
%StruInfo(:,:,1)=temp1
%StruInfo(:,:,2)=temp2
%StruInfo(:,:,3)=temp3
%StruInfo(:,:,4)=temp4
