%% RULES FOR TAKING PICS
% 1. USE PLAIN BACKGROUND
% 2. USE APPROPRIATE SIGN
% 3. MOVE AROUND SLIGHTLY TO GET VARIANCE IN DATA
% 4. SAVE IN APPROPRIATE DIRECTORIES

%% CODE TO TAKE PICTURES
% saves pics in the current MATLAB path
% you need to add matlab webcam support from add on
% go to: home > add-ons > hardware support packages 
% > Matlab support package for USB webcams OR IP cams and click install
% after a successful installition run this program

clc;
clear all;
close all;

%x = webcam(); % opening the webcam for this operation
x = ipcam('http://192.168.31.172:8080/video'); %if you don't have webcam use this

preview(x) % remove comment mark to see preview

pause(10) % adjust pause to your liking

disp('Capturing...');
for i = 1:60  % taking 5 upper limit to take 5 images; use 50 to take 50 images
    beep
    img = snapshot(x); % snapshot take the images
    img = imresize(img, [100 100]);
    img = fliplr(img);
    fname = ['pics-saleh' num2str(i),'.jpg']; % naming a file and saving it as .png
    imwrite(img,fname,'jpg'); % just to write the image
    pause(0.25) % takes images after 0.2 secs; change the time as needed
end
disp('Done');

clear all;
close all;
clc;
