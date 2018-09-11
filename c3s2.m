I=imread('demo.jpg');
F=fft2(im2double(I)); %计算频谱
F=abs(F); %求绝对值
T=log(F+1); %对数变换
subplot(1,2,1);
imshow(F,[]);
title('未经变化的图像');
subplot(1,2,2);
imshow(T,[]);
title('变换后的图像');