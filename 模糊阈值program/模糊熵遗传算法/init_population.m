function init_population( population_size,chromosome_size )
%��ʼ��Ⱦɫ����Ⱥ ��32Ϊ2����
global population
population=zeros(population_size,chromosome_size);
for i=1:population_size
    for j=1:chromosome_size
        population(i,j)=round(rand);%���������ݳ�ʼ��Ϊ0��1 �������Ʊ�ʾ�������ݣ� 4������ÿ��8λ
    end
end
clear i;
clear j;

