close all; clear all; clc;					%�ر�����ͼ�δ��ڣ���������ռ����б��������������
pic=imread('old.jpg');
% pic1=pic;
pic1=rgb2gray(pic);
subplot(2,2,1);imshow(pic);title('ԭͼ');axis on;
subplot(2,2,2);imshow(pic1);title('�Ҷ�ͼ');axis on;
pic2=pic(:,:,:);
pic3=rgb2gray(pic2);
% pic3=pic2;
subplot(2,2,3);imshow(pic2);title('ԭͼ�ü�');axis on;
subplot(2,2,4);imshow(pic3);title('�Ҷ�ͼ�ü�');axis on;

str0='E:\matlab2018\matlab2018b\Mat_projects\�����й���ҵ\old_archiphptos_gray\';
str1='old_dalian';
str2='.jpg';       
save_path=[str0,str1,str2];
imwrite(pic3,save_path);


