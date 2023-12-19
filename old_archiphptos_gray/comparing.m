%先插值后滤波与先滤波后插值的比较
close all; clear all; clc;					%关闭所有图形窗口，清除工作空间所有变量，清空命令行
pic_get=imread('上海2.jpg');           %提取灰度图
%双边滤波
pic_filtered1=Bilater_Gray(double(pic_get)/255,1,3,0.1);
pic_amp1=splineamp(pic_filtered1*255,3);
pic_filtered2=Bilater_Gray(pic_amp1,3,3,0.1);

pic_amp=splineamp(pic_get,3);
pic_filtered=Bilater_Gray(double(pic_amp),1,3,0.1);

figure('Name','先插值后滤波','NumberTitle','off')
subplot(2,2,1);imshow(pic_get);title('原图');axis on;
subplot(2,2,2);imshow(pic_amp);title('三次样条插值后');axis on;
subplot(2,2,3);imshow(pic_filtered);title('滤波后');axis on;

figure('Name','先滤波后插值','NumberTitle','off')
subplot(2,2,1);imshow(pic_get);title('原图');axis on;
subplot(2,2,2);imshow(pic_filtered1);title('滤波后');axis on;
subplot(2,2,3);imshow(pic_amp1);title('三次样条插值后');axis on;
% subplot(2,2,4);imshow(pic_filtered2);title('再滤波');axis on;
