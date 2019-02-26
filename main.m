% This code brings original images, takes grayscale pallette, save
% Ncopies of each image. It is used for small amount of pics to reconstruct 3D
% model
clc
clear all
close all
%% Variables block
err_tooLongNameException = 'Name of pictures doesn''t correspond to the template "1-N.png".';
err_charactersInsideString = 'Your picture name contains characters. Expect only numbers.';
%% Load template metadata for all files
load('metadata_origin.mat');
%% Choose a directory for source processing all pics inside to .dcm format with Ncopies
cd ./pics
picsFolder = pwd;
filenames = dir(fullfile(picsFolder, '*.png')); % read all images from folder
total_images = numel(filenames);
Ncopies = 5;

cd ..
isFolderExist;
cd ./output

for n = 1:total_images
    f = fullfile(picsFolder, filenames(n).name);
    selectedImage = rgb2gray(imread(f));
    
    % name domain operations
    currentFileName = filenames(n).name;
    fileNumber = currentFileName(1:end-4);
    if (isnan(str2double(fileNumber)))
        error(err_charactersInsideString);
    else 
        int_fileNumber = str2num(fileNumber);
    end
    extension = '.dcm';
    
    subcounter = 0;
    for number_of_copy = 1:Ncopies
        subcounter = subcounter + 1;
        sliceNumber = ((int_fileNumber - 1)*Ncopies) + subcounter;
        
        % metadata changing
        metadata = metadata_origin;
        metadata.InstanceNumber = sliceNumber;
        metadata.SliceThickness = 0.5;
        metadata.SliceLocation = metadata.SliceLocation + (sliceNumber * metadata.SliceThickness);
        metadata.RescaleIntercept = -50; % stands for brightness, scale of Hounsfield units
        metadata.RescaleSlope = 1; % stands for linear transformation of borders
        metadata.ImagePositionPatient(3,1) = metadata.SliceLocation;
        
        outputfilename = strcat(num2str(sliceNumber), extension);
        dicomwrite(selectedImage, outputfilename, metadata);
    end
end

function isFolderExist
    if ~exist('output', 'dir')
       mkdir('output')
    end
end