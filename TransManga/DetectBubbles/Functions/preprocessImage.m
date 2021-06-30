function [BW_img] = preprocessImage(I)
%PREPROCESSIMAGE Processes image from RGB/grayscale to BW plus filtered.
%   Detailed explanation goes here
     I = im2gray(I);
     
% 
%     M = colfilt(I, [5 5],'sliding', @mean);
%     BW_img = I > M - 3;
%     BW_img = medfilt2(BW_img,[3 3]);
%     
% 
%     BW_img = imerode(BW_img, strel('disk', 1)); %with this erode (make bigger the black) we take
%     %even those bubbles that are not fully closed, but we are introducing a
%     %bit of risk of joining letters and also joinig these letters with the
%     %outside, giving sometimes a bubble broken in half.
%     
%     BW_img = medfilt2(BW_img);
    
    global GLOBAL_VARS
    
    BW_I = I > 240;
    %BW_img = medfilt2(BW_I, [3 3]);
    %BW_img = medfilt2(BW_I, [5 5]);

    minNumPixels = 10;
    BW_I = delteTinyObjects(BW_I, minNumPixels);
    %BW_I = delteTinyObjects(not(BW_I));
    %BW_I = delteTinyObjects(not(BW_I));
    
    BW_img = BW_I;
    if GLOBAL_VARS.OUTPUT_VERBOSE == VERBOSE.FULL
        figure
        imshow(BW_I);
        title("BW image after Binarization");
        
         figure
         imshow(BW_img);
         title("BW image after Binarization & medfilt2");
    end
end

