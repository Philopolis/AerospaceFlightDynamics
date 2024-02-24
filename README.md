# ⚠严禁直接将其当作你自己的报告上交⚠

战术导弹部分采用了给定高度（函数）的飞行方案和比例导引法的导引方法。

程序基于matlab R2019a实现  
方程组采用四阶龙格库塔法进行数值求解  
由于方程组不完全由微分方程构成，与常用教材所示例的龙格库塔法有出入  
因此数值解可能与正确的结果有偏差  
若发现代码中的错误运算请反馈

The equations are solved numerically by the fourth-order runge-kutta method.  
Because the equations are not composed entirely of differential equation, they are different from the runge-kutta method, which is often used in textbooks.  
Therefore, the numerical solution may deviate from the correct result.  
Please provide feedback if you find errors or bugs in the code.

📫邮箱/Email：pauline.live@qq.com or pauline.live.cn@gmail.com(not ofen)


# 2024.2.10 更新

重构了远程火箭部分的代码  
得到的数据更加真实，图像曲线更光滑  
pdf、数据和数据图并未更新，报告中使用的图像依旧是第一版代码所绘  
更新的代码位于code2文件夹下  
在matlab R2023b环境下运行良好  

# 2024.2.24 更新

重构了战术导弹部分的代码  
大大缩短了运行时间  
pdf、数据和数据图并未更新，报告中使用的图像依旧是第一版代码所绘  
更新的代码位于code2文件夹下  
在matlab R2023b环境下运行良好  
今后将不再对代码进行更新  

在此感谢学长简谐摄动  
https://space.bilibili.com/37747164  
的分享，他的工作使本库的代码上升到了全新的高度  
相关视频在  
https://www.bilibili.com/video/BV1d34y1A72o/


