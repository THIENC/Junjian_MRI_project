% load chestVolume
clear;
dicomBrowser 
[V,spatial,dim] = dicomreadVolume(uigetdir);
V = squeeze(V);

% V = im2single(V);
V = im2single(V);

whos V

volumeViewer(V) 

figure, imshow(V, []);
ginput

edgeThreshold = 0.4;
amount = 0.5;
C = localcontrast(XY, edgeThreshold, amount);
figure, imshow(C, []);


XY = V(180:217,158:229,14);
figure, imshow(XY, []);
B = imsharpen(XY);
figure, imshow(B, []);
XY = histeq(XY);

imageSegmenter(XY.*100)


mask = false(size(V));
mask(:,:, 160) = mask_XY;
mask(256, :, :) = mask(256, :, :)|reshape(mask_XZ, [1, 512, 318]);

V = histeq(V);

BW  = activecontour(V,mask,100,'Chan-Vese');

segmentedImage = V.*single(BW);

volumeViewer(BW);

volLungsPixels = regionprops3(logical(BW), 'volume');
xSpacing = 0.5; %(mm)
ySpacing = 0.5; %(mm)
zSpacing = 2.5; %(mm)

volLungs1 = volLungsPixels.Volume(1)*0.76*0.76*1.25*1e-6;

volLungs2 = volLungsPixels.Volume(2)*0.76*0.76*1.25*1e-6;
volLungsLiters = volLungs1 + volLungs2;




