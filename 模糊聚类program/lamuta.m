function [x,namuta_] = lamuta(y)
%UNTITLED2 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
    [v,d]=eig(y);
    namuta1=d(1,1);
    namuta2=d(2,2);
    namuta3=d(3,3);
    namuta_=(namuta1+namuta2+namuta3)/3;
    cha_namuta=((namuta1-namuta_)^2+(namuta2-namuta_)^2+(namuta3-namuta_)^2)*3;
    he_namuta=2*(namuta1^2+namuta2^2+namuta3^3);
    x=(cha_namuta/he_namuta)^0.5;  
end

