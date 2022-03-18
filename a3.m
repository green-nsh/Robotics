%机械手臂可达空间 操作空间可视化
clear;clc;close all;
q1_lim=[-180,180];q1_lim=deg2rad(q1_lim);
q2_lim=[-57.6,180];q2_lim=deg2rad(q2_lim);
q3_lim=[-162,143];q3_lim=deg2rad(q3_lim);
theta1=0;theta2=0;theta3=0;
%      关节变量   连杆偏距  连杆长度  连杆角度
L(1)=Link([theta1  3  0  pi/2]); L(1).qlim=q1_lim;
L(2)=Link([theta2  0  5  0]);    L(2).qlim=q2_lim;
L(3)=Link([theta3  0  5  0]);    L(3).qlim=q3_lim;
robot=SerialLink(L,'name','threelink');
% robot.teach();

N=300;  %产生3000个随机关节变量值
theta1=q1_lim(1)+diff(q1_lim)*rand(N,1);
theta2=q2_lim(1)+diff(q2_lim)*rand(N,1);
theta3=q3_lim(1)+diff(q3_lim)*rand(N,1);
pos=cell(1,N);
for i=1:N
    pos{i}=robot.fkine([theta1(i),theta2(i),theta3(i)]);
end
figure
robot.plot([0 0 0]);
axis equal
hold on 
for i =1:N
    Pzb=transl(pos{i})';
    plot3(Pzb(1),Pzb(2),Pzb(3),'r>');
    hold on;
end
grid off;
view(20,30);
hold off;

%速度可操作性性椭球
q=[0, pi/3, pi/6];
J=robot.jacob0(q);
figure
plot_ellipse(J(1:3,:)*J(1:3,:)')
xlabel('x');ylabel('y');zlabel('z');
figure
plot_ellipse(J(4:6,:)*J(4:6,:)')
xlabel('x');ylabel('y');zlabel('z');
robot.maniplty(q);


