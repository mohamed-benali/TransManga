function [processedImage] = postprocessImage(BW_Result)
%POSTPROCESSIMAGE Post Processes (cleans) the result of the bubbles predict of the
%model
%   Detailed explanation goes here
    %BW_Result_dilate = imdilate(BW_Result, strel('disk', 1));
    
    % Quiza modificar el imfill y imopen por deleteTinyObjects con otro
    % minimo numero de pixeles
    
    processedImage = delteTinyObjects(BW_Result, 400);
    
    %filledBW_Result=imfill(BW_Result, 'holes');
    %processedImage = imopen(filledBW_Result, strel('disk', 19)); 
    
    % TODO? QUiza reconstruir la figura exactamente como era, a priori no
    % tiene impacto
    
    global GLOBAL_VARS
    if GLOBAL_VARS.OUTPUT_VERBOSE == VERBOSE.FULL
        %figure
        %imshow(filledBW_Result);
        %title("BW After Filling holes");
        
        figure
        imshow(processedImage);
        title("BW After remove small objects with an opening");
    end
    
end

