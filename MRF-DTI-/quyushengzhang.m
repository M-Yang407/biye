
A0=imread('date\32.jpg');%��ȡͼ��
seed=[1,2];%ѡ����ʼλ��
thresh=15;%������ѡ����ֵ
A=A0;%�ҶȻ�
A=imadjust(A,[min(min(double(A)))/255,max(max(double(A)))/255],[]);
A=double(A);%��ͼ��ҶȻ�
B=A;
[r,c]=size(B);%rΪ������cΪ��
n=r*c;%����ͼ�������ĸ���
pixel_seed=A(seed(1),seed(2));%ԭͼ��ʼ��Ҷ�ֵ
q=[seed(1),seed(2)];%q����װ����ʼλ��
top=1;%ѭ���ж�flag
M=zeros(r,c);%����һ����ԭͼ��Сһ���ľ���
M(seed(1),seed(2))=1;%����ʼ�㸳Ϊ1������Ϊ0
count=1;%������
 
while top~=0 %ѭ����������
    r1=q(1,1);%��ʼ����λ��
    c1=q(1,2);%��ʼ����λ��
    p=A(r1,c1);%��ʼ��Ҷ�ֵ
    dge=0;
    for i=-1:1%��Χ��ѭ���ж�
        for j=-1:1
            
            if r1+i<=r & r1+i>0 & c1+j<=c & c1+j>0%��֤�ڵ���Χ��Χ��
                if abs(A(r1+i,c1+j)-p)<=thresh & M(r1+i,c1+j)~=1
                    top=top+1;%�����ж�������top+1��topΪ���٣���q�������ж���
                    q(top,:)=[r1+i,c1+j];%�������ж���������Χ��λ�ø���q��q�����������ж���ÿһ���
                    M(r1+i,c1+j)=1;%�����ж�������M�����Ӧ�ĵ㸳1
                    count=count+1;%ͳ�����������ĵ��������ʵ��top��ʱ��ֵһ��
                    B(r1+i,c1+j)=1;%�����ж�������B�����Ӧ�㸳ֵ1
                end
                
                if M(r1+i,c1+j)==0;%���M�����Ӧ��ֵΪ0����dge��ֵΪ1��Ҳ����˵�⼸���㲻��������
                    dge=1;
                end
                
            else
                dge=1;%��ͼ���⽫dge��ֵΪ1
            end
        end
    end
    %��ʱ����Χ�����ж���ϣ��ڵ���ͼ����������ж�������dge��Ϊ1����������dgeΪ0
    if dge~=1
        B(r1,c1)=A(seed(1),seed(2));%��ԭͼ��ʼλ�ø���B
    end
    
    if count>=n%��������ж������ĵ�������ڵ���n
        top=1;
    end
    
    q=q(2:top,:);
    top=top-1;
end
subplot(121),imshow(A,[]);
subplot(122),imshow(B,[]);