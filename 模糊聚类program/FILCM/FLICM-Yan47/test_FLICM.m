t1=clock;
%���ĵĲ���
imgFileName = 'E:\biye\DTIpicture\data\DTIpicture\26.jpg';%����ͼ��
cNum = 3;%������������
%�����ĵĲ���
m = 2;%ָ��m
winSize = 3;%�ֲ�����ֱ��
maxIter = 300;%����������
thrE = 0.00001;%������ֵ

% FLICM
[imOut,iter] = FLICM_clustering( imgFileName, cNum, m, winSize, maxIter, thrE );
disp(sprintf('Total Iterations = %d',iter));

% Show results
figure, imshow( imOut )
disp(['etime����������ʱ�䣺',num2str(etime(clock,t1))]);
