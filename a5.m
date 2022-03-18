%三自由度机器人逆节求证问题
clear;clc;close all;
px=2;py=3;pz=5;
%建模
q1_lim=[-180,180];q1_lim=deg2rad(q1_lim);
q2_lim=[-57.6,180];q2_lim=deg2rad(q2_lim);
q3_lim=[-162,143];q3_lim=deg2rad(q3_lim);
theta1=0;theta2=0;theta3=0;
d=3;a1=5;a2=5;
%      关节变量   连杆偏距  连杆长度  连杆角度
L(1)=Link([theta1  d  0  pi/2]);  
L(2)=Link([theta2  0  a1  0]);    
L(3)=Link([theta3  0  a2  0]);   
robot=SerialLink(L,'name','threelink');
robot.teach();
% L(1).qlim=q1_lim;
% L(2).qlim=q2_lim;
% L(3).qlim=q3_lim;
%逆解
o11=atan2(py,px);
o12=atan2(-py,-px);

c3=(px^2+py^2+(pz-d)^2-a1^2-a2^2)/(2*a1*a2);
s3=sqrt(1-c3^2);
o31=atan2(s3,c3);
o32=atan2(-s3,c3);

H=px^2+py^2+pz^2+a1^2+d^2-a2^2-2*d*pz;
I=2*a1*(d-pz);
J=-2*a1*sqrt(px^2+py^2);
o21=2*atan((-I+sqrt(I^2+J^2-H^2))/(H-J));
o22=2*atan((-I-sqrt(I^2+J^2-H^2))/(H-J));

%多解验证
joint_angle=[rad2deg(o11) rad2deg(o21) rad2deg(o31);rad2deg(o12) rad2deg(o22) rad2deg(o32)];
j1=[o11,o21,o31];j2=[o11,o21,o32];j3=[o11,o22,o31];j4=[o11,o22,o32];
j5=[o12,o21,o31];j6=[o12,o21,o32];j7=[o12,o22,o31];j8=[o12,o22,o32];
t=j1;
px=cos(t(1))*(a2*cos(t(2)+t(3))+a1*cos(t(2)));
py=sin(t(1))*(a2*cos(t(2)+t(3))+a1*cos(t(2)));
pz=a2*sin(t(2)+t(3))+a1*sin(t(2))+d;
P=[px,py,pz];

%做出8组解的图
% A={j1,j2,j3,j4,j5,j6,j7,j8};
% for i=[1:8]
%     figure(i);
%     robot.teach(A{i});view(20,30); 
%     f=['kkk',num2str(i),'.jpg'];
%     saveas(gcf,f);
%     close all
% end
% figure(1)
% robot.teach(j2);
% figure(2)
% robot.teach(j3);

