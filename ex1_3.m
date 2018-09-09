A=rand(300,300);
f=zeros(300,300);
u0=100;v0=100;
tic;% 开始计时
%一维方法
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
%meshgrid是生成网格坐标的函数，实际是生成需要二维像素点的坐标拟合表
g=A .*cos(u0 .* R + v0 .*C);
t2=toc