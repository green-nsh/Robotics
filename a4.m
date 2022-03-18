%通用轨迹规划方法
figure(1)
[s,sd,sdd]=tpoly(0,1,50);
[s1,s1d,s1dd]=tpoly(0,1,50,0.5,0.5);
subplot(2,2,1);
plot(s);
hold on;
plot(s1);
hold off;
title('五次多项式位移');
subplot(2,2,2);
plot(sd);
hold on;
plot(s1d);
hold off;
title('五次多项式速度');

[s2,s2d,s2dd]=lspb(0,1,50);
[s3,s3d,s3dd]=lspb(0,1,50,0.025);
subplot(2,2,3);
plot(s2);
hold on;
plot(s3);
hold off;
title('梯形轨迹位移');
subplot(2,2,4);
plot(s2d);
hold on;
plot(s3d);
hold off;
title('梯形轨迹速度');