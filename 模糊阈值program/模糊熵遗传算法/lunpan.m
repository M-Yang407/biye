function lunpan( population_size,chromosome_size,elitism )
%UNTITLED5 �˴���ʾ�йش˺�����ժҪ
%�Ŵ��㷨�е����̶�ѡ��
global population; %ǰ����Ⱥ
global population_new; %��һ����Ⱥ
global fitness_sum;%��Ⱥ������Ӧ��
for i=1:population_size
    %fitness_sum(population_size)����ֵ����Ӧ�����
    r=rand*fitness_sum(population_size);   %����һ�������
    first=1;
    last=population_size;
    mid=round((last+first)/2);
    idx=-1;
    
    %����ѡ�����
    while (first<=last)&&(idx==-1)
        if r>fitness_sum(mid)
            first=mid;
        elseif r<fitness_sum(mid)
            last=mid;
        else
            idx=mid;
            break;
        end
        mid=round((last+first)/2);
        if (last-first)==1
            idx=last;
            break;
        end
    end
    %������һ������
    for j=1:chromosome_size
        population_new(i,j)=population(idx,j);
    end
end
%�ж��Ƿ�Ӣѡ��
if elitism
    p=population_size-1;
else
    p=population_size;
end

for i=1:p
    for j=1:chromosome_size
        %�����Ӣѡ�񣬽�population��ǰpopulation_size-1��������£����һ�����Ÿ��屣��
        population(i,j)=population_new(i,j);
    end
   
end
clear i;
clear j;
clear population_new;
clear first;
clear last;
clear idx;
clear mid;



