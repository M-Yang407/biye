function jiaocha( population_size,chromosome_size,cross_rate )
%�Ŵ��㷨�Ľ��沿��
global population;
for i=1:2:population_size
    %rand<������ʣ������������Ⱦɫ�崮���н������
    if rand<cross_rate               %�ڸ���С�ڽ�����ʱ������½��н���
        cross_poition=round(rand*chromosome_size);
        if (cross_poition==0 || cross_poition==1)
            continue;
        end
        %��cross_position��֮��Ķ����ƽ��н���
        for j=cross_poition:chromosome_size
            temp=population(i,j);
            population(i,j)=population(i+1,j);
            population(i+1,j)=temp;
        end
    end
end

clear i;
clear j;
clear temp;
clear cross_position;

