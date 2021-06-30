function [isBubbleNumObjects] = isBubbleNumObjectsInside(numObjectsInside)
%ISBUBBLENUMOBJECTSINSIDE Tells if the number of objects could be the ones
%of a Bubble
% *numObjectsInside* is a value in [0, Inf] Tells the number of objects inside a figure 
% Returns true if *numObjectsInside* is between the maxBubbleObjects and minBubbleObjects.
% Returns false otherwise
    maxBubbleObjects = 80;
    minBubbleObjects = 5;%5;
    isBubbleNumObjects = numObjectsInside >= minBubbleObjects && numObjectsInside <= maxBubbleObjects;
end
