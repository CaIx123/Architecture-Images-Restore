close all; clear all; clc;					%�ر�����ͼ�δ��ڣ���������ռ����б��������������
pic_get=imread('����.jpg');           %��ȡ�Ҷ�ͼ
%˫���˲�

pic_filtered=Bilater_Gray(double(pic_get)/255,1,3,0.1);
pic_amp=splineamp(pic_filtered*255,3);
pic_filtered1=Bilater_Gray(pic_amp,3,3,0.1);

figure('Name','�޸���','NumberTitle','off')
subplot(2,2,1);imshow(pic_get);title('ԭͼ');axis on;
subplot(2,2,2);imshow(pic_filtered);title('�˲���');axis on;
subplot(2,2,3);imshow(pic_amp);title('����������ֵ��');axis on;
subplot(2,2,4);imshow(pic_filtered1);title('���˲���');axis on;

%ͼ�񱣴�
str0='E:\matlab2018\matlab2018b\Mat_projects\�����й���ҵ\old_archiphptos_gray\';
str1='�����޸�';
str2='.jpg';  
save_path=[str0,str1,str2];
imwrite(pic_filtered1,save_path);