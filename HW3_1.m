clc;clear;
%�������ֵ�1�⣬�����ٶȷ�����
I=21714*10^4;%mm^4
E=210000;%MPa
m1=6;%N/mm*sec^2, 1kg=1 N/m*sec^2=10^(-3) N/mm*sec^2
h=3000;%mm
k=8*E*I/h^3*[5 -2 0;-2 3 -1;0 -1 1];%N/mm
m=m1*[1 0 0;0 1 0;0 0 1/2];
% ���;���
A=[1 1 1;2.1861 1 -0.6861;3.1861 -2 0.3139];
% ����Ƶ��
wn=[37.61;81.09;119.8];
M=A'*m*A;
K=A'*k*A;
p=[10*10^3;15*10^3;20*10^3];
P=A'*p;
i=0:0.01:3;
% ��һ���ͷ������
p1=P(1,1)*sin(2*pi*i);
K1=K(1,1);
M1=M(1,1);
[y11,v11,a11]=NewmarkMethod(1/2,1/4,p1,3,K1,M1,0,0.01);
% �ڶ����ͷ������
p2=P(2,1)*sin(2*pi*i);
K2=K(2,2);
M2=M(2,2);
[y12,v12,a12]=NewmarkMethod(1/2,1/4,p2,3,K2,M2,0,0.01);
% �������ͷ������
p3=P(3,1)*sin(2*pi*i);
K3=K(3,3);
M3=M(3,3);
[y13,v13,a13]=NewmarkMethod(1/2,1/4,p3,3,K3,M3,0,0.01);
    
% ���;���
A=[1 1 1;2.1861 1 -0.6861;3.1861 -2 0.3139];

u11=A(1,1)*y11;%��һ����
u12=A(2,1)*y12;%�ڶ�����
u13=A(3,1)*y13;%��������
u1=u11+u12+u13;%��һ���������ܷ�Ӧ

plot(i,u1)
xlabel('ʱ�䣨s)');
ylabel('���ƣ�mm��');
title('�ײ�����������');
%����Ϊ�����ٷ�
%%
%�������ֵ�1�⣬wilson-theta������
I=21714*10^4;%mm^4
E=210000;%MPa
m1=6;%N/mm*sec^2, 1kg=1 N/m*sec^2=10^(-3) N/mm*sec^2
h=3000;%mm
k=8*E*I/h^3*[5 -2 0;-2 3 -1;0 -1 1];%N/mm
m=m1*[1 0 0;0 1 0;0 0 1/2];
% ���;���
A=[1 1 1;2.1861 1 -0.6861;3.1861 -2 0.3139];
% ����Ƶ��
wn=[37.61;81.09;119.8];
M=A'*m*A;
K=A'*k*A;
p=[10*10^3;15*10^3;20*10^3];
P=A'*p;
i=0:0.01:3;
% ��һ���ͷ������
p1=P(1,1)*sin(2*pi*i);
K1=K(1,1);
M1=M(1,1);
[y11,v11,a11]=WilsonTheta(p1,3,K1,M1,0,0.01);
% �ڶ����ͷ������
p2=P(2,1)*sin(2*pi*i);
K2=K(2,2);
M2=M(2,2);
[y12,v12,a12]=WilsonTheta(p2,3,K2,M2,0,0.01);
% �������ͷ������
p3=P(3,1)*sin(2*pi*i);
K3=K(3,3);
M3=M(3,3);
[y13,v13,a13]=WilsonTheta(p2,3,K3,M3,0,0.01);
    
% ���;���
A=[1 1 1;2.1861 1 -0.6861;3.1861 -2 0.3139];

u11=A(1,1)*y11;%��һ����
u12=A(2,1)*y12;%�ڶ�����
u13=A(3,1)*y13;%��������
u1=u11+u12+u13;%��һ���������ܷ�Ӧ

hold on;
plot(i,u1,'r')

%����ΪWilson-theta��
%%
% clc;clear;
%�������ֵ�1�⣬���۽ⲿ��
I=21714*10^4;%mm^4
E=210000;%MPa
m1=6;%N/mm*sec^2, 1kg=1 N/m*sec^2=10^(-3) N/mm*sec^2
h=3000;%mm
k=8*E*I/h^3*[5 -2 0;-2 3 -1;0 -1 1];%N/mm
m=m1*[1 0 0;0 1 0;0 0 1/2];
% ���;���
A=[1 1 1;2.1861 1 -0.6861;3.1861 -2 0.3139];
% ����Ƶ��
wn=[37.61;81.09;119.8];
M=A'*m*A;
K=A'*k*A;
p=[10;15;20];
P=A'*p;

% ���Ƶ�� w=2*pi/wn
w_c=2*pi./wn;
% �Ŵ�ϵ��
D=1./(1-w_c.^2);

% ��ͼ:��һ������
t=0:0.01:3;
% ��������
y1=-0.2*sin(37.61*t)+1.19*sin(2*pi*t);
y2=-0.072*sin(81.09*t)-0.093*sin(2*pi*t);
y3=0.0024*sin(119.8*t)+0.0458*sin(2*pi*t);
% ���;���
A=[1 1 1;2.1861 1 -0.6861;3.1861 -2 0.3139];
v11=A(1,1)*y1;%��һ����
v12=A(2,1)*y2;%�ڶ�����
v13=A(3,1)*y3;%��������
v1=v11+v12+v13;%��һ���������ܷ�Ӧ


hold on;
plot(t,v1,'g')