function [BW_Result] = predictBubbles(BW_img)
%DETECTBUBBLES Returns a BW image with the bubbles detected
    ConnComp = bwconncomp(BW_img);
    stats = regionprops(ConnComp, 'BoundingBox', "Circularity", "Extent");

    global CC_stored
    global stats_stored
    CC_stored = ConnComp;
    stats_stored = stats;
    
    global GLOBAL_VARS
    
    % USING cascade to predict, sol filter by cheap descriptors first and
    % then filter by expensive descriptors
    
    BW_Result = BW_img;
    for i=1:ConnComp.NumObjects % Filter objects by cheap descriptors
        stat = stats(i);
        [x_ini, y_ini, height, width] = getBoundingBox(stat.BoundingBox);

        bubble_detectada = false;
        relation = width/height;
        
        if not(isBubbleRatio(relation) && isBubbleCircularity(stat.Circularity)  ...
             && isBubbleExtent(stat.Extent))
            
            BW_Result(ConnComp.PixelIdxList{i}) = 0; % Puts black the pixels of the object
        end
    end
        
    ConnCompFiltered = bwconncomp(BW_Result);
    statsFiltered = regionprops(ConnCompFiltered, "Area","FilledArea","Image",'FilledImage');
    
    for i=1:ConnCompFiltered.NumObjects   %Filter remaing objects by xpensive descriptors
        stat = statsFiltered(i);

        proportionOfWhite = stat.Area/stat.FilledArea;
        isBubbleWhiteProportion(proportionOfWhite);

        if not(isBubbleWhiteProportion(proportionOfWhite))
            BW_Result(ConnCompFiltered.PixelIdxList{i}) = 0; % Puts black the pixels of the object
        else
            Bubble = stat.Image;
            %Bubble = medfilt2(Bubble, [3, 3]); % Clean Bubble so it removes very small objects

            minNumPixels = 10;
            BubbleFiltered = delteTinyObjects(not(Bubble), minNumPixels);
            %Bubble = medfilt2(Bubble, [9, 9]); % Clean Bubble so it removes very small objects
            numObjectsInFigure = getNumObjectsInFigure(not(stat.FilledImage), BubbleFiltered);

            %numObjectsInFigure = stat.EulerNumber*(-1)+1;

            % TODO: Detect text and consider that is a bubble if atleast 50%
            % of objects are words.

            if isBubbleNumObjectsInside(numObjectsInFigure) 
                %BW_Result(ConnComp.PixelIdxList{i}) = 0; % Puts black the pixels of the object
                if GLOBAL_VARS.OUTPUT_VERBOSE == VERBOSE.FULL
                    figure
                    imshow(BubbleFiltered);
                    title("Bubble " + i);
                    fprintf("Num Objects in figure: " + numObjectsInFigure);   
                end
            else
                BW_Result(ConnCompFiltered.PixelIdxList{i}) = 0; % Puts black the pixels of the object
            end
            
        end
           
    end
        
    
    if GLOBAL_VARS.OUTPUT_VERBOSE == VERBOSE.FULL
        figure
        imshow(BW_Result);
        title("BW image with the predicted bubbles");
    end

end

