function [BubbleFiltered] = delteTinyObjects(Bubble, minNumPixels)
%DELTETINYOBJECTS Removes very tiny objects
% Returns the image without tiny objects that may change the number of OBJ
% in the image
    minNumPixels = 10+10*0;
    BubbleFiltered = bwareaopen(Bubble, minNumPixels);
end

