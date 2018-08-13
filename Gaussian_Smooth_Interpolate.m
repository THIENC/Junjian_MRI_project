function [ SampleSmoothedIncreased ] = Gaussian_Smooth_Interpolate( samples )
%GAUSSIN_SMOOTH this will smooth the vector you put in
%   Change the smooth scale in gausswin


% Normalize the samples to 0 to 1
samples = samples/max(samples);


SampleSize = size(samples);
SampleLength = max(SampleSize);
if SampleSize(1) > SampleSize(2)
    samples = samples';
end

% increase the sample to 100 points
SampleIncreasedTemp = resample(samples,110,1);
SampleIncreased100 = resample(SampleIncreasedTemp,1,SampleLength);

% Paddling the data

Paddles = mean(SampleIncreased100);
nPaddles = round(length(SampleIncreased100)/8);
SamplesPaddling = [repmat(Paddles,[1 nPaddles]) SampleIncreased100 repmat(Paddles,[1 nPaddles])];

% w = gausswin(round(SampleLength/4));
w = gausswin(round(25));
SampleSmoothed = conv(SamplesPaddling, w,'same');
SampleSmoothed = SampleSmoothed/max(SampleSmoothed);
% plot(samples)
% hold on
% plot(SampleSmoothed)

SampleSmoothedIncreased = [SampleSmoothed(nPaddles+6:nPaddles+105)];



% % Mod = 100/SampleSize;
% % Folds = ceil(Mod)
% SampleSmoothedLength = length(SampleSmoothed);
% 
% VectorTemp = resample(SampleSmoothed,100,1);
% VectorTemp1 = resample(samples,100,1)
% VectorTemp2 = resample(VectorTemp1,1,29)
% VectorTemp = interp(SampleSmoothed,100);
% VectorTemp3 = resample(SampleSmoothed,100,1)
% VectorTemp4 = resample(VectorTemp3,1,43)
% VectorTemp1 = upsample(samples,100-SampleLength);


% SampleSmoothedIncreased = samples_increased(floor((length(samples_increased)-100)/2)+1:...
%     floor((length(samples_increased)-100)/2)+100)

% SampleSmoothedIncreased = samples_increased(floor((length(samples_increased)-100)/2)+1:...
%     floor((length(samples_increased)-100)/2)+100);



% figure;
% subplot 211
% stem(samples,'filled','markersize',3)
% hold on
% plot(samples)
% grid on
% xlabel 'Sample number',ylabel Original
% subplot 212
% stem(samples_increased,'filled','markersize',3)
% hold on
% plot(samples_increased)
% grid on
% xlabel 'Sample number',ylabel Interpolated

% stem(x_sample,samples_increased)



%% #################################
% SampleSize = length(samples);
% figure;
% plot(samples_increased)
% hold on
%
%     w = gausswin(20);
% %     y = filter(w,10,samples_increased);
%      y = filtfilt(w,10,samples_increased);
%     plot(y,'--')
% %%
%  SampleSize = length(samples);
% figure;
% samples_norm = sample/std(samples)
% plot(samples_norm)
% hold on
%
%     w = gausswin(round(SampleSize/4));
% %     y = filter(w,10,samples_increased);
%      y = filtfilt(w,1,samples);
%      y = y/std(y)
%     plot(y,'--')

% %%
% SampleSize = length(samples);
% % figure;
% % samples_norm_1 = sample/max(samples)
% % plot(samples_norm_1)
% % hold on
%
%      w = gausswin(round(SampleSize/4));
% %     y = filter(w,10,samples_increased);
%      SampleSmoothed = filtfilt(w,1,samples);
%      SampleSmoothed = SampleSmoothed/max(SampleSmoothed)
% %     plot(y,'--')

% filteredSignal = conv(samples, w,'same');
% filteredSignal = filteredSignal/max(filteredSignal);
% plot(SampleSmoothed,'--')
% hold on
% plot(samples_norm_1)
% plot(filteredSignal,'--')
end

