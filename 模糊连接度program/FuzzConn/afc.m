function FC=afc(S,K)
%function FC=afc(S,K)
%S(128,128)
%K(128*128,128*128)ÿ�����ص������������ص���׺Ͷ�
%Absolute Fuzzy Conn����ectedness (kFOEMS) according to Saha and Udupa 2001
%S is seed image (treated as boolean)
%K is symmetric matrix of size numel(S)*numel(S) 
%����ģ����ͨ��(kFOEMS)����Saha��Udupa 2001

%S������ͼ��(��Ϊ����ֵ����)

%KΪ��СΪnumel(S)*numel(S)�ĶԳƾ���-
%Author: Joakim Lindblad

% Dijkstra version
%ʹ��Dijkstra�㷨���м���ģ�����ӶȾ���
%Pushing values instead of pulling, fits matlab better
FC=double(S>0); %init segm = seeds
%FC�����ӵ���Ϊ1����������ӵ�Ϊ0
Q=find(S); %push index to seeds on queue
%�����ӵ��Q��
  %size S
%S(128,128);K(128*128,128*128)
%FC(128,128)
c=0;
while ~isempty(Q)
	fc=max(FC(Q)); %pick strongest fc in Q       %fcΪ����ģ�����Ӷ��������ؼ���
    
    idx=find(FC(Q)==fc); %find all of same fc    %ȷ��������FC�е�λ��
    pick=Q(idx); %index in image                 %��Q�ж�Ӧ������ѡ����
    Q=remove(Q,idx); %remove from Q
	%propagate affinity one layer
	f=min(fc,max(K(:,pick),[],2)); %compute fc for adjacent pixels
    
    %�ҳ�����fc�������ص�����������·��
	idx=find(f>FC(:)); %find those with real change
    disp(length(idx));
    c=c+length(idx);
    FC(idx)=f(idx); %update FC
	Q=[Q;idx]; %push all updated spels
end
disp(c);