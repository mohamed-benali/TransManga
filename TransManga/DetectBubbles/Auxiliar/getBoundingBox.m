function [x_ini, y_ini, height, width] = getBoundingBox(bounding_box)
%GETBOUNDINGBOX Summary of this function goes here
%   Encapsulate the getters so its more concise
    x_ini = floor(bounding_box(1));
    y_ini = floor(bounding_box(2));
    height = bounding_box(4);
    width = bounding_box(3);   
end
