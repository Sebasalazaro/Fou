clc
clear all
close all

y=[27 20 16 12]';
x1=[5 4 3 1]';

A=[x1.^3 x1.^2 x1 ones(4,1)]

b=y;
a=inv(A)*b

xpol=1:0.01:5;
p=+a(1)*xpol.^3+a(2)*xpol.^2+a(3)*xpol+ a(4);

plot(x1,y,'r*',xpol,p,'b-')
hold on
grid on
