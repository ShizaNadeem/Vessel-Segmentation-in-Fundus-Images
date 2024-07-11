% Read Image
I = imread('01_test.tif');
subplot(2,4,1);
imshow(I);
title('Original Image');

% Read image
im = im2double(I);

% Convert RGB to Gray via PCA
lab = rgb2lab(im);
f = 0;
wlab = reshape(bsxfun(@times, cat(3, 1-f, f/2, f/2), lab), [], 3);
[C, S] = pca(wlab);
S = reshape(S, size(lab));
S = S(:,:,1);
gray = (S - min(S(:))) ./ (max(S(:)) - min(S(:)));
subplot(2,4,2);
imshow(gray);
title('Gray-Scale Image');

% Contrast Enhancement of gray image using CLAHE
tic
J = adapthisteq(gray, 'numTiles', [8 8], 'nBins', 128);
subplot(2,4,3);
imshow(J);
title('Contrast Enhanced Image');
toc

% Background Exclusion
% Apply Wiener Filter
tic
JF = wiener2(J, [9 9]);
subplot(2,4,4);
imshow(JF);
title('Wiener Filtered Image');
toc

% Take the difference between the gray image and Wiener Filter
tic
Z = imsubtract(JF, J);
subplot(2,4,5);
imshow(Z,[]);
title('Difference b/w Gray & Wiener Filtered Image');
toc

% Threshold using Otsu's Method
tic
level = graythresh(Z); 

% Convert to Binary
BW = imbinarize(Z, level - 0.008);

% Remove small pixels
BW2 = bwareaopen(BW, 100);

% Overlay
BW2 = imcomplement(BW2);
out = imoverlay(I, BW2, [0 0 0]);
subplot(2,4,6);
imshow(out);
title('Resultant Enhanced Image');
toc