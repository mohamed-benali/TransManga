function [imageBubbles] = detectBubbles(Img)
%DETECTBUBBLES Detects the text bubbles of the given image and returns the
%bubbles
% Parameter *image* is an image in rgb or grayscale of a manga.
    BW_img = preprocessImage(Img);
    BW_Result= predictBubbles(BW_img);
    imageBubblesBW = postprocessImage(BW_Result);
    
    Igray = im2gray(Img);
    filledBubblesBW = imfill(imageBubblesBW, 'holes');
    %imageBubbles = Igray .* filledBubblesBW; %use FilledImage of RegionProps for more eficiency
    imageBubbles = bsxfun(@times, Igray, cast(filledBubblesBW, 'like', Igray));
end

