function  xuanze(population_size,chromosome_size )
%   �˴���ʾ��ϸ˵��
global fitness_value;
global fitness_sum;
global fitness_average;
global best_fitness;
global best_generation;
global best_individual;
global population;
global G;

for i=1:population_size
    fitness_sum(i)=0;
end

min_index=1;
temp=1;
temp_chromosome(chromosome_size)=0;

%������Ⱥ
%ð������
%���population(i)����Ӧ����i������������population(population_size)���
for i=1:population_size-1
    min_index=i;
    for j=i+1:population_size
        if fitness_value(j) < fitness_value(min_index)
            min_index=j;
        end
    end
    
    if min_index~=i
        %����fitness_value(i)��fitness_value(min_index)
        temp=fitness_value(i);
        fitness_value(i)=fitness_value(min_index);
        fitness_value(min_index)=temp;
        %fitness_value(i)����Ӧ����[i,population_size]���
        %����population(i)��population(min_index)��Ⱦɫ�崮
        for k=1:chromosome_size
            temp_chromosome(k)=population(i,k);
            population(i,k)=population(min_index,k);
            population(min_index,k)=temp_chromosome(k);
        end
    end
end
%��ʱpopulation�ݼ�����
%fitness_sum(i)Ϊǰi���������Ӧ��֮��
for i=1:population_size
    if i==1
        fitness_sum(i) = fitness_sum(i) + fitness_value(i);
    else
        fitness_sum(i) = fitness_sum(i-1) + fitness_value(i);
    end
end

%fitness_average(G)=��G�ε��������ƽ������Ӧ��
fitness_average(G) = fitness_sum(population_size)/population_size;

%disp(fitness_value);
%��ʱfitness_value�����ݼ������fitness_value(population_size)Ϊ��Сֵ
%����������ÿ�ε�������Сֵ�ݹ��best_fitness
%���������Ӧ�ȺͶ�Ӧ�ĵ���������������Ѹ���
if -fitness_value(population_size) > best_fitness
    best_fitness=-fitness_value(population_size);
    best_generation=G;
    for j=1:chromosome_size
        best_individual(j)=population(population_size,j);
    end
  
end
%disp(best_fitness);
%disp(best_generation);
%disp(best_individual);
clear i;
clear j;
clear k;
clear min_index;
clear temp;


