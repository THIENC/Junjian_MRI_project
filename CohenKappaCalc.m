% read the data
MainDir = '/Users/Baotian/Documents/GitHub/Junjian_MRI_project/KappaCalc';
cd(MainDir)
% RaterFiles = dir('*.xlsx');
RaterFiles = dir('*LR*');
% Read the data from rater 1
Rater1 = xlsread(RaterFiles(1).name);

% Read the data from rater 2
Rater2 = xlsread(RaterFiles(2).name);

for i = 1:size(Rater1,2)
    % Construct the kappa matrix
    Rater1_temp = Rater1(:,i);
    Rater2_temp = Rater2(:,i);
    % First row
    Counter1 = 0;
    Counter2 = 0;
    Counter3 = 0;
    Counter4 = 0;
    for j = 1:9
        if Rater1_temp(j) == 0 && Rater2_temp(j) == 0
            Counter1 = Counter1 + 1;
        elseif Rater1_temp(j) == 1 && Rater2_temp(j) == 0
            Counter2 = Counter2 + 1;
        elseif Rater1_temp(j) == 2 && Rater2_temp(j) == 0
            Counter3 = Counter3 + 1;
        elseif Rater1_temp(j) == 3 && Rater2_temp(j) == 0
            Counter4 = Counter4 + 1;
        end 
    end
    Row1 = [Counter1,Counter2,Counter3,Counter4];
    % Second row
    Counter1 = 0;
    Counter2 = 0;
    Counter3 = 0;
    Counter4 = 0;
    for j = 1:9
        if Rater1_temp(j) == 0 && Rater2_temp(j) == 1
            Counter1 = Counter1 + 1;
        elseif Rater1_temp(j) == 1 && Rater2_temp(j) == 1
            Counter2 = Counter2 + 1;
        elseif Rater1_temp(j) == 2 && Rater2_temp(j) == 1
            Counter3 = Counter3 + 1;
        elseif Rater1_temp(j) == 3 && Rater2_temp(j) == 1
            Counter4 = Counter4 + 1;
        end 
    end
    Row2 = [Counter1,Counter2,Counter3,Counter4];
    % Third row
    Counter1 = 0;
    Counter2 = 0;
    Counter3 = 0;
    Counter4 = 0;
    for j = 1:9
        if Rater1_temp(j) == 0 && Rater2_temp(j) == 2
            Counter1 = Counter1 + 1;
        elseif Rater1_temp(j) == 1 && Rater2_temp(j) == 2
            Counter2 = Counter2 + 1;
        elseif Rater1_temp(j) == 2 && Rater2_temp(j) == 2
            Counter3 = Counter3 + 1;
        elseif Rater1_temp(j) == 3 && Rater2_temp(j) == 2
            Counter4 = Counter4 + 1;
        end 
    end
    Row3 = [Counter1,Counter2,Counter3,Counter4]; 
    % Fourth row
    Counter1 = 0;
    Counter2 = 0;
    Counter3 = 0;
    Counter4 = 0;
    for j = 1:9
        if Rater1_temp(j) == 0 && Rater2_temp(j) == 3
            Counter1 = Counter1 + 1;
        elseif Rater1_temp(j) == 1 && Rater2_temp(j) == 3
            Counter2 = Counter2 + 1;
        elseif Rater1_temp(j) == 2 && Rater2_temp(j) == 3
            Counter3 = Counter3 + 1;
        elseif Rater1_temp(j) == 3 && Rater2_temp(j) == 3
            Counter4 = Counter4 + 1;
        end 
    end
    Row4 = [Counter1,Counter2,Counter3,Counter4]; 
    
    Matrix = [Row1;Row2;Row3;Row4];
    Matrix_2scale(1,1) = sum(sum(Matrix(1:2,1:2)));
    Matrix_2scale(1,2) = sum(sum(Matrix(1:2,3:4)));
    Matrix_2scale(2,1) = sum(sum(Matrix(3:4,1:2)));
    Matrix_2scale(2,2) = sum(sum(Matrix(3:4,3:4)));
    
    Kappa(i) = cohenskappa(Matrix);
    Kappa_2Scale(i) = cohenskappa(Matrix_2scale);
    
end



