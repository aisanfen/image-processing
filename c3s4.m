I=imread('demo.jpg');
[M,N]=size(I);

figure(1);
subplot(1,3,1);
imshow(I);
title('Ô­Í¼Ïñ');
figure(2);
subplot(1,3,1);
[H,x]=imhist(I,64);
stem(x,H/M/N,'.');
title('Ô­Í¼Ïñ');

J1=imgrayscaling(I,[0.3 0.7],[0.15 0.85]);
figure(1);
subplot(1,3,2);
imshow(J1);
title('[0.3 0.7]')
figure(2);
subplot(1,3,2);
[H,X]=imhist(J1,64);
stem(X,H/M/N,'.');
title('[0.3 0.7]');

J2=imgrayscaling(I,[0.15 0.85],[0.3 0.7]);
figure(1);
subplot(1,3,3);
imshow(J2);
title('[0.7 0.3]')
figure(2);
subplot(1,3,3);
[H,X]=imhist(J2,64);
stem(X,H/M/N,'.');
title('[0.7 0.3]')