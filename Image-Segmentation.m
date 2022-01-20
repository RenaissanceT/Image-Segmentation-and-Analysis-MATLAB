% Exercise 2: Image Segmentation and Image Analysis
clear all
% (1) Download the gray-scale image monument.jpg from the eClass Lab website and read it into MATLAB
% (1) Denote the image as g
f = imread('Histo_IM.JPG');
% (1) This will be the first subplot
figure(1);
subplot(3,3,1);
% (1) Determine the size of the image matrix 
[rows columns, numberOfColorChannels] = size(f);
% (1) Use this to calculate the uncompressed image size
sizeim = size(f);
s = dir('Histo_IM.JPG');
imshow(f);
title ('Histo-IM.JPG (The original image)');
% (1) Denote the size of the image by M x N
N_columns = columns;
M_rows = rows;

% (2) By visual inspection, identify the number of nuclei present in the image, and their approximate locations.
% (3) Display the red channel of the image (this will be the second subplot)
% (3) Red channel only
redchannel = f (:,:,1);
subplot(3,3,3);
imshow(redchannel);
title ('The grey level of the image');

% (4) Calculate a global threshold (using Otsu's method) for the (red channel) image
tau = graythresh(redchannel);

% (5) Using the MATLAB function im2bw and with the global threshold tau
% (5) generate a segmented binary image BW from the red channel image
% (5) Display the binary image BW using imshow 
BW = im2bw (redchannel,tau);
subplot(3,3,4);
imshow (BW);
title ('A segmented binary image BW');

% (6) Generate a binary image BWc, which is complement of the binary image BW
BWc = imcomplement(BW);
subplot(3,3,6);
imshow (BWc);
title ('A complement of the segmented binary image BW');

% (7) perform the morphological opening operation ∘ on the binary image BWc as follows
% R_1 = 1;
% sel_1 = strel('disk', R_1);
% BWco = imopen(BWc,sel_1);
% subplot(3,3,7);
% imshow(BWco);
% title ('The image BWCo when R = 1');

R_2 = 5;
sel_2 = strel('disk', R_2);
BWco = imopen(BWc,sel_2);
subplot(3,3,8);
imshow(BWco);
title ('The image BWCo when R = 5');

% R_3 = 20;
% s_3 = strel('disk', R_3);
% BWco = imopen(BWc,s_3);
% subplot(3,3,9);
% imshow(BWco);
% title ('The image BWCo when R = 20');

% (8) Using the code given below, find all the connected components in the image
% (8) and calculate the area, centroid and perimeter of all the connected components (stored in variable stats)
% (8) getting 4 connected components from binary image
cc = bwconncomp(BWco,4); % generates 4 connected components
% (8) calculate the area, centroid, and perimeter
stats = regionprops(cc, 'Area','Centroid','Perimeter');
% (8) Determine the largest and smallest components in terms of the area (in pixels). (5pts)
% XXXXXXXXXXXXXXXXXXXX

% (9) Identify the components with area less than P pixels
% (9) so that smaller non-nuclei areas are ignored, but no valid nuclei is ignored
% (9) Try at least three values of P, and compare the outputs in a separate plot.
figure;
% (9) Identify the components that have area larger than P pixels. 
% (9) Choose an appropriate value
P = 10;
idx = find([stats.Area] > P);
% (9) idx is the set of region indices that satisfy the area criteria 
BWco2 = ismember(labelmatrix(cc), idx);
cc2 = bwconncomp(BWco2,4);
stats2 = regionprops(cc2, 'Area','Centroid','Perimeter');
imshow (BWco2);
title ('The binry image BWco2 when P pixels = 10');

% (10) Display the centroid, area and perimeter for all connected components in the binary image BWco2 using the code below.
figure(2);
imshow(BWco2);
hold on;
for i=1:length(stats2);
    curCentroid=stats(i).Centroid;
    plot(curCentroid(1),curCentroid(2),'pr');
    text(curCentroid(1)-8,curCentroid(2)-7, ...
    sprintf('A=%d\nP=%.1f',stats2(i).Area, ...
    stats2(i).Perimeter),'color','b');
end
hold off;
title('After Removing Small Areas');

% (11) Superimpose the contour information on the original color image
ShowMaskContourOnIM(BWco2,f,3)
hold on;
for i=1:length(stats2)
    curCentroid=stats2(i).Centroid;
    plot(curCentroid(1),curCentroid(2),'pc','MarkerSize',20);
    text(curCentroid(1)-7,curCentroid(2)-5,...
        sprintf('Area=%d\nPerimerter=%.1f',stats2(i).Area,...
        stats2(i).Perimeter),'color','y');
end
hold off;


