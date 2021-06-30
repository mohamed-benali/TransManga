classdef DBCtrl
    %DBCTRL A class to encapsulate the access to persisted files
    %   Detailed explanation goes here
    
    properties
        FolderPath; %make sure folder path ends WITHOUT a '\' or '/'
    end
    
    methods
        function self = DBCtrl(varargin)
            %DBCTRL Construct an instance of this class.
            %   The only parameter is the folderPath were to get the images.
            % if the paarameter is not given, it takes a default parameter
            if nargin >= 1
                self.FolderPath = varargin{1};
            else % TODO: Use GLOBAL VARIABLE to get the path
                self.FolderPath = 'C:\Users\Skill\MATLAB\TransManga\TransManga\Pictures';
            end
        end
       
        function [imgPathReadList, imgPathWriteList] = getFileNamesList(obj, varargin)
            %METHOD1 Summary of this method goes here
             %   The only parameter is the folderPath were to get the images.
            % if the paarameter is not given, it takes the FolderPath property
            
            path = obj.FolderPath; % Get folderPath
            if nargin >= 2 % The first argument is the object (self in python or this in java, c++), so the path index is 2.
                path = varargin{2};
            end
            
            
            if ~isfolder(path)
              errorMessage = sprintf('Error: The following folder does not exist:\n%s', path);
              uiwait(warndlg(errorMessage));
              return;
            end

            
            [folder, basePath, extension] = fileparts(path);
            % basePath = 'C:\Users\Skill\MATLAB\TransManga\TransManga';
            
            files = dir(path); % Get a list of all files and folders in this folder.
            dirFlags = [files.isdir]; % Get a logical vector that tells which is a directory.
            subFolders = files(dirFlags); % Extract only those that are directories.
            subFolders = subFolders(arrayfun(@(x) ~strcmp(x.name(1),'.'), subFolders)); % Remove dirs '.' and '..'
            
            imgPathReadList = [];
            imgPathWriteList = [];
            for i = 1 : length(subFolders) % Foreach subfolder
                %fprintf('Sub folder #%d = %s\n', k, subFolders(k).name);
                subFolderName = subFolders(i).name;
                folderPath = fullfile(path, subFolderName);

                fileJPGPattern = fullfile(folderPath, '*.jpg');
                filePNGPattern = fullfile(folderPath, '*.png');
                imgFiles = [dir(fileJPGPattern); dir(filePNGPattern)];
                size = length(imgFiles);

                
                for j = 1:size
                  baseFileName = imgFiles(j).name;
                  % Create absolute paths for each image
                  pathRead = fullfile(path, subFolderName, baseFileName);
                  
                  [f, filename, extensionn] = fileparts(baseFileName);
                  pathWrite = fullfile(basePath, "output", subFolderName,filename+"_bubbles"+ extensionn);
                  
                  imgPathReadList{i,j} = pathRead;
                  imgPathWriteList{i,j} = pathWrite;
                end
            
            end
            
            
            
            
        end
    end
end

