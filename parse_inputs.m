%�ֶ����Ա任�����봦��
function[A,map,x1,x2,y1,y2]=parse_inputs(varargin)
%parse_input �����������������������Ч�Եĺ���
% A ����ͼ�� RGBͼ��3D���� �Ҷ�ͼ��2D��������ͼ��X��
% map ����ͼ��ɫ�壨:,3��
%[x1,x2] ������1������������ת�۵�ĺ�����
%[y1,y2] ������2������������ת�۵��������
map=[];
%IPTCHECKNARIGIN(LOW,HIGH,NUM)INPUTS,FUNC_NAME)
%�����������ĸ����Ƿ����Ҫ�󣬼�NUM_INPUTS�а�������������Ƿ���low��high����ָ���ķ�Χ
%������ڷ�Χ�ڣ������һ����ʽ���Ĵ�����Ϣ
%iptchecknargin(3,4,nargin,mfilename);
%����������������������
narginchk(3,4);

%IPTCHECKINPUT(A,CLASS,ATTRIBUTES,FUNC_NAME,VAR_NAME,ARG_POS)
%validateattributes(A,CLASS,ATTRIBUTES,FUNC_NAME,VAR_NAME,ARG_POS)
%�������������A�е�Ԫ���Ƿ����ڸ����������б��������Ԫ�ز����ڸ������ͣ������һ����ʽ���Ĵ�����Ϣ
validateattributes(varargin{1},...
    {'uint8','uint16','int16','double'},...
    {'real'},mfilename,'I,X or RGB',1);
%���ݲ��������Ĳ�ͬ���ֱ�ȷ����ͬ�ķ���ֵ
switch nargin
    case 3  %imgrayscaling(I,[x1,x2],[y1,y2])��imgrayscaling(RGB,[x1,x2],[y1,y2])
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
%��������������Ч��
%���RGB����
if (ndims(A)==3)&&(size(A,3)~=3)
    msg=sprintf('%s: ���ɫͼ��Ӧ��ʹ��һ��m-n-3ά�ȵ�����',upper(mfilename));
    eid=sprintf('Images:%s:true Color Rgb Image Must Be M by N by 3',mfilename);
    error(eid,'%s',msg);
end
%����ɫ��
if ~isempty(map)
    if (size(map,2)~=3)||~ismatrix(map)
        msg1=sprintf('%s:����ĵ�ɫ��Ӧ����һ������',upper(mfilename));
        msg2='��ӵ������';
        eid=sprintf('Images:%s:in Color map Must Be 2D elsewith 3colors',mfilename);
        error(eid,'%s %s',msg1,msg2);
    elseif (min(map(:))<0)||(max(map(:))>1)
        msg1=sprintf('%s:��ɫ���и���������ǿ��',upper(mfilename));
        msg2='Ӧ����0��1֮��';
        eid=sprintf('Images:%s:colcor map Vals Must Be 1 to 2',mfilenae);
        error(eid,'%s.%s',msg1,msg2);
    end
end
%��int16���͵ľ���ת��Ϊuint16����
if isa(A,'int16')
    A=int16touint16(A);
end
        

        