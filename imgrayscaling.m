%�ֶ����Ա任����
function out=imgrayscaling(varargin)
% IMGRARYSCALING ִ�лҶ����칦��
% �﷨��
% out=imggraydcaling(I,[X1,X2],[Y1,Y2]);
% out=imggraydcaling(X,map,[X1,X2],[Y1,Y2]);
% out=imggraydcaling(RGB,[X1,X2],[Y1,Y2]);
[A,map,x1,x2,y1,y2]=parse_inputs(varargin{:});
%��������ͼ��A���������Ͷ�Ӧ��ȡֵ��Χ
range=getrangefromclass(A);
range=range(2);
%���벻�ǻҶ�ͼ�������ת��
if ndims(A)==3 % A����Ϊ3ά��RGBͼ��
    A=rgb2gray(A);
elseif ~isempty(map)
    A=ind2grary(A,map);
end

%����ԭʼͼ��Ĵ�С����ʼ��ͼ��
[M,N]=size(A);
I=im2double(A);
out=zeros(M,N);
%����
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
%������ͼ��ĸ�ʽת��Ϊ������ͼ����ͬ
if isa(A,'uint8')
    out=im2uint8(out);
elseif isa(A,'uint16')
    out=im2uint16(out);
end
%���
if nargout==0 %���û���ṩ�������ܷ���ֵ
    imshow(out);
    return;
end

