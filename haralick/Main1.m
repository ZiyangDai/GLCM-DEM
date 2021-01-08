 
 %I = imread('E:\\2. 科研资料专区\\数据\\cy9.tif'); 
 I = imread('before_yanan_hs1.tif'); 
  NumLevels=16;  %设置量化级数
  
  [M,N,O] = size(I);
  minValue=10000;
  maxValue=0;
  nodataValue=I(1,1);
 
  % 获取矩阵的最大最小值，这里考虑了Nodata
  for m=1:M
      for n=1:N
        if(I(m,n) ~= nodataValue)
          if(I(m,n)<minValue)
               minValue=I(m,n);
          end 
          if(I(m,n)>maxValue)
                maxValue=I(m,n);
          end 
        end
      end
  end   

%glcm是包含了Nodata统计信息，glcmCheck不包含Nodata统计信息
 [glcm,SI] = graycomatrix1(I,'NumLevels',NumLevels,'GrayLimits',[minValue  maxValue],'Offset',[0 3],'Symmetric',true);  %生成共生矩阵
 glcmCheck=glcm(2:NumLevels+1,2:NumLevels+1);
       
