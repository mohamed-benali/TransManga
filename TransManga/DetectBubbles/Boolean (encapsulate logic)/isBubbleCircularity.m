function [fitsInBubbleCircularity] = isBubbleCircularity(circularity)
%ISBUBBLECIRCULARITY Tells if the circularity could the the one of a bubble
% *circularity* is a value in [0, 1] 
% Returns true if *circularity* is over minBubbleCircularity.
% Returns false otherwise
    minBubbleCircularity = 0.35;
    fitsInBubbleCircularity = circularity > minBubbleCircularity;
end

