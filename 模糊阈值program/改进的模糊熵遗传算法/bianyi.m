function  bianyi( population_size,chromosome_size,mutate_rate )
%UNTITLED8 �˴���ʾ�йش˺�����ժҪ
%�Ŵ��㷨�ı��첿��

global population;
%�ҵ���Ҫ�����Ⱥ��
for i=1:population_size
    by=find(rand(1,population_size)<mutate_rate);
end
%�������Ⱥ�����ҳ�3������λ��U<V<W,����U,V������W֮��λ��
for i=1:length(by)
        bw=sort(mod(floor(100*rand(1,3)),chromosome_size)+1);
        population(by(i),:)=population(by(i),[1:bw(1)-1,bw(2)+1:bw(3),bw(1):bw(2),bw(3)+1:chromosome_size]);
end

clear i;
clear mutate_position;

