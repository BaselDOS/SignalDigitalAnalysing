clear all
close all
load 'ex1.mat'
figure(10)
title('The givven filters in time')
subplot(2,2,1)
plot(pidiv2filt(1,:));
grid on
xlabel('{h_1[n]}')
subplot(2,2,2)
plot(pidiv3filt(1,:));
grid on
xlabel('{h_2[n]}')
subplot(2,2,3)
plot(pidiv4filt(1,:));
grid on
xlabel('{h_3[n]}')
subplot(2,2,4)
plot(pidiv6filt(1,:));
grid on
xlabel('{h_4[n]}')
figure(2)
plot(signal(:,1))
grid on

