# coding=utf-8
import numpy as np
import math

d = 0.5  # 关节1偏距
a1 = 1.0  # 连杆2长度
a2 = 0.7  # 连杆3长度

theta1 = math.radians(0)  # 关节角变量(math中采用弧度制)
theta2 = math.radians(90)
theta3 = math.radians(90)

px = math.cos(theta1) * (a2 * math.cos(theta2 + theta3) + a1 * math.cos(theta2))
py = math.sin(theta1) * (a2 * math.cos(theta2 + theta3) + a1 * math.cos(theta2))
pz = a2 * math.sin(theta2 + theta3) + a1 * math.sin(theta2) + d
print('-'*20+'三自由度机械臂正解计算'+'-'*20)
print("px={:.3f} ,py={:.3f} ,pz={:.3f}".format(px, py, pz))
