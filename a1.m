%三自由度机器人建模
%      关节变量   连杆偏距  连杆长度  连杆角度
L(1)=Link([0  8  0  pi/2]);
L(2)=Link([0  0  13  0]);
L(3)=Link([0  0  17  0]);
robot=SerialLink(L,'name','threelink');
robot.teach();


% init=[0 0 0];
% targ=[pi/2, pi/4 ,pi/6];
% step=40;
% [q, qd, qdd]=jtraj(init,targ,step);
% subplot(3,2,[1,3]);
% robot.plot(q,'trail','b.');
% 
% subplot(3,2,2);%不同时刻关节角度变化曲线
% i=1:3;
% plot(q(:,i));
% title('角度位置');
% grid on;
% subplot(3,2,4);%角速度变化曲线
% i=1:3;
% plot(qd(:,i));
% title('关节角速度');
% grid on;
% subplot(3,2,6);%角加速度变化曲线
% i=1:3;
% plot(qdd(:,i));
% title('关节角加速度');
% grid on;
% 
% T0=robot.fkine(init);
% Tf=robot.fkine(targ);
% Tc=ctraj(T0,Tf,step);
% tt=transl(Tc);
% subplot(3,2,5);
% plot2(tt,'r');
% title('轨迹图');
% grid on;
