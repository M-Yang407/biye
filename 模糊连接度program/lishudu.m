function [lishu] = lishudu(img)
[row, col] = size(img);
k  =0.1;
n = 1;
lishu = zeros(row*col, row*col);
disp(size(lishu));


lishu = sparse(row*col, row*col);
drow = abs(repmat([1:row], row, 1) - repmat([1:row]', 1, row));
dcol = abs(repmat([1:col], col, 1) - repmat([1:col]', 1, col));

for dr = 0:n
    %�в�
    [dri, drj] = find(drow == dr);
    disp(size(dri));
    disp(size(drj))
    for dc = 0:n-dr  %���в���в�֮��С�ڵ���n
        %�����������������������м�¼��(dri,dci),(drj,dcj)
        %�в�
        [dci, dcj] = find(dcol == dc);
        disp(size(dci));
        disp(size(dcj));
        %������ֵ
        a = 1/(1+k*sqrt(dr^2+dc^2));
        p = [];q=[];
        for i =1:length(dri)
             p = [p;(dri(i)-1)*col+dci];%���������������ص�������зŽ�row*col,row*col��С�ľ����У�pΪ��һ����qΪ�ڶ���
             q = [q;(drj(i)-1)*row+dcj];
        end
        lishu = lishu + sparse(p,q,repmat(a,size(q)),N,N);
    end
end


end