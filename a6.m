%3自由度机器人两解画圆；
clear;clc;
syms px py pz;
%轨迹
px=[18:-0.1:-18]';
py=sqrt(324-px.^2);
[r,c]=size(px);
pz=(15.*ones(c,r))';
P=[px,py,pz];
%建模
q1_lim=[-180,180];q1_lim=deg2rad(q1_lim);
q2_lim=[-57.6,180];q2_lim=deg2rad(q2_lim);
q3_lim=[-162,143];q3_lim=deg2rad(q3_lim);
theta1=0;theta2=0;theta3=0;
d=7.5;a1=15;a2=17;
%      关节变量   连杆偏距  连杆长度  连杆角度
L(1)=Link([theta1  d  0  pi/2]);  L(1).qlim=q1_lim;
L(2)=Link([theta2  0  a1  0]);    L(2).qlim=q2_lim;
L(3)=Link([theta3  0  a2  0]);    L(3).qlim=q3_lim;
robot=SerialLink(L,'name','threelink');
%中间量
H=px.^2+py.^2+pz.^2+a1^2+d^2-a2^2-2*d.*pz;
I=2*a1.*(d-pz);
J=-2*a1*sqrt(px.^2+py.^2);
c3=(px.^2+py.^2+(pz-d).^2-a1^2-a2^2)/(2*a1*a2);
s3=sqrt(1-c3.^2);
%第一组解
theta11=atan2(py,px);
theta21=2*atan((-I+sqrt(I.^2+J.^2-H.^2))./(H-J));
theta32=atan2(-s3,c3);
S1=[theta11,theta21,theta32];
%第二组解
theta22=2*atan((-I-sqrt(I.^2+J.^2-H.^2))./(H-J));
theta31=atan2(s3,c3);
S2=[theta11,theta22,theta31];
%画图
robot.teach(S1,'trail','r-');view(20,30);
