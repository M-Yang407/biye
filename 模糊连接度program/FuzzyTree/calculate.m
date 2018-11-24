function [ ChildCoor,Conn ] = calculate( Image,Coor,I )
%�����������ĵ�����������������ģ�����Ӷ�
%I=3�����ڵ�
%I=4�����ڵ�
%I=5�����ڵ�
%I=6�����ڵ�
%���ظ��ڵ��������Ӧ���Ӷ�
FatherCoor=Coor;
ChildCoor=Coor;
if(I==3)
    ChildCoor=[ChildCoor(1)-1,ChildCoor(2)];
else if(I==4)
        ChildCoor=[ChildCoor(1)+1,ChildCoor(2)];
    else if(I==5)
            ChildCoor=[ChildCoor(1),ChildCoor(2)-1];
        else if(I==6)
                ChildCoor=[ChildCoor(1),ChildCoor(2)+1];
            end
        end
    end
end
if(ChildCoor(1)>0&ChildCoor(1)<=size(Image,1)&ChildCoor(2)>0&ChildCoor(2)<=size(Image,2))
    Pixel1=Image(FatherCoor(1),FatherCoor(2),2);
    Pixel2=Image(ChildCoor(1),ChildCoor(2),2);
    m1=1;
    s1=1;
    m2=1;
    s2=1;
    NewConn=min(Image(FatherCoor(1),FatherCoor(2),1),1/(1+abs(Image(FatherCoor(1),FatherCoor(2),2)-Image(ChildCoor(1),ChildCoor(2),2))));
    %NewConn=exp(-(1/2)*(((1/2)*(Pixel1+Pixel2)-m1)/s1)^2);
    % NewConn=exp(-(1/2)*((abs(Pixel1-Pixel2)-m2)/s2)^2);
    % NewConn=1-exp(-(1/2)*(((1/2)*(Pixel1+Pixel2)-m1)/s1)^2);
    % NewConn=1-exp(-(1/2)*((abs(Pixel1-Pixel2)-m2)/s2)^2);
    Conn=min(Image(FatherCoor(1),FatherCoor(2),1),NewConn);
else
    ChildCoor=Coor;
    Conn=-1;
end
    