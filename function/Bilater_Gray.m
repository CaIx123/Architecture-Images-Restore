%适用于单通道图像的双边滤波程序
function B = Bilater_Gray(A,w,sigma_d,sigma_r)
         %输出参数：
         % A为待滤波图像（double类型，取值在[0，1]）
         % w为滤波窗口的半径（e.g:3*3窗口的w值为1，w=3时的滤波效果较好）
         % sigma_d为定义域（空间域）核的方差，通常设置为3
         % sigma_r为值域核的方差，通常设置为0.1
         %输出参数：
         % B为滤波后的图像
% 预先计算高斯距离权重
[X,Y] = meshgrid(-w:w,-w:w);
%创建核距离矩阵，e.g.
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
%计算定义域核
G = exp(-(X.^2+Y.^2)/(2*sigma_d^2));


%计算值域核H 并与定义域核G 乘积得到双边权重函数F
dim = size(A);
B = zeros(dim);
for i = 1:dim(1)
   for j = 1:dim(2)

         % 确定作用区域
         iMin = max(i-w,1);
         iMax = min(i+w,dim(1));
         jMin = max(j-w,1);
         jMax = min(j+w,dim(2));
         %定义当前核所作用的区域为(iMin:iMax,jMin:jMax)
         I = A(iMin:iMax,jMin:jMax);%提取该区域的源图像值赋给I

         %计算值域核H.
         H = exp(-(I-A(i,j)).^2/(2*sigma_r^2));

         % Calculate bilateral filter response.
         F = H.*G((iMin:iMax)-i+w+1,(jMin:jMax)-j+w+1);
         %在计算边缘部分的点的时候H的大小会变化，例如在计算第一行第一列的点时，
         %H的大小为4*4，因为7*7的其余部分都在图像外面（没有对应的值）。
         %因此适当的对G进行裁切使得G的大小始终能和H对上
         B(i,j) = sum(F(:).*I(:))/sum(F(:));

   end
end


