Files = dir('0.Data');
FileNames = {Files(3:end).name};

% import all data
RawData = struct;
for i = 1:length(FileNames)
    DataTemp = xlsread(strcat(Files(1).folder,'\',FileNames{i}));
    FileNamesTemp = FileNames{i};
    FileNamesTemp = FileNamesTemp(1:end-5);
    eval(strcat('RawData.',FileNamesTemp,'= DataTemp(:,2);'))
end

Sequences = fieldnames(RawData);
for i = 1:length(FileNames)
    DataSmoothInterpolate(i,:) = Gaussian_Smooth_Interpolate(getfield(RawData, Sequences{i}));
end

figure;
for i = 1:length(FileNames);
    plot(DataSmoothInterpolate(i,:))
    hold on
end
legend(Sequences)
