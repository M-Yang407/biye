function segma2 = estimateSegma(data)
%segma2       ���ص�Ϊ����
mean_data=mean(data);
segma2=(data-mean_data)'*(data-mean_data)/size(data,1);