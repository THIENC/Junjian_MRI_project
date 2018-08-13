%%%%%%%%%%%% THIS IS ORIGINAL CODE,Copyright Reserved.%%%%%
%%%%%%%%%%%% NO COMMERICAL USE! %%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%% DEVELOPED BY MATLAB及科学计算 GROUP %%%%%%%%%%%
%%%%%%%%%%%% PRINCIPAL FINISHING PERSON: KING %%%%%%%%%%%%%%
%%%%%%%%%%%% ACCOMPLISHMENT DATE：2017-09-23 %%%%%%%%%%%%%%%
%%%%%%%%%%%% CONTACT US BY PHONE:18829238404 %%%%%%%%%%%%%%%
%%%%%%%%%%%% CONTACT US BY QQ:2994842513 %%%%%%%%%%%%%%%%%%%
% function extraction
clear;
[ifile,ipath] = uigetfile({'*.*','*.dicom'});
inputfilename=fullfile(ipath,ifile);
% I_nii=load_untouch_nii(inputfilename);
% I=I_nii.img;
I=dicomread(inputfilename);
% I=dicomread('291261182.dicom');

% figure();
% imshow(I,[]);
resultI=clearScalp(I);%%%%%去头皮

% figure();
% imshow(resultI,[]);

% mGray=max(max(I));
% [Icounts,Ilocation]=imhist(I,2^12);
% Icounts=Icounts(2:end);
% Ilocation=Ilocation(2:end);
% step=1;
% % Icounts=cumsum(Icounts);
% Icounts_next=Icounts;
% first0=find(Icounts==0);
% first0=first0(1);
% Icounts_next(1:end-1)=Icounts(2:end);
% dev=abs(Icounts_next-Icounts)./(Icounts+eps);
% dev(end)=dev(end-1);
% dev(first0:end)=0;
% % dev(dev>=0.9)=0;
% mindev=min(dev(dev>0));
% threshold=Ilocation(dev==mindev);
% iI=I>threshold(1);%用于去除脑脊液
% SE3=strel('rectangle',[3,2]);
% iI=imclose(iI,SE3);
% iI = bwareaopen(iI,10);
% iI=imfill(iI,'holes');
% resultI(iI)=0;

% iI=uint8(I)>254;
% iI = bwareaopen(iI,10);
% resultI(iI)=0;

figure();
imshow(resultI,[]);

% [cx,cy,c]=improfile;
title('选择起点');
s=ginput(1);
p=insertShape(resultI,'circle',[s,3]);
p=rgb2gray(p);
sortp=sort(p(:));
altp=sort(sort(sortp(sortp<1000)));
p(p>altp(end))=altp(end);
imshow(p,[]);
title('选择终点');
e=ginput(1);
close;
out=uint16(zeros(abs(round(e(1)-s(1))),1));
for i=1:abs(e(1)-s(1))+1
    out(i,1)=resultI(round(s(2)),round(min(s(1),e(1)))+i-1);
end
meanG=mean(mean(resultI));
out=double(out);
out(:,2)=out/meanG;
cell_out=num2cell(out);
cell_out(1,3)={meanG};
result=[{'灰度值','标准化灰度值','平均灰度值'};cell_out];
[pathstr,name,ext] = fileparts(inputfilename);
filename=[name,'_result.xlsx'];
if exist(filename,'file')
    delete(filename);
end
xlswrite(filename,result);


