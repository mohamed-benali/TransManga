function [fitsInBubbleRatio] = isBubbleRatio(ratio)
%UNTITLED Tells true/false depending if the parameter *ratio* could be the ratio of a bubble
% *ratio* is a value in (0, Inf)  
% Returns true if *ratio* is between the maxBubbleRatio and minBubbleRatio.
% Returns false otherwise
    maxBubbleRatio = 1.1;
    minBubbleRatio = 1/3;
    fitsInBubbleRatio = ratio > minBubbleRatio && ratio < maxBubbleRatio;
end

