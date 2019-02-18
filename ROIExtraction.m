im = dicomread('IMG-0002-00001.dcm');
dicomdisp(im)
h = imfreehand


dicomdisp('IMG-0002-00001.dcm')


Data = niftiread('6 t2_fl2d_tra_2.5mm_BW40.nii');
mask = niftiread('6 t2_fl2d_tra_2.5mm_BW40-label.nii');
Contrast = niftiread('6 t2_fl2d_tra_2.5mm_BW40-label_1.nii');


Results = single(Data) .* single(mask); 
ResultsContrast = single(Data) .* single(Contrast);


meanSTN = sum(sum(sum(Results)))/sum(sum(sum(mask)))
meanContrast = sum(sum(sum(ResultsContrast)))/sum(sum(sum(Contrast)))

imtool(squeeze(Data(:,:,19)))