clear all
close all
%Transfer functions:__________________________________%
Z1=[ 0.5 4*exp(1i*pi/8) 4*exp(-1i*pi/8)]';
Z2=[ 2 4*exp(1i*pi/8) 4*exp(-1i*pi/8)]';
Z3=[ 0.5 1/(4*exp(1i*pi/8)) 1/(4*exp(-1i*pi/8))]';
Z4=[ 2 1/(4*exp(1i*pi/8)) 1/(4*exp(-1i*pi/8))]';
P1=[0.3 0.95*exp(1i*pi/3) 0.95*exp(-1i*pi/3)]';
P2=P1;
P3=P1;
P4=P1;
K1=1/7.2;
K2=K1*(-0.5);
K3=16*K1;
K4=16*K1;
[a1,b1]=zp2tf(Z1,P1,K1);
[a2,b2]=zp2tf(Z2,P2,K2);
[a3,b3]=zp2tf(Z3,P3,K3);
[a4,b4]=zp2tf(Z4,P4,K4);
a=[a1 a2 a3 a4];
b=[b1 b2 b3 b4];
%______________________sec1___Z-Plane____________________________________%
figure(1)
suptitle('Zeros and Poles Map')
subplot(2,2,1)
zplane(Z1,P1)
title('Zeros and Poles of the transfer function H_1(z)')
grid;
subplot(2,2,2)
zplane(Z2,P2)
title('Zeros and Poles of the transfer function H_2(z)')
grid;
subplot(2,2,3)
zplane(Z3,P3)
title('Zeros and Poles of the transfer function H_3(z)')
grid;
subplot(2,2,4)
zplane(Z4,P4)
title('Zeros and Poles of the transfer function H_4(z)')
grid;
suptitle('Zeros and Poles Map')
%________sec2____________________________________________________________%
figure(2)
subplot(2,2,1)
hold on
[H1,omega1]=freqz(a1,b1);
plot(omega1,unwrap(angle(H1)));
[H2,omega2]=freqz(a2,b2);
plot(omega2,unwrap(angle(H2)));
[H3,omega3]=freqz(a3,b3);
plot(omega3,unwrap(angle(H3)));
[H4,omega4]=freqz(a4,b4);
plot(omega4,unwrap(angle(H4)));
grid on
title('Phase response')
ylabel('phase in rad')
xlabel('0<\omega in rad<\pi')
legend('\phi_1','\phi_2','\phi_3','\phi_4','Location','Southwest')
hold off
subplot(2,2,2)
hold on
[gd1,omega1]=grpdelay(a1,b1);
plot(omega1,gd1);
[gd2,omega2]=grpdelay(a2,b2);
plot(omega2,gd2);
[gd3,omega3]=grpdelay(a3,b3);
plot(omega3,gd3);
[gd4,omega4]=grpdelay(a4,b4);
plot(omega4,gd4);
grid on
hold off
title('Group delay')
ylabel('Group delay')
xlabel('0<\omega in rad<\pi')
legend({'\tau_g_1','\tau_g_2','\tau_g_3','\tau_g_4'},'Location','Northeast')
subplot(2,2,3)
hold on
[h1,t1]=impz(a1,b1)
plot(t1,h1)
[h2,t2]=impz(a2,b2)
plot(t2,h2)
[h3,t3]=impz(a3,b3)
plot(t3,h3)
[h4,t4]=impz(a4,b4)
plot(t4,h4)
grid on 
title('Impulse response')
ylabel('h[n]')
xlabel('n')
legend('h_1','h_2','h_3','h_4','Location','Northeast')
hold off
subplot(2,2,4)
hold on
m_vec = linspace(0, 50, 51);
Energy1 = zeros(51,1);
Energy2 = zeros(51,1);
Energy3 = zeros(51,1);
Energy4 = zeros(51,1);
for m = 0:50
 for n = 1:m
 Energy1(m) = Energy1(m)+(h1(n))^2;
 Energy2(m) = Energy2(m)+(h2(n))^2;
 Energy3(m) = Energy3(m)+(h3(n))^2;
 Energy4(m) = Energy4(m)+(h4(n))^2;
 end
end
plot(m_vec,Energy1);
plot(m_vec,Energy2);
plot(m_vec,Energy3);
plot(m_vec,Energy4);
title ('Energy');
xlabel('discrete time m')
ylabel('E_h [m]')
legend({'E_h_1','E_h_2','E_h_3','E_h_4'},'Location','southeast')
grid on
hold off
figure(3)
suptitle('Magnitude response')
subplot(2,2,1)
plot(abs(H1))
grid on
title('Magnitude response of h_1')
ylabel('|H_1|')
xlabel('0<\omega in rad <\pi')
subplot(2,2,2)
plot(abs(H2))
grid on
title('Magnitude response of h_2')
ylabel('|H_2|')
xlabel('0<\omega in rad <\pi')
subplot(2,2,3)
plot(abs(H3))
title('Magnitude response of h_3')
ylabel('|H_3|')
xlabel('0<\omega in rad <\pi')
grid on
subplot(2,2,4)
plot(abs(H4))
title('Magnitude response of h_4')
ylabel('|H_4|')
xlabel('0<\omega in rad <\pi')
grid on












