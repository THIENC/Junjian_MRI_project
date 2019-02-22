% Import raw data and masks sepertately and cao

Data = niftiread('S01.SWI_Images.nii');
STNMask = niftiread('S01.L.STN.SWI_Images-label.nii');
ContrastMask = niftiread('S01.L.Con.SWI_Images-label_1.nii');
BackgroundNoiseMask = niftiread('S01.L.Out.SWI_Images-label_2.nii');


Results = single(Data) .* single(STNMask); 
ResultsContrast = single(Data) .* single(ContrastMask);
Background = single(Data) .* single(BackgroundNoiseMask);

meanSTN = sum(sum(sum(Results)))/sum(sum(sum(STNMask)))
meanContrast = sum(sum(sum(ResultsContrast)))/sum(sum(sum(ContrastMask)))
stdBackground = single(Data) .* single(BackgroundNoiseMask);


imtool(squeeze(Data(:,:,30)))

% Another way to calculate the mean value
Index = find(ResultsContrast);
ResultsContrastNew = ResultsContrast(Index);
mean(ResultsContrastNew)
