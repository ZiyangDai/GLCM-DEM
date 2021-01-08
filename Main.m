clc;
clear;


[FilesName PathName]=uigetfile({'*.tif'},'选择待计算文件夹中任意一个图像');
FilesNameIndex=regexp(FilesName,'\d');
FilesNameP=FilesName(1:FilesNameIndex-1);

filename=strcat(PathName,FilesNameP);


for i=1:1
    stats1=0;
    stats2=0;
     I = imread(strcat(filename,num2str(i),'.tif')); %遍历文件夹中的全部样本
      [M,N,O] = size(I);
      for m=2:M-1
          for n=2:N-1
              Gray(m-1,n-1)=I(m,n);
          end
      end       
     [glcm,SI] = graycomatrix(Gray,'NumLevels',8,'GrayLimits',[min(Gray(:)) max(Gray(:))],'Offset',[0 3],'Symmetric',true);  %生成共生矩阵
     result_DEM_0(:,i)=haralick(glcm); 
     value=graycoprops(glcm,{'Energy','Contrast'})
     stats1 =stats1+value.Energy;
     stats2 =stats2+value.Contrast;
     
     [glcm,SI] = graycomatrix(Gray,'NumLevels',8,'GrayLimits',[min(Gray(:)) max(Gray(:))],'Offset',[-3 3],'Symmetric',true);  %生成共生矩阵
     result_DEM_45(:,i)=haralick(glcm);
     value=graycoprops(glcm,{'Energy','Contrast'})
     stats1 =stats1+value.Energy;
     stats2 =stats2+value.Contrast;
    
     [glcm,SI] = graycomatrix(Gray,'NumLevels',8,'GrayLimits',[min(Gray(:)) max(Gray(:))],'Offset',[-3 0],'Symmetric',true);  %生成共生矩阵
     result_DEM_90(:,i)=haralick(glcm); 
     value=graycoprops(glcm,{'Energy','Contrast'})
     stats1 =stats1+value.Energy;
     stats2 =stats2+value.Contrast;
     
     [glcm,SI] = graycomatrix(Gray,'NumLevels',8,'GrayLimits',[min(Gray(:)) max(Gray(:))],'Offset',[-3 -3],'Symmetric',true);  %生成共生矩阵
     result_DEM_135(:,i)=haralick(glcm); 
     value=graycoprops(glcm,{'Energy','Contrast'})
      stats1 =stats1+value.Energy;
      stats2 =stats2+value.Contrast;
     
     result_DEM(1:13,i)=(result_DEM_135(1:13,i)+result_DEM_90(1:13,i)+result_DEM_45(1:13,i)+result_DEM_0(1:13,i))/4;  %将四个方向的纹理参数值求平均值
     result_DEM(14,i)=stats1/4; %第十四行记录Matlab自带函数计算所得的相关度
     result_DEM(15,i)=stats2/4; %第十四行记录Matlab自带函数计算所得的对比度
     
     clear Gray
end


 
 


