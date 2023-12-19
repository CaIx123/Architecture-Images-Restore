close all; clear all; clc;					%关闭所有图形窗口，清除工作空间所有变量，清空命令行
pic_get=imread('大连.jpg');           %提取灰度图
%双边滤波

pic_filtered=Bilater_Gray(double(pic_get)/255,1,3,0.1);
pic_amp=splineamp(pic_filtered*255,3);
pic_filtered1=Bilater_Gray(pic_amp,3,3,0.1);

figure('Name','修复后','NumberTitle','off')
subplot(2,2,1);imshow(pic_get);title('原图');axis on;
subplot(2,2,2);imshow(pic_filtered);title('滤波后');axis on;
subplot(2,2,3);imshow(pic_amp);title('三次样条插值后');axis on;
subplot(2,2,4);imshow(pic_filtered1);title('再滤波后');axis on;

%图像保存
str0='E:\matlab2018\matlab2018b\Mat_projects\美丽中国作业\old_archiphptos_gray\';
str1='大连修复';
str2='.jpg';  
save_path=[str0,str1,str2];
imwrite(pic_filtered1,save_path);