% Import raw data and masks sepertately and cao

Data = niftiread('6 t2_fl2d_tra_2.5mm_BW40.nii');
mask = niftiread('6 t2_fl2d_tra_2.5mm_BW40-label.nii');
Contrast = niftiread('6 t2_fl2d_tra_2.5mm_BW40-label_1.nii');
BackgroundNoise


Results = single(Data) .* single(mask); 
ResultsContrast = single(Data) .* single(Contrast);


meanSTN = sum(sum(sum(Results)))/sum(sum(sum(mask)))
meanContrast = sum(sum(sum(ResultsContrast)))/sum(sum(sum(Contrast)))

imtool(squeeze(Data(:,:,30)))

% Another way to calculate the mean value
Index = find(ResultsContrast);
ResultsContrastNew = ResultsContrast(Index);
mean(ResultsContrastNew)
