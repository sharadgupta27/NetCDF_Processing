%% Demo file for illustration of main code
% Code written by Sharad Kumar Gupta, IIT Mandi, H.P., India

old_dir = pwd();
get_dir = uigetdir('Please select demo_data folder');
file = getAllFiles(get_dir);
noFiles = numel(file);
actual = [];
new_dir = fullfile(pwd(),'demo_extracted_data');
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
  
    mymap = pcolor(lon,lat,prec');
    mymap.EdgeAlpha = 0;
    load coastlines
    geoshow(coastlat,coastlon);
    colormap;

    %% Code for saving the data in excel file
	% See results in demo_extracted_data folder
    filename = strcat(num2str(fileno),'.xlsx');
    xlswrite(filename,prec);
end
cd(old_dir)
clearvars