img=imread('/Users/renminluqijiandian/Documents/SYSU/数学/数字图像处理/作业/第三周/exdata/lina.png');


img=double(img);
n=512;
w = randn(n, 1);
w = w/norm(w, 2);
Q = eye(n) - 2*w*w';
w = randn(n, 1);
w = w/norm(w, 2);
Q2 = eye(n) - 2*w*w';
w = randn(n, 1);
w = w/norm(w, 2);
Q3 = eye(n) - 2*w*w';
tic
imshow(uint8(img*Q*Q2*Q3))
toc


img=uint8(img);
Q=uint8(randi([1,255],n));
Q2=uint8(randi([1,255],n));
Q3=uint8(randi([1,255],n));
tic
imshow(bitxor(bitxor(bitxor(img,Q),Q2),Q3));
toc

subplot(2,3,1);
imshow(uint8(img))
title('原图')
subplot(2,3,2);
imshow(uint8(img*Q*Q2*Q3))
title('正交对称矩阵加密')
subplot(2,3,3);
imshow(uint8(img))
title('解密图像')
img=uint8(img);
Q=uint8(randi([1,255],n));
Q2=uint8(randi([1,255],n));
Q3=uint8(randi([1,255],n));
subplot(2,3,4);
imshow(img)
title('原图')
subplot(2,3,5);
imshow(bitxor(bitxor(bitxor(img,Q),Q2),Q3));
title('比特异或加密')
subplot(2,3,6);
imshow(img)
title('解密图像')




y=randperm(n*n);
tic
img2=reshape(img(y),n,n);
toc
imshow(uint8(img2))
subplot(1,3,1)
imshow(img)
title('原图')
subplot(1,3,2)
imshow(uint8(img2))
title('魔方加密')
subplot(1,3,3)
imshow(img)
title('解密后的图像')




%统计计算
syms x pai z x1 x2 beta1 beta2 y sigma1 sigma2
lnr1=beta1*x1+z
lnr2=beta2*x2+z
p1=exp(lnr1)/(1+exp(lnr1))
p2=exp(lnr2)/(1+exp(lnr2))
f1=p1^y*(1-p1)^(1-y)
f2=p2^y*(1-p2)^(1-y)

pz1=1/(sqrt(2*pi)*sigma1)*exp(-1/(2*sigma1^2)*z^2)
pz2=1/(sqrt(2*pi)*sigma2)*exp(-1/(2*sigma2^2)*z^2)
func=int(f1*pz1,z,-inf,inf)*pai+int(f2*pz2,z,-inf,inf)*(1-pai)

pretty(func)
func_sp=subs(func,{beta1,beta2,pai,sigma1,sigma2},{1,1,0.6,2,10})
func_sp2=subs(func_sp,{x1,x2},{1,1})
vpa((subs(func_sp2,y,1))+(subs(func_sp2,y,0)))







