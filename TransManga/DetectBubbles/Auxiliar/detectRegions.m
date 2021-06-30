function [ConnComp, stats] = detectRegions(BW_img)
%DETECTREGIONS Gives all the regions and its stats from BW_img
%   Detailed explanation goes here
    ConnComp = bwconncomp(BW_img);
    stats = regionprops(ConnComp, 'BoundingBox', "Circularity", "Extent", "Area","FilledArea","Image",'FilledImage', 'EulerNumber');
end

