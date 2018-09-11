I=imread('desk.jpg');

%gamma=0.75
figure(1);
subplot(1,3,1);
imshow(imadjust(I,[],[],0.75));
title('Gamma 0.75');
figure(2);
subplot(1,3,1);
imhist(imadjust(I,[],[],0.75));
title('Gamma 0.75');

%gamma=1
figure(1);
subplot(1,3,2);
imshow(imadjust(I,[],[],1));
title('Gamma 1');
figure(2);
subplot(1,3,2);
imhist(imadjust(I,[],[],1));
title('Gamma 1');

%gamma=1.5
figure(1)
subplot(1,3,3);
imshow(imadjust(I,[],[],1.5));
title('Gamma 1.5');
figure(2)
subplot(1,3,3);
imhist(imadjust(I,[],[],1.5));
title('Gamma 1.5');

