 
 %I = imread('E:\\2. ��������ר��\\����\\cy9.tif'); 
 I = imread('before_yanan_hs1.tif'); 
  NumLevels=16;  %������������
  
  [M,N,O] = size(I);
  minValue=10000;
  maxValue=0;
  nodataValue=I(1,1);
 
  % ��ȡ����������Сֵ�����￼����Nodata
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

%glcm�ǰ�����Nodataͳ����Ϣ��glcmCheck������Nodataͳ����Ϣ
 [glcm,SI] = graycomatrix1(I,'NumLevels',NumLevels,'GrayLimits',[minValue  maxValue],'Offset',[0 3],'Symmetric',true);  %���ɹ�������
 glcmCheck=glcm(2:NumLevels+1,2:NumLevels+1);
       