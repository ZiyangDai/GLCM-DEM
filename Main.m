clc;
clear;


[FilesName PathName]=uigetfile({'*.tif'},'ѡ��������ļ���������һ��ͼ��');
FilesNameIndex=regexp(FilesName,'\d');
FilesNameP=FilesName(1:FilesNameIndex-1);

filename=strcat(PathName,FilesNameP);


for i=1:1
    stats1=0;
    stats2=0;
     I = imread(strcat(filename,num2str(i),'.tif')); %�����ļ����е�ȫ������
      [M,N,O] = size(I);
      for m=2:M-1
          for n=2:N-1
              Gray(m-1,n-1)=I(m,n);
          end
      end       
     [glcm,SI] = graycomatrix(Gray,'NumLevels',8,'GrayLimits',[min(Gray(:)) max(Gray(:))],'Offset',[0 3],'Symmetric',true);  %���ɹ�������
     result_DEM_0(:,i)=haralick(glcm); 
     value=graycoprops(glcm,{'Energy','Contrast'})
     stats1 =stats1+value.Energy;
     stats2 =stats2+value.Contrast;
     
     [glcm,SI] = graycomatrix(Gray,'NumLevels',8,'GrayLimits',[min(Gray(:)) max(Gray(:))],'Offset',[-3 3],'Symmetric',true);  %���ɹ�������
     result_DEM_45(:,i)=haralick(glcm);
     value=graycoprops(glcm,{'Energy','Contrast'})
     stats1 =stats1+value.Energy;
     stats2 =stats2+value.Contrast;
    
     [glcm,SI] = graycomatrix(Gray,'NumLevels',8,'GrayLimits',[min(Gray(:)) max(Gray(:))],'Offset',[-3 0],'Symmetric',true);  %���ɹ�������
     result_DEM_90(:,i)=haralick(glcm); 
     value=graycoprops(glcm,{'Energy','Contrast'})
     stats1 =stats1+value.Energy;
     stats2 =stats2+value.Contrast;
     
     [glcm,SI] = graycomatrix(Gray,'NumLevels',8,'GrayLimits',[min(Gray(:)) max(Gray(:))],'Offset',[-3 -3],'Symmetric',true);  %���ɹ�������
     result_DEM_135(:,i)=haralick(glcm); 
     value=graycoprops(glcm,{'Energy','Contrast'})
      stats1 =stats1+value.Energy;
      stats2 =stats2+value.Contrast;
     
     result_DEM(1:13,i)=(result_DEM_135(1:13,i)+result_DEM_90(1:13,i)+result_DEM_45(1:13,i)+result_DEM_0(1:13,i))/4;  %���ĸ�������������ֵ��ƽ��ֵ
     result_DEM(14,i)=stats1/4; %��ʮ���м�¼Matlab�Դ������������õ���ض�
     result_DEM(15,i)=stats2/4; %��ʮ���м�¼Matlab�Դ������������õĶԱȶ�
     
     clear Gray
end


 
 


