function [a, b, c] = nihe( x, y, k )

if nargin == 2%ֱ�����
    %ֱ�����
    %ԭʼ����          
    [m, n] = size(x);
    x2=sum(x.^2);       % ��(xi^2)
    x1=sum(x);          % ��(xi)
    x1y1=sum(x.*y');     % ��(xi*yi)
    y1=sum(y');          % ��(yi)
    a=(n*x1y1-x1*y1)/(n*x2-x1*x1);      %���ֱ��б��b=(y1-a*x1)/n
    b=(y1-a*x1)/n;                      %���ֱ�߽ؾ�
    c=0;
end
if nargin == 3%�������
[a,b,c] = polyfit(x, y',k);

end

