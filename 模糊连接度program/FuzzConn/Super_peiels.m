function Super_peiels( I )
%���ó������Զ��ָ��Ŀ����ߵ�Ŀ�����ٵķ���

%��ͼ�񻮷�Ϊn�����򣬴���ͼ��ӵ��n��������
[row, col] = size(I);
n = 20;
%�����ر߳�
S_super_peiels = sqrt(row*col/n);
%����ͼ���ݶ����������ٱ�Ե�������������϶�ȶԾ���ĸ���
for r = 2:row-1
    for c = 2:col-1
        tidu_x = I(r+1,c+1)+ 2*I(r,c+1)+ I(r-1,c+1) - I(r-1,c-1)-2*I(r, c-1) - I(r+1,c-1);
        tidu_y = I(r-1,c-1)+2*I(r-1,c)+I(r-1,c+1) - I(r+1,c-1)-2*I(r+1,c)-I(r+1,c+1);
        tidu((r-1)*col + c) = sqrt(tidu_x^2 + tidu_y^2);
    end
end
%��ͼ�����ݶ�������С�������ҳ���ȷ��Ϊ��ʼ�ĳ����ؾ������ĵ�
%��ʼ������������(x_,y_)
[min_tidu,index] = min(tidu);
x_ = ceil(index/col);
y_ = index - (x_-1)*col;

end

