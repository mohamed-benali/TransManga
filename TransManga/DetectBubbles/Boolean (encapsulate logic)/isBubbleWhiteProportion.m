function [isBubbleWhiteProportion] = isBubbleWhiteProportion(proportionOfWhite)
%ISBUBBLEWHITEPROPORTION Tells if white proportion fits the one of a Bubble
% *proportionOfWhite* is a value in [0, 1]  
% Returns true if *proportionOfWhite* is between over minBubbleWhiteRatio.
% Returns false otherwise
    minBubbleWhiteRatio = 0.7;
    isBubbleWhiteProportion = proportionOfWhite > minBubbleWhiteRatio;
end

