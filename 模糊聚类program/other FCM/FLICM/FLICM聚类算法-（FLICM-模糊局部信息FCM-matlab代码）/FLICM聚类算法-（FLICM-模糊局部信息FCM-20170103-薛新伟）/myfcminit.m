function U=myfcminit(cluster_n,data_n)
%UΪ�����Ⱦ��󣬴�СΪ���������*����Ԫ�ظ���
%cluster_nΪ���������data_nΪ����Ԫ�صĸ���
U=rand(cluster_n,data_n);%������������Ⱦ���
col_sum=sum(U);          %����������ÿ��Ԫ�غ�
U=U./col_sum(ones(cluster_n,1),:);%��֤���ݵ㵽���������ĵ������Ⱥ�Ϊ1