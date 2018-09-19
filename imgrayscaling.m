%分段线性变换函数
function out=imgrayscaling(varargin)
% IMGRARYSCALING 执行灰度拉伸功能
% 语法：
% out=imggraydcaling(I,[X1,X2],[Y1,Y2]);
% out=imggraydcaling(X,map,[X1,X2],[Y1,Y2]);
% out=imggraydcaling(RGB,[X1,X2],[Y1,Y2]);
[A,map,x1,x2,y1,y2]=parse_inputs(varargin{:});
%计算输入图像A中数据类型对应的取值范围
range=getrangefromclass(A);
range=range(2);
%输入不是灰度图像，则进行转换
if ndims(A)==3 % A矩阵为3维，RGB图像
    A=rgb2gray(A);
elseif ~isempty(map)
    A=ind2grary(A,map);
end

%读入原始图像的大小并初始化图像
[M,N]=size(A);
I=im2double(A);
out=zeros(M,N);
%主体
for i=1:M
    for j=1:N
        if I(i,j)<x1
            out(i,j)=y1*I(i,j) /x1;
        elseif I(i,j)>x2
            out (i,j)=(I(i,j)-x2)*(range-y2)/(range-x2)+y2;
        else
            out(i,j)=(I(i,j)-x1)*(y2-y1)/(x2-x1)+y1;
        end
    end
    
end
%将输入图像的格式转化为与输入图像相同
if isa(A,'uint8')
    out=im2uint8(out);
elseif isa(A,'uint16')
    out=im2uint16(out);
end
%输出
if nargout==0 %如果没有提供参数接受返回值
    imshow(out);
    return;
end

