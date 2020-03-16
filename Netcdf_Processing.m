%% Code for Extracting Data from Netcdf File
% Code written by Sharad Kumar Gupta, IIT Mandi, H.P., India
% Please save all your Netcdf files inside a folder and keep the MATLAB codes outside the folder.

old_dir = pwd();
get_dir = uigetdir('Please select folder');
file = getAllFiles(get_dir);
noFiles=numel(file);
actual = [];
new_dir = fullfile(pwd(),'Extracted_Data');
if ~exist(new_dir, 'dir')
    mkdir(new_dir)
end
cd(new_dir);
for fileno = 1:noFiles
    file_path = char(file(fileno));
    prec = ncread(file_path,'precipitation');   % Precipitation variable
    lat = ncread(file_path,'lat');  % Latitude
    lon = ncread(file_path,'lon');  % Longitude
    
    %% Code for visualization of data
    % Remove comments below to visualize the data.
    
%     mymap = pcolor(lon,lat,prec');
%     mymap.EdgeAlpha = 0;
%     load coastlines
%     geoshow(coastlat,coastlon);
%     Kot_Lat = 31.912411;
%     Kot_Lon = 76.890062;
%     hold on
%     plot(Kot_Lon, Kot_Lat,'r+')
%     colormap;

    %% Code for saving the data in excel file
	% See results in Extracted_Data folder
    filename = strcat(num2str(fileno),'.xlsx');
    xlswrite(filename,prec);
end
cd(old_dir)
clearvars