A=rand(300,300);
f=zeros(300,300);
u0=100;v0=100;
tic;% ��ʼ��ʱ
%һά����
for r=1:300
    u0x=u0*(r-1);
    for c=1:300
        v0y=v0*(c-1);
        f(r,c)=A(r,c)*cos(u0x+v0y);
    end
end
t1=toc
tic;
r=0:300-1;
c=0:300-1;
[C,R]=meshgrid(c,r);
%meshgrid��������������ĺ�����ʵ����������Ҫ��ά���ص��������ϱ�
g=A .*cos(u0 .* R + v0 .*C);
t2=toc