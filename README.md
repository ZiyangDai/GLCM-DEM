# 基于灰度共生矩阵的DEM纹理特征提取
This folder mainly contains the code of extracting many kinds of GLCM features based on digital elevation model (DEM). 

## 简要介绍

+ 实验环境：Matlab 2015b
+ 可以获取DEM的多项纹理特征值：二阶角矩/能量（ASM）、对比度（CON）、相关度（COR）、方差（VAR）、逆差矩（IDM）、均值和（SAR）、熵（ENT）等13项。
+ 代码描述：①haralick：纹理特征值基本计算原理；②Main：灰度共生矩阵的输出，另外可以计算二阶角矩/能量、相关度、对比度、方差4项最基本的纹理特征；③Main1：计算并输出全部13种纹理特征。
+ 论文支撑：《基于灰度共生矩阵的DEM地形纹理特征量化研究》（2012, 刘凯 et al.）；《DEM分辨率对地形纹理特征提取的影响》（2014，黄骁力 et al.)
