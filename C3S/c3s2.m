I=imread('demo.jpg');
F=fft2(im2double(I)); %����Ƶ��
F=abs(F); %�����ֵ
T=log(F+1); %�����任
subplot(1,2,1);
imshow(F,[]);
title('δ���仯��ͼ��');
subplot(1,2,2);
imshow(T,[]);
title('�任���ͼ��');