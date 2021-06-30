function [gray] = imread2gray(imgPath)
%IM2GRAY Read an jpg or png image, and returns its grayscale image conversion
%   Detailed explanation goes here

    [folder, basePath, extension] = fileparts(imgPath);
    if extension == ".png"
        [I, map] = imread(imgPath, "BackgroundColor", 1);
        gray = ind2gray(I, map);

    else
        I = imread(imgPath);
        gray = im2gray(I);
    end
    %imshow(gray);
end

