%�Ȳ�ֵ���˲������˲����ֵ�ıȽ�
close all; clear all; clc;					%�ر�����ͼ�δ��ڣ���������ռ����б��������������
pic_get=imread('�Ϻ�2.jpg');           %��ȡ�Ҷ�ͼ
%˫���˲�
pic_filtered1=Bilater_Gray(double(pic_get)/255,1,3,0.1);
pic_amp1=splineamp(pic_filtered1*255,3);
pic_filtered2=Bilater_Gray(pic_amp1,3,3,0.1);

pic_amp=splineamp(pic_get,3);
pic_filtered=Bilater_Gray(double(pic_amp),1,3,0.1);

figure('Name','�Ȳ�ֵ���˲�','NumberTitle','off')
subplot(2,2,1);imshow(pic_get);title('ԭͼ');axis on;
subplot(2,2,2);imshow(pic_amp);title('����������ֵ��');axis on;
subplot(2,2,3);imshow(pic_filtered);title('�˲���');axis on;

figure('Name','���˲����ֵ','NumberTitle','off')
subplot(2,2,1);imshow(pic_get);title('ԭͼ');axis on;
subplot(2,2,2);imshow(pic_filtered1);title('�˲���');axis on;
subplot(2,2,3);imshow(pic_amp1);title('����������ֵ��');axis on;
% subplot(2,2,4);imshow(pic_filtered2);title('���˲�');axis on;
