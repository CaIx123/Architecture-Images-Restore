%导向滤波实现函数，适用于单通道图像
function q = Guided_filter(I, p, r, eps)
         %   时间复杂度为O(1).
         %输入参数：
         %   引导图像 I (double类型，取值为[0，1])
         %   待滤波图像 p (double类型，取值为[0，1])
         %   滤波窗口半径 r
         %   正则化参数: eps（可以取：0.2^2）
         %输出参数：
         %   滤波后的图像q

[hei, wid] = size(I);
N = boxfilter(ones(hei, wid), r); %boxfilter是一个求窗口内所有元素的和的程序(程序实现方式见下一代码块)
                                  %因此N代表了图像I在半径为r的窗口内的像素个数

mean_I = boxfilter(I, r) ./ N;
mean_p = boxfilter(p, r) ./ N;
mean_Ip = boxfilter(I.*p, r) ./ N;
cov_Ip = mean_Ip - mean_I .* mean_p; % 求局部区域内的协方差，即ak表达式的分子部分

mean_II = boxfilter(I.*I, r) ./ N;
var_I = mean_II - mean_I .* mean_I;

a = cov_Ip ./ (var_I + eps); % 求ak;
b = mean_p - a .* mean_I;    % 求bk;

mean_a = boxfilter(a, r) ./ N;
mean_b = boxfilter(b, r) ./ N;

q = mean_a .* I + mean_b;    %求滤波结果q;
end


