function [ H,A1,C1,A2,C2 ] = yichuansuanfa( im )
%UNTITLED �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��


elitism=false;                 %��Ӣѡ��
population_size=100;           %��Ⱥ��С
ger=200;                       %��������
chromosome_size=32;            %Ⱦɫ�峤��(4��δ֪������8λ�����Ʊ�ʾ)
cross_rate=0.6;                %�������
mutate_rate=0.2;               %�������
%HΪ��Ŀ�꺯��
global G;                      %��ǰ��������
global population;             %��Ӧ������population_size,chromosome_size��
global fitness_value;          %��ǰ����Ӧ�Ⱦ��� (population_size,1)
global best_fitness;           %���������Ӧֵ   (1,chromosome_size)
global fitness_average;        %����ƽ����Ӧֵ���� 
global best_individual;        %������Ѹ���
global best_generation;        %��Ѹ�����ִ�
upper_bound=255;
lower_bound=0;

fitness_average=zeros(ger,1);            
fitness_value(population_size)=0;



figure(1);
title('ԭʼͼ��');
imshow(im);

best_fitness=0;
best_generation=0;

%���ɳ�ʼ�����Ⱥ
init_population(population_size,chromosome_size);
disp(sprintf('Number of generations:%d',ger));
disp(sprintf('Population size:%d',population_size));
disp(sprintf('Crossover probability:%.3f',cross_rate));
disp(sprintf('Mutation probability:%.3f',mutate_rate));

for G=1:ger
    disp(G);
    %����Ӧ�Ⱥ���
    roulette(im,population_size,chromosome_size);
    %����ѡ��
    xuanze(population_size,chromosome_size);
    %����ѡ��
    lunpan(population_size,chromosome_size,elitism);
    %���洦��
    jiaocha(population_size,chromosome_size,cross_rate);
    %����
    bianyi(population_size,chromosome_size,mutate_rate);

end



m=best_individual;%��Ѹ���
n=best_fitness;%�����Ӧ��
p=best_generation;%��Ѹ������ʱ�ĵ�������


%�����Ѹ������ֵ
A1=bin2dec(num2str(m(1:8)))';
C1=bin2dec(num2str(m(9:16)))';
A2=bin2dec(num2str(m(17:24)))';
C2=bin2dec(num2str(m(25:32)))';
    %{
    if m(j)==1
        if j<=8
            A1=A1+2^(j-1);
        elseif and(j<=16,j>8)
            C1=C1+2^(j-8-1);
        elseif and(j>16,j<=24)
            A2=A2+2^(j-16-1);
        else
            C2=C2+2^(j-24-1);
        end
    end
    %}
H=mohushang(im,A1,C1,A2,C2);        
end

