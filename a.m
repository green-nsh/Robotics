clear;clc;
theta1=0;theta2=0;theta4=0;
%      关节变量   连杆偏距  连杆长度  连杆角度
a0=10;a1=10;a2=10;a3=10;a4=10;
L(1)=Link([theta1  0  0  -pi/2,0,0]); 
L(2)=Link([ 0  a0  0  0,0,-pi/2]);   
L(3)=Link([theta2  0  a2  0]);   
L(4)=Link([pi/2    a3  0  pi/2]);   
L(5)=Link([theta4  0  0  0]);   
L(6)=Link([pi/2  0  a4  0]);   
robot=SerialLink(L,'name','robot');
robot.teach();