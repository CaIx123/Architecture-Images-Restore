close all; clear all; clc;					%关闭所有图形窗口，清除工作空间所有变量，清空命令行
pic=imread('old.jpg');
% pic1=pic;
pic1=rgb2gray(pic);
subplot(2,2,1);imshow(pic);title('原图');axis on;
subplot(2,2,2);imshow(pic1);title('灰度图');axis on;
pic2=pic(:,:,:);
pic3=rgb2gray(pic2);
% pic3=pic2;
subplot(2,2,3);imshow(pic2);title('原图裁剪');axis on;
subplot(2,2,4);imshow(pic3);title('灰度图裁剪');axis on;

str0='E:\matlab2018\matlab2018b\Mat_projects\美丽中国作业\old_archiphptos_gray\';
str1='old_dalian';
str2='.jpg';       
save_path=[str0,str1,str2];
imwrite(pic3,save_path);


