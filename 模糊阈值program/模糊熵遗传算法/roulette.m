function roulette( im,population_size,chromosome_size )
%UNTITLED4 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
global fitness_value;       %��Ӧ�Ⱦ���(population_size,1)
global population;          %Ⱦɫ�����(population_size,chromosome_size)
global A1;                  %A1,A2,C1,C2ΪȾɫ������Ӧ��ֵ�����������Ӧֵ��Ŀ�꺯����
global A2;                  
global C1;
global C2;
%���������Ӧ��
upper_bound=255;  %�Ա�������������
lower_bound=0;    %�Ա�������������
%������Ⱥ������Ӧ�ȳ�ʼ��Ϊ0
for i=1:population_size
    fitness_value(i)=0;
    A1(i)=0;
    C1(i)=0;
    A2(i)=0;
    C2(i)=0;
end

for i=1:population_size
    for j=1:chromosome_size
        A1(i)=bin2dec(num2str(population(i,1:8)))';
        A2(i)=bin2dec(num2str(population(i,9:16)))';
        C1(i)=bin2dec(num2str(population(i,17:24)))';
        C2(i)=bin2dec(num2str(population(i,25:32)))';
    end
    A1(i)=C1(i)*(A1(i)/255);
    A2(i)=C1(i)+(255-C1(i)*A2(i)/255);
    C2(i)=A2(i)+(255-A2(i)*C2(i)/255);
    
    %fitness_value(i)=lower_bound+fitness_value(i)*(upper_bound-lower_bound)/(2^8-1);
    %A1(i)=lower_bound+A1(i)*(upper_bound-lower_bound)/(2^8-1);
    %C1(i)=lower_bound+C1(i)*(upper_bound-lower_bound)/(2^8-1);
    %A2(i)=lower_bound+A2(i)*(upper_bound-lower_bound)/(2^8-1);
    %C2(i)=lower_bound+C2(i)*(upper_bound-lower_bound)/(2^8-1);
    fitness_value(i)=-mohushang(im,A1(i),C1(i),A2(i),C2(i));
end


clear i;
clear j;
