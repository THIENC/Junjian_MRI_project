% Calculate the area under the curve
% Load the data
MainDir = '/Users/Baotian/Documents/GitHub/Junjian_MRI_project/AreaDataTest';
cd(MainDir)
SequenceFiles = dir('*.xlsx');
% MAG
MAG = xlsread(SequenceFiles(1).name);
MAG = MAG(2:end,:);
% MIP
MIP = xlsread(SequenceFiles(2).name);
MIP = MIP(2:end,:);
% SWI
SWI = xlsread(SequenceFiles(3).name);
SWI = SWI(2:end,:);
% T2
T2 = xlsread(SequenceFiles(4).name);
T2 = T2(2:end,:);
% T2FLAIR
T2FLAIR = xlsread(SequenceFiles(5).name);
T2FLAIR = T2FLAIR(2:end,:);
% T2FLASH2D
T2FLASH2D = xlsread(SequenceFiles(6).name);
T2FLASH2D = T2FLASH2D(2:end,:);
% T2FLASH2DHB
T2FLASH2DHB = xlsread(SequenceFiles(7).name);
T2FLASH2DHB = T2FLASH2DHB(2:end,:);
% T2SPACE
T2SPACE = xlsread(SequenceFiles(8).name);
T2SPACE = T2SPACE(2:end,:);

% Calculate the AUC 
% First find the line
StartPoint = 11;
EndPoint   = 90;
for i = 1:8
    CurrentSequence = xlsread(SequenceFiles(i).name);
    CurrentSequence = CurrentSequence(2:end,:);
    for j = 1:size(CurrentSequence,1)
        coefficients = polyfit([StartPoint, EndPoint], [CurrentSequence(j,StartPoint), CurrentSequence(j,EndPoint)], 1);
        a = coefficients (1);
        b = coefficients (2);
        Xaxis = 1:100;
        % Calculate the values adjust to base line
        Adjust(j,:) = CurrentSequence(j,:) - (a*Xaxis + b);
        
        %     figure
        %     plot(MAG(i,:))
        %     hold on
        %     axis tight
        %     Xaxis = 1:100;
        %     plot(a*Xaxis + b)
        %     plot(Adjust(i,:))
        
        % Compute area between positive y data and x axis:
        % positiveArea = sum(y(y>0));
        % Compute area between negative y data and x axis:
        y = Adjust(j,:);
        negativeArea = sum(y(y<0));
        AUC(i,j) = negativeArea;
        
    end
end
AUC = -AUC'



StartPoint = 21;
EndPoint   = 80;
for i = 1:8
    CurrentSequence = xlsread(SequenceFiles(i).name);
    CurrentSequence = CurrentSequence(2:end,:);
    for j = 1:size(CurrentSequence,1)
        coefficients = polyfit([StartPoint, EndPoint], [CurrentSequence(j,StartPoint), CurrentSequence(j,EndPoint)], 1);
        a = coefficients (1);
        b = coefficients (2);
        Xaxis = 1:100;
        % Calculate the values adjust to base line
        Adjust(j,:) = CurrentSequence(j,:) - (a*Xaxis + b);
        
        %     figure
        %     plot(MAG(i,:))
        %     hold on
        %     axis tight
        %     Xaxis = 1:100;
        %     plot(a*Xaxis + b)
        %     plot(Adjust(i,:))
        
        % Compute area between positive y data and x axis:
        % positiveArea = sum(y(y>0));
        % Compute area between negative y data and x axis:
        y = Adjust(j,:);
        negativeArea = sum(y(y<0));
        AUC_2(i,j) = negativeArea;
    end
end
AUC_2 = -AUC_2'






figure
plot(mean(MAG))
hold on 
plot(mean(MIP))
plot(mean(SPACE))
plot(mean(SWI))
plot(mean(T2))
plot(mean(T2FLAIR))
plot(mean(T2FLASH2D))
plot(mean(T2FLASH2DHB))

axis tight
% 
% % For each trial
% figure
% for i = 1:7
%     plot(MIP(i,:))
%     hold on
% end
% axis tight













