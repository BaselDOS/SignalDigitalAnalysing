clear all
close all
load 'ex1.mat'
t=linspace(0,1,1000);
x=(1.5*cos(2*pi*40*t)+sin(2*pi*120*t)).*exp(-100*((t-0.5).^2));
n=linspace(0,1000,1000);
Xjw=fft(x);
fn=1e3;
Ts=1/fn;
x_n=(1.5*cos(2*pi*40*n*Ts)+sin(2*pi*120*n*Ts)).*exp(-100*((n*Ts-0.5).^2));
X_n=fftshift(fft(x_n));
N=length(x_n);
w=[-N/2:N/2-1]*2*pi/N;
%______________________________________________________________%
x_nd3=x_n(1:3:end);
x_nd3jw=fftshift(fft(x_nd3));
N3=length(x_nd3jw);
w3=[-N3/2:N3/2-1]*2*pi/N3;
%______________________________________________________________%
x_n3du=upsample(x_nd3,3);
xi1=conv(x_n3du,3*pidiv4filt,'same');
N4=length(xi1);
w4=[-N4/2:N4/2-1]*2*pi/N4;
%___________Plots_sec1_______________________________________________________________%

figure(1)
plot(w,abs(X_n));
grid on
set(gca,'XTick',-pi:pi/4:pi,'XTickLabel',{'-\pi','-3\pi/4','-\pi/2','-\pi/4','0','\pi/4','\pi/2','3\pi/4','\pi/'});
xlim([-pi pi])
title('DTFT of x[n]');
xlabel('\omega [rad]');
ylabel('|X(e^{j\omega} )|');
%____________________Plots sec2_______________________________________________________________________%

figure(2)
plot(w3,abs(x_nd3jw))
grid on
set(gca,'XTick',-pi:pi/4:pi,'XTickLabel',{'-\pi','-3\pi/4','-\pi/2','-\pi/4','0','\pi/4','\pi/2','3\pi/4','\pi'})
xlim([-pi pi])
title('DTFT of x[3n]: x[n] \rightarrow | \downarrow 3| \rightarrow| x[3n]')
xlabel(' \omega [rad]')
ylabel('|X_{\downarrow 3} (e^{j\omega})|')
figure(3)
plot(w4,abs(fftshift(fft(xi1))));
grid on
set(gca,'XTick',-pi:pi/4:pi,'XTickLabel',{'-\pi','-3\pi/4','-\pi/2','-\pi/4','0','\pi/4','\pi/2','3\pi/4','\pi'})
xlim([-pi pi])
title('DTFT of xi[3n]: x[n] \rightarrow |\downarrow 3| \rightarrow |\uparrow 3| \rightarrow H_{int} \rightarrow xi[3n]')
xlabel('\omega [rad]')
ylabel('|Xi_3(e^{j\omega})|')
figure(4)
ni=0:N4-1;
plot(n,x_n)
hold on
plot(ni,xi1)
legend('x[n]','xi_3[n]')
axis([ 0 1000 -2.5 2.5])
grid on
hold off
title('Time Doman')
xlabel('n')
%_________________________________________________________%
%________________down and up by 6_____________________________________________%
x_nd6=x_n(1:6:end);
x_nd6jw=fftshift(fft(x_nd6));
N6=length(x_nd6jw);
w6=[-N6/2:N6/2-1]*2*pi/N6;
%______________________________________________________________%
x_n6du=upsample(x_nd6,6);
xi2=conv(x_n6du,6*pidiv6filt,'same');
N7=length(xi2);
w7=[-N7/2:N7/2-1]*2*pi/N7;
%___________Plots_sec1_______________________________________________________________%
figure(6)
plot(w6,abs(x_nd6jw))
grid on
set(gca,'XTick',-pi:pi/4:pi,'XTickLabel',{'-\pi','-3\pi/4','-\pi/2','-\pi/4','0','\pi/4','\pi/2','3\pi/4','\pi'})
xlim([-pi pi])
title('DTFT of x[6n]: x[n] \rightarrow | \downarrow 6| \rightarrow| x[6n]')
xlabel(' \omega [rad]')
ylabel('|X_{\downarrow 6} (e^{j\omega})|')
figure(7)
plot(w7,abs(fftshift(fft(xi2))));
grid on
set(gca,'XTick',-pi:pi/4:pi,'XTickLabel',{'-\pi','-3\pi/4','-\pi/2','-\pi/4','0','\pi/4','\pi/2','3\pi/4','\pi'})
xlim([-pi pi])
title('DTFT of xi[3n]: x[n] \rightarrow |\downarrow 6| \rightarrow |\uparrow 6| \rightarrow H_{int} \rightarrow xi[3n]')
xlabel('\omega [rad]')
ylabel('|Xi_6(e^{j\omega})|')
figure(8)
ni2=0:N7-1;
plot(n,x_n)
hold on
plot(ni2,xi2)
legend('x[n]','xi_6[n]')
axis([ 0 1000 -2.5 2.5])
grid on
hold off
title('Time Doman')
xlabel('n')




