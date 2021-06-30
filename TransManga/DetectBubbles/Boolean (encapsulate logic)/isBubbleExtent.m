function [isBubbleExtent] = isBubbleExtent(extent)
%ISBUCCLEEXTENT Tells if the extent could the the one of a bubble
% *extent* is a value in [0, 1] 
% Returns true if *extent* is over minBubbleExtent.
% Returns false otherwise
    minBubbleExtent = 0.45;
    isBubbleExtent = extent > minBubbleExtent;
end
