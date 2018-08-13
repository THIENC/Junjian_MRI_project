% Samples = VarName2;
% SamplesNorm = Samples/max(Samples);
% SamplesNorm = [0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 SamplesNorm' 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5]
% 
% plot(SamplesNorm)
% hold on
% SamplesSmooth = Gaussian_Smooth(SamplesNorm);
% plot(SamplesSmooth)

SamplesSmooth = Gaussian_Smooth_Interpolate( VarName5 )
subplot 211
plot(VarName5/max(VarName5))
subplot 212
plot(SamplesSmooth)
samples = VarName5/max(VarName5);
figure;
subplot 211
stem(samples,'filled','markersize',3)
hold on
plot(samples)
grid on
xlabel 'Sample number',ylabel Original
subplot 212
stem(SamplesSmooth,'filled','markersize',3)
hold on
plot(SamplesSmooth)
grid on
xlabel 'Sample number',ylabel Interpolated

SamplesSmooth = Gaussian_Smooth_Interpolate( VarName2 )
subplot 211
plot(VarName2/max(VarName2))
subplot 212
plot(SamplesSmooth)
samples = VarName2/max(VarName2);
figure;
subplot 211
stem(samples,'filled','markersize',3)
hold on
plot(samples)
grid on
xlabel 'Sample number',ylabel Original
subplot 212
stem(SamplesSmooth,'filled','markersize',3)
hold on
plot(SamplesSmooth)
grid on
xlabel 'Sample number',ylabel Interpolated

