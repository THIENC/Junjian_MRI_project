function [ samples_increased ] = Sampling_Increase( samples )
%SAMPLING_INCREASE this fucntion will increased your sample to 100
%   A sample vector as input, sample increased to 100 will become output


SampleSize = length(samples);
% Mod = 100/SampleSize;
% Folds = ceil(Mod)
VectorTemp = interp(samples,100);
samples_increased = resample(VectorTemp,1,SampleSize);

%% visualize the interpolated signal
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

% x_sample = linspace(1,SampleSize,100)
% stem(samples)
% hold on
% plot(samples)
% 
% stem(x_sample,samples_increased)

end