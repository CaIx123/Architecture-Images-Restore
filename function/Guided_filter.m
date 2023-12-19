%�����˲�ʵ�ֺ����������ڵ�ͨ��ͼ��
function q = Guided_filter(I, p, r, eps)
         %   ʱ�临�Ӷ�ΪO(1).
         %���������
         %   ����ͼ�� I (double���ͣ�ȡֵΪ[0��1])
         %   ���˲�ͼ�� p (double���ͣ�ȡֵΪ[0��1])
         %   �˲����ڰ뾶 r
         %   ���򻯲���: eps������ȡ��0.2^2��
         %���������
         %   �˲����ͼ��q

[hei, wid] = size(I);
N = boxfilter(ones(hei, wid), r); %boxfilter��һ���󴰿�������Ԫ�صĺ͵ĳ���(����ʵ�ַ�ʽ����һ�����)
                                  %���N������ͼ��I�ڰ뾶Ϊr�Ĵ����ڵ����ظ���

mean_I = boxfilter(I, r) ./ N;
mean_p = boxfilter(p, r) ./ N;
mean_Ip = boxfilter(I.*p, r) ./ N;
cov_Ip = mean_Ip - mean_I .* mean_p; % ��ֲ������ڵ�Э�����ak���ʽ�ķ��Ӳ���

mean_II = boxfilter(I.*I, r) ./ N;
var_I = mean_II - mean_I .* mean_I;

a = cov_Ip ./ (var_I + eps); % ��ak;
b = mean_p - a .* mean_I;    % ��bk;

mean_a = boxfilter(a, r) ./ N;
mean_b = boxfilter(b, r) ./ N;

q = mean_a .* I + mean_b;    %���˲����q;
end


