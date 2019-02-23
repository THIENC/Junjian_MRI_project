clc;clear;
% Import raw data and masks sepertately
MainDir = '/Users/Baotian/Documents/GitHub/Junjian_MRI_project/S';
cd(MainDir)
Subjects = dir(pwd);
Subjects = Subjects(3:end);
for i = 1:length(Subjects)
    cd(Subjects(i).name)
    Sequence = dir(pwd);
    Sequence = Sequence(3:end);
    for j = 1:length(Sequence)
        cd(Sequence(j).name)
        CurrentSequence = Sequence(j).name;
        cd('L')  % Left side
        % Screening the file names
        DataFile     = dir(strcat('*',Sequence(j).name,'.nii')); 
        STNMaskFile  = dir('*STN*');
        ContrastMaskFile = dir('*Con*');
        OutBrainMaskFile = dir('*Out*');
        % Load the corresponding data
        Data         = niftiread(DataFile.name);
        STNMask      = niftiread(STNMaskFile.name);
        ContrastMask = niftiread(ContrastMaskFile.name);
        OutBrainMask = niftiread(OutBrainMaskFile.name);
        % Find the globle mean for value adjustment
        GlobleMeanValue = mean(mean(mean(single(Data))));
        % Extract the raw data     
        STNData      = single(Data) .* single(STNMask);
        ContrastData = single(Data) .* single(ContrastMask);
        OutBrainData = single(Data) .* single(OutBrainMask);
        % Calculate the CNR
        meanSTN_Adjust        = (sum(sum(sum(STNData)))/sum(sum(sum(STNMask))))/GlobleMeanValue;
        meanContrast_Adjust   = (sum(sum(sum(ContrastData)))/sum(sum(sum(ContrastMask))))/GlobleMeanValue;
        OutBrainInd    = find(OutBrainData);
        STDOutBrain_Adjust = nanstd(OutBrainData(OutBrainInd)/GlobleMeanValue);
        CNR_L = abs((meanSTN_Adjust - meanContrast_Adjust))/STDOutBrain_Adjust;
        cd ..
        cd('R')  % Right side
        % Screening the file names
        DataFile     = dir(strcat('*',Sequence(j).name,'.nii')); 
        STNMaskFile  = dir('*STN*');
        ContrastMaskFile = dir('*Con*');
        OutBrainMaskFile = dir('*Out*');
        % Load the corresponding data
        Data         = niftiread(DataFile.name);
        STNMask      = niftiread(STNMaskFile.name);
        ContrastMask = niftiread(ContrastMaskFile.name);
        OutBrainMask = niftiread(OutBrainMaskFile.name);
        % Extract the raw data     
        STNData      = single(Data) .* single(STNMask);
        ContrastData = single(Data) .* single(ContrastMask);
        OutBrainData = single(Data) .* single(OutBrainMask);
        % Calculate the CNR
        meanSTN_Adjust        = sum(sum(sum(STNData)))/sum(sum(sum(STNMask)));
        meanContrast_Adjust   = sum(sum(sum(ContrastData)))/sum(sum(sum(ContrastMask)));
        OutBrainInd    = find(OutBrainData);
        STDOutBrain_Adjust = nanstd(OutBrainData(OutBrainInd));
        CNR_R = abs((meanSTN_Adjust - meanContrast_Adjust))/STDOutBrain_Adjust;
        eval(strcat('CNRAdjust_L_All','(',num2str(i),')','.',Sequence(j).name,'=','CNR_L'))
        eval(strcat('CNRAdjust_R_All','(',num2str(i),')','.',Sequence(j).name,'=','CNR_R'))
        cd ..
        cd ..   
    end   
    cd ..
end

% Write the table for statistics

% For the left side
LeftCNRAdjustTable = struct2table(CNRAdjust_L_All);
LeftCNRFileName = 'LeftCNRAdjust.xlsx';
writetable(LeftCNRAdjustTable,LeftCNRFileName)

% For the right side
RightCNRAdjustTable = struct2table(CNRAdjust_R_All);
RightCNRFileName = 'RightCNRAdjust.xlsx';
writetable(RightCNRAdjustTable,RightCNRFileName)

% For both side




% % Another way to calculate the mean value
% Index = find(ResultsContrast);
% ResultsContrastNew = ResultsContrast(Index);
% mean(ResultsContrastNew)
