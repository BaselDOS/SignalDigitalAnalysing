load('ex1')
t=linspace(0,1,1000);
f=1e3;
x=(1.5*cos(2*pi*40*t)+sin(2*pi*20*t)).*exp(-100*((t-0.5).^2));
Ts=1./f;
n=1:1:1000;
%figure(4)
%sample=stem(n,x);
x_s=(1.5*cos(2*pi*40*n.*Ts)+sin(2*pi*20*n.*Ts)).*exp(-100*((n.*Ts-0.5).^2));
x_s3=x_s(1:3:1000);
x_s33=upsample(x_s3,3);
x_s333=conv(x_s33,pidiv3filt);
x_s32=conv(x_s33,pidiv2filt);
x_s34=conv(x_s33,pidiv4filt);
x_s36=conv(x_s33,pidiv6filt);


x_s6=x_s(1:3:1000);
x_s66=upsample(x_s3,3);
x_s666=conv(x_s66,pidiv3filt);
x_s62=conv(x_s66,pidiv2filt);
x_s64=conv(x_s66,pidiv4filt);
x_s66=conv(x_s66,pidiv6filt);


figure(3)
plot(t,x)
title('X signal')
xlabel('Time')
grid on 

figure(8)
plot(x_s)
grid on 
title('The sampled siganl X1')

X=fft(x);
X_s=fft(x_s);
fftshift(X);
fftshift(X_s);

figure(9)
plot(abs(X_s))
grid on
title('abs of FFT of X1')
xlabel('n')



figure(10)
plot(abs(x_s3))
title('The sampled signal X1 after downsampling by 3')
xlabel('n')
grid on 

figure(11)
subplot(2,2,1)
plot(t,x,t,x_s333(1,1:1000))
grid on 
legend('Xc','X after interpulation with filter 3')
subplot(2,2,2)
plot(t,x,t,x_s32(1,1:1000))
grid on 
legend('Xc','X after interpulation with filter 2')
subplot(2,2,3)
plot(t,x,t,x_s34(1,1:1000))
grid on 
legend('Xc','X after interpulation with filter 4')
subplot(2,2,4)
plot(t,x,t,x_s36(1,1:1000))
grid on 
legend('Xc','X after interpulation with filter 6')
figure(12)
plot(abs(x_s333))
grid on
title('The absolut value of FFT of interpulation result')
xlabel(' Frequency')
figure(13)
subplot(2,2,1)
plot((x_s333))
grid on
subplot(2,2,2)
plot((conv(x_s33,pidiv6filt)))
grid on
subplot(2,2,3)
plot((conv(x_s33,pidiv2filt)))
grid on
subplot(2,2,4)
plot((conv(x_s33,pidiv4filt)))
grid on

figure(14)
subplot(2,2,1)
plot(t,x,t,x_s666(1,1:1000))
grid on 
legend('Xc','X after interpulation with filter 3')
subplot(2,2,2)
plot(t,x,t,x_s62(1,1:1000))
grid on 
legend('Xc','X after interpulation with filter 2')
subplot(2,2,3)
plot(t,x,t,x_s64(1,1:1000))
grid on 
legend('Xc','X after interpulation with filter 4')
subplot(2,2,4)
plot(t,x,t,x_s66(1,1:1000))
grid on 
legend('Xc','X after interpulation with filter 6')



