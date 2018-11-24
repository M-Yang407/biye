function A=adjacency(I,n,k1)
%function A=adjacency(I,n,k1)
% Input: image (used for size only), n=L1 distance of neighbourhood, k1=distance decline factor
%nΪ����L1����ŷ�Ͼ��룬k1Ϊ����ݼ�����
% Compute adjacency according to (2.8) in Udupa '96
%�����ڽ�
%Author: Joakim Lindblad

[r,c]=size(I);
%NΪͼ�������е㵽���е���ڽ��Ⱥ���
N=r*c;

%abs delta of column and row coordinates
dC=abs(repmat([1:c],c,1)-repmat([1:c].',1,c));
%dCΪͼ����C�����ϵĲ�
dR=abs(repmat([1:r],r,1)-repmat([1:r].',1,r));
%dRΪͼ����R�����ϵĲ�
%AΪN*N��ϡ���������Ԫ��Ϊ0
A=sparse(N,N); %output matrix




for dc=0:n %for each L1 distance level
	[bi,bj]=find(dC == dc); %r*r blocks with dc<=n
	for dr=0:n-dc
        %dc��dr�ĺ����Ϊ1
        %��˵������֮��ľ���ʹ�õ���L1��max(dc+dr)<=n
		[i,j]=find(dR == dr); %pixels within block with dr+dc<=n

		%The adjaceny
		a=1./(1+k1.*sqrt(dr.^2+dc.^2)); 


		%compute global indices and put things into A
		p=[];q=[];
		for k=1:length(bi)
			p=[p;(bi(k)-1)*r+i];
			q=[q;(bj(k)-1)*r+j];
        end
        %��pΪx��qΪy��Ӧλ��Ϊrepmat(a,size(q)��ֵ�����γ�����СΪN*N��ϡ�����)
		A=A+sparse(p,q,repmat(a,size(q)),N,N);
	end
end
