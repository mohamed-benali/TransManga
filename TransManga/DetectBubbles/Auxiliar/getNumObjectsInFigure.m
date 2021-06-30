function [numObjectsInFigure] = getNumObjectsInFigure(FilledImage, Image)
%GETNUMOBJECTSINFIGURE Returns the number of objects inside Image 
% The parameters FilledImage & Image are 
% *FilledImage* is the Ima
%   
    CC2 = bwconncomp(FilledImage);
    numObjectesBackground = CC2.NumObjects; 

    CC2 = bwconncomp(Image);
    numObjectsFigureAndBackground = CC2.NumObjects;
    
    numObjectsInFigure = numObjectsFigureAndBackground - numObjectesBackground;
    
    % use EulerNumber from regionprops or bweuler(BW) (returns scalar) latter
end

