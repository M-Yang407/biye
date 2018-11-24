function [U_new, center, obj_fcn] = stepfcm(data,data1,U,cluster_n,expro,alfa)
%ģ��C��ֵ����ʱ������һ��
%data             n��������ÿ��������mά����ֵ
%data1            nm���󣬱�ʾ��ֵ������ֵ����ֵΪfcm_s1,��ֵΪfcm_s2
%U                �����Ⱦ���
%cluster_n        ��ʾ�����
%expo             �����Ⱦ���U��ָ��
%alfa             punishment factor
%   �˴���ʾ��ϸ˵��
%U_new            �µ������Ⱦ���
%center           �µľ�������
%obj_fcn          Ŀ�꺯��ֵ
mf=U.^expro;       %�����Ⱦ������ָ��������
%�¾�������
center = mf*(data+alfa*data1)./((ones(size(data,2),1)*sum(mf'))'*(1+alfa));
%����������
dist = distfcm(center, data);
dist1 = distfcm(center, data1);
%����Ŀ��ֵ
obj_fcn = sum(sum((dist.^2).*mf))+alfa*sum(sum((dist1.^2).*mf)); %����Ŀ�꺯��ֵ
tmp = (dist.^2+alfa*dist1.^2).^(-1/(expro-1));
%�����µ������Ⱦ���
U_new = tmp./(ones(cluster_n,1)*sum(tmp));

end

