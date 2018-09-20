%分段线性变换的输入处理
function[A,map,x1,x2,y1,y2]=parse_inputs(varargin)
%parse_input 用来分析输入参数个数和有效性的函数
% A 输入图像 RGB图（3D）， 灰度图（2D），索引图（X）
% map 索引图调色板（:,3）
%[x1,x2] 参数组1，曲线中两个转折点的横坐标
%[y1,y2] 参数组2，曲线中两个转折点的纵坐标
map=[];
%IPTCHECKNARIGIN(LOW,HIGH,NUM)INPUTS,FUNC_NAME)
%检查输入参数的个数是否符合要求，即NUM_INPUTS中包含的输入变量是否在low和high中所指定的范围
%如果不在范围内，则给出一个格式化的错误信息
%iptchecknargin(3,4,nargin,mfilename);
%检查输入参数个数，方法二
narginchk(3,4);

%IPTCHECKINPUT(A,CLASS,ATTRIBUTES,FUNC_NAME,VAR_NAME,ARG_POS)
%validateattributes(A,CLASS,ATTRIBUTES,FUNC_NAME,VAR_NAME,ARG_POS)
%检查所给定矩阵A中的元素是否属于给定的类型列表。如果存在元素不属于给定类型，则给出一个格式化的错误信息
validateattributes(varargin{1},...
    {'uint8','uint16','int16','double'},...
    {'real'},mfilename,'I,X or RGB',1);
%根据参数个数的不同，分别确定不同的返回值
switch nargin
    case 3  %imgrayscaling(I,[x1,x2],[y1,y2])或imgrayscaling(RGB,[x1,x2],[y1,y2])
        A=varargin{1};
        x1=varargin{2}(1);
        x2=varargin{2}(2);
        y1=varargin{3}(1);
        y2=varargin{3}(2);
    case 4  %imgrayscaling(I,map,[x1,x2],[y1,y2])
        A=varargin{1};
        map=varargin{2};
        x1=varargin{3}(1);
        x2=varargin{3}(2);
        y1=varargin{4}(1);
        y2=varargin{4}(2);
end
%检测输入参数的有效性
%检查RGB数组
if (ndims(A)==3)&&(size(A,3)~=3)
    msg=sprintf('%s: 真彩色图像应当使用一个m-n-3维度的数组',upper(mfilename));
    eid=sprintf('Images:%s:true Color Rgb Image Must Be M by N by 3',mfilename);
    error(eid,'%s',msg);
end
%检查调色板
if ~isempty(map)
    if (size(map,2)~=3)||~ismatrix(map)
        msg1=sprintf('%s:输入的调色板应当是一共矩阵',upper(mfilename));
        msg2='并拥有三列';
        eid=sprintf('Images:%s:in Color map Must Be 2D elsewith 3colors',mfilename);
        error(eid,'%s %s',msg1,msg2);
    elseif (min(map(:))<0)||(max(map(:))>1)
        msg1=sprintf('%s:调色板中各个分量的强度',upper(mfilename));
        msg2='应当在0和1之间';
        eid=sprintf('Images:%s:colcor map Vals Must Be 1 to 2',mfilenae);
        error(eid,'%s.%s',msg1,msg2);
    end
end
%将int16类型的矩阵转换为uint16类型
if isa(A,'int16')
    A=int16touint16(A);
end
        

        