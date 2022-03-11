# coding=utf-8
import numpy as np
import matplotlib.pyplot as plt

d = 0.5  # 关节1偏距
a1 = 1.0  # 连杆2长度
a2 = 0.7  # 连杆3长度

# px = [1.5, 1.0, 0.7]
# py = [0.2, 0.5, 0.8]
# pz = [1.0, 0.5, 0.8]
px = np.arange(0.8, 1.2, 0.01)
py = np.arange(0.2, 0.6, 0.01)
pz = np.arange(0.5, 0.9, 0.01)
px = np.array(px).reshape(np.array(px).shape[0], 1)  # list转array 链表转数组
py = np.array(py).reshape(np.array(py).shape[0], 1)
pz = np.array(pz).reshape(np.array(pz).shape[0], 1)

# 反解
# 中间量
H = px ** 2 + py ** 2 + pz ** 2 + a1 ** 2 + d ** 2 - a2 ** 2 - 2 * d * pz
I = 2 * a1 * (d - pz)
J = -2 * a1 * np.sqrt(px ** 2 + py ** 2)
c3 = (px ** 2 + py ** 2 + (pz - d) ** 2 - a1 ** 2 - a2 ** 2) / (2 * a1 * a2)  # c3代表cos(theta3) 下同
s3 = np.sqrt(1 - c3 ** 2)
# 第一组解
theta11 = np.arctan2(py, px)
theta21 = 2 * np.arctan((-I + np.sqrt(I ** 2 + J ** 2 - H ** 2)) / (H - J))
theta32 = np.arctan2(-s3, c3)
theta = np.array([theta11, theta21, theta32])
# 修正角1

np.set_printoptions(precision=5)  # 输出5位有效数
print(np.degrees(theta))

t = np.arange(1, 41, 1).reshape(np.array(px).shape[0], 1)
plt.figure(1)
plt.plot(t, np.degrees(theta11))
plt.plot(t, np.degrees(theta21))
plt.plot(t, np.degrees(theta32))
plt.show()
