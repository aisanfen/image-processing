I=imread('demo.jpg');
I=im2double(I); %ת����������Ϊdouble
I=rgb2gray(I);
[M,N]=size(I);
figure(1); %���´���
imshow(I);
title('Sorece');

figure(2);
[H,x]=imhist(I,64); %����64��С����ĻҶ�ֱ��ͼ
stem(x,(H/M/N),'.'); %��ʾԭͼ���ֱ��ͼ
title('source');

%��ǿ�Աȶ�
Fa=2;Fb=-55;
O=Fa .* I+ Fb/255;

figure(3);
subplot(2,2,1);
imshow(O);
title('Fa=2 Fb=-55 ��ǿ�Աȶ�');

figure(4);
subplot(2,2,1);
[H,x]=imhist(O,64);
stem(x,(H/M/N),'.');
title('Fa=2 Fb=-55 ��ǿ�Աȶ�');

%��С�Աȶ�
Fa=0.5,Fb=-55;
O=Fa .* I + Fb/255;
figure(3);
subplot(2,2,2);
imshow(O);
title('Fa=0.5 Fb=-55 ��С�Աȶ�');

figure(4);
subplot(2,2,2);
[H,x]=imhist(O,64);
stem(x,(H/M/N),'.');
title('Fa=0.5 Fb=-55 ��С�Աȶ�');

%������������
Fa=1;Fb=55;
O=Fa .* I + Fb/255;

figure(3);
subplot(2,2,3);
imshow(O);
title('Fa=1 Fb=55 ����ƽ����������');

figure(4);
subplot(2,2,3);
[H,x]=imhist(O,64);
stem(x,(H/M/N),'.');
title('Fa=1 Fb=55 ����ƽ����������');

%���Լ�С����
Fa=1;Fb=-55;
O=Fa .* I + Fb/255;

figure(3);
subplot(2,2,4);
imshow(O);
title('Fa=1 Fb=55 ����ƽ�Ƽ�С����');

figure(4);
subplot(2,2,4);
[H,x]=imhist(O,64);
stem(x,(H/M/N),'.');
title('Fa=1 Fb=-55 ����ƽ�Ƽ�С����');

%������ʾ
Fa=-1;Fb=255;
O=Fa .* I + Fb/255;

figure(3);
subplot(2,2,4);
imshow(O);
title('Fa=-1 Fb=255 ������ʾ');

figure(4);
subplot(2,2,4);
[H,x]=imhist(O,64);
stem(x,(H/M/N),'.');
title('Fa=-1 Fb=255 ������ʾ');



