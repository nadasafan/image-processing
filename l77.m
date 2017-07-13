%To study the implementation of edge detection using Laplace filter
%Developed By Jakesh Bohaju
%Date 04 July 2017
%___________________________________________________________________
%Three critical statements
%___________________________________________________________________
close all;
clear variables;
clc;
%___________________________________________________________________
%Read image
%___________________________________________________________________
a = [200 200 200 200 200 200 200 50 150 150 150 150 150 150 150;
    200 200 200 200 200 200 200 50 150 150 150 150 150 150 150;
    200 200 200 200 200 200 200 50 150 150 150 150 150 150 150;
    200 200 200 200 200 200 200 50 150 150 150 150 150 150 150;
    200 200 200 200 200 200 200 50 150 150 150 150 150 150 150;
    200 200 200 200 200 200 200 50 150 150 150 150 150 150 150;
    50 50 50 50 50 50 50 50 50 50 50 50 50 50 50 ;
    150 150 150 150 150 150 150 50 200 200 200 200 200 200 200;
    150 150 150 150 150 150 150 50 200 200 200 200 200 200 200;
    150 150 150 150 150 150 150 50 200 200 200 200 200 200 200;
    150 150 150 150 150 150 150 50 200 200 200 200 200 200 200;
    150 150 150 150 150 150 150 50 200 200 200 200 200 200 200;
    150 150 150 150 150 150 150 50 200 200 200 200 200 200 200;];
a = uint8(a);
%___________________________________________________________________
%Laplace filter mask
%___________________________________________________________________
h = [0 1 0;1 -4 1;0 1 0];
c = conv2(a,h);
%___________________________________________________________________
%Implement on specific image
%___________________________________________________________________
i = imread('Y:\700310.jpg');
j = rgb2gray(i);
j = im2double(j);
y = conv2(j,h,'valid'); %apply only on valid portion
%___________________________________________________________________
%Built in laplace filter on specific image
%___________________________________________________________________
h = fspecial('laplacian');  z = conv2(j,h,'valid');
%___________________________________________________________________
%Output image
%___________________________________________________________________
figure;subplot(2,2,1),imshow(a),
title('Image made using inputted pixel value');
subplot(2,2,2),imshow(c),
title('Laplace filter on image made manually');
subplot(2,2,3),imshow(y),title('Laplace filter on specific image');
subplot(2,2,4),imshow(z),title('Built in Laplace filter');