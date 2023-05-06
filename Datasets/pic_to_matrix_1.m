clc;
clear all;
close all;

%% DATA

%personal_directory='D:\MatLab\All programs\MATLAB\EEE 312\#PROJECT\archive\asl_alphabet_train\asl_alphabet_train\';
personal_directory='D:\MatLab\All programs\MATLAB\EEE 312\#PROJECT\#dataset_master\iteration_6\';
Folders=dir([personal_directory '*.*']);
count=1;

override_index = 380;
%data=zeros(override_index*39,100,100);
data=zeros(override_index*39,100,100,3);

for i=1:39
    current_folder=Folders(i+2).name;
    
    current_dir = [personal_directory, current_folder];
    mat_files = dir(fullfile(current_dir,'*.jpg'));
    %pic_count=size(mat_files,1);
    pic_count = override_index;
     
    for j=1:pic_count
        mat_string = [current_dir,'\', mat_files(j).name];
        
        temp = imread(mat_string);

        temp  = imresize(temp,[100 100]);
        %temp  = rgb2gray(imresize(temp,[100 100]));
        
        %temp = round(temp/8)*8;

        %data(count,:,:) = temp;
        data(count,:,:,:) = temp;
        %comment this out and the speed goess brr..
        %figure(3), imshow(temp); 
        count=count+1;
        disp(mat_string);
    end
end

save('data_master_6.mat','-v7.3','data');

%% LABELS 1

count = 1;
labels = zeros(pic_count*39,39);
for i = 1:39
    for j = 1:pic_count
        labels(count,i) = 1;
        count  = count+1;
    end
end

count = 1;
labels_oh = zeros(pic_count*39,1);
for i = 0:38
    for j = 1:pic_count
        labels_oh(count) = i;
        count  = count+1;
    end
end

save('labels_master_6.mat','-v7.3','labels');
save('labels_6_oh.mat','-v7.3','labels_oh');


%data is out INPUT MATRIX
%labels is out OUTPUT MATRIX