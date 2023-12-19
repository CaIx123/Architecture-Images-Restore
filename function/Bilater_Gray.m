%�����ڵ�ͨ��ͼ���˫���˲�����
function B = Bilater_Gray(A,w,sigma_d,sigma_r)
         %���������
         % AΪ���˲�ͼ��double���ͣ�ȡֵ��[0��1]��
         % wΪ�˲����ڵİ뾶��e.g:3*3���ڵ�wֵΪ1��w=3ʱ���˲�Ч���Ϻã�
         % sigma_dΪ�����򣨿ռ��򣩺˵ķ��ͨ������Ϊ3
         % sigma_rΪֵ��˵ķ��ͨ������Ϊ0.1
         %���������
         % BΪ�˲����ͼ��
% Ԥ�ȼ����˹����Ȩ��
[X,Y] = meshgrid(-w:w,-w:w);
%�����˾������e.g.
%  [x,y]=meshgrid(-1:1,-1:1)
% 
% x =
% 
%     -1     0     1
%     -1     0     1
%     -1     0     1
% 
% 
% y =
% 
%     -1    -1    -1
%      0     0     0
%      1     1     1
%���㶨�����
G = exp(-(X.^2+Y.^2)/(2*sigma_d^2));


%����ֵ���H ���붨�����G �˻��õ�˫��Ȩ�غ���F
dim = size(A);
B = zeros(dim);
for i = 1:dim(1)
   for j = 1:dim(2)

         % ȷ����������
         iMin = max(i-w,1);
         iMax = min(i+w,dim(1));
         jMin = max(j-w,1);
         jMax = min(j+w,dim(2));
         %���嵱ǰ�������õ�����Ϊ(iMin:iMax,jMin:jMax)
         I = A(iMin:iMax,jMin:jMax);%��ȡ�������Դͼ��ֵ����I

         %����ֵ���H.
         H = exp(-(I-A(i,j)).^2/(2*sigma_r^2));

         % Calculate bilateral filter response.
         F = H.*G((iMin:iMax)-i+w+1,(jMin:jMax)-j+w+1);
         %�ڼ����Ե���ֵĵ��ʱ��H�Ĵ�С��仯�������ڼ����һ�е�һ�еĵ�ʱ��
         %H�Ĵ�СΪ4*4����Ϊ7*7�����ಿ�ֶ���ͼ�����棨û�ж�Ӧ��ֵ����
         %����ʵ��Ķ�G���в���ʹ��G�Ĵ�Сʼ���ܺ�H����
         B(i,j) = sum(F(:).*I(:))/sum(F(:));

   end
end


