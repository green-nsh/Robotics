%坐标系的动态变化
init=eye(4);
trplot(init);
rx=rotx(pi/2);
ry=roty(pi/2);
rxy02=rx*ry;
rxy01=ry*rx;

subplot(1,2,1);  %相对固定坐标系变换
hold on
trplot(init,'color','r');
tranimate(rxy01,'color','b');
hold off;

subplot(1,2,2);   %相对于当前系；
hold on;
trplot(init,'color','r');
tranimate(rxy02,'color','b');
hold off;
