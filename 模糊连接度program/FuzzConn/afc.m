function FC=afc(S,K)
%function FC=afc(S,K)
%
%Absolute Fuzzy Connectedness (kFOEMS) according to Saha and Udupa 2001
%S is seed image (treated as boolean)
%K is symmetric matrix of size numel(S)*numel(S) 
%����ģ����ͨ��(kFOEMS)����Saha��Udupa 2001

%S������ͼ��(��Ϊ����ֵ����)

%KΪ��СΪnumel(S)*numel(S)�ĶԳƾ���
%Author: Joakim Lindblad

% Dijkstra version
%ʹ��Dijkstra�㷨���м���ģ�����ӶȾ���
%Pushing values instead of pulling, fits matlab better
FC=double(S>0); %init segm = seeds

Q=find(S); %push index to seeds on queue
  %size S
while ~isempty(Q)
	fc=max(FC(Q)); %pick strongest fc in Q
	idx=find(FC(Q)==fc); %find all of same fc
    pick=Q(idx); %index in image
	Q=remove(Q,idx); %remove from Q
	%propagate affinity one layer
	f=min(fc,max(K(:,pick),[],2)); %compute fc for adjacent pixels
   
	idx=find(f>FC(:)); %find those with real change
    FC(idx)=f(idx); %update FC
	Q=[Q;idx]; %push all updated spels
end
