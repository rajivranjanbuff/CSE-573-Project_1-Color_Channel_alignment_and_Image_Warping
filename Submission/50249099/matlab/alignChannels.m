function rgbResult = alignChannels(red, green, blue)
% alignChannels - Given 3 images corresponding to different channels of a
%       color image, compute the best aligned result with minimum
%       aberrations
% Args:
%   red, green, blue - each is a matrix with H rows x W columns
%       corresponding to an H x W image
% Returns:
%   rgb_output - H x W x 3 color image output, aligned as desired

%% Write code here

%a=cat(3,blue,red,green);
%imshow(a);

ssd_least_bl=0;
counter_min_bl=0;
for i=-30:30
    blue_cirshft=circshift(blue,i);
    diff=red-blue_cirshft;
    ssd = sum(diff(:).^2);
    if(ssd_least_bl == 0)
        ssd_least_bl = ssd;
    end
    if(ssd<ssd_least_bl)
        ssd_least_bl=ssd;
        counter_min_bl=i;
    end  
end

ssd_least_gr=0;
counter_min_gr=0;
for j=-30:30
    green_cirshft=circshift(green,j);
    diff_green=red-green_cirshft;
    ssd = sum(diff_green(:).^2);
    if(ssd_least_gr == 0)
        ssd_least_gr = ssd;
    end
    if(ssd<ssd_least_gr)
        ssd_least_gr=ssd;
        counter_min_gr=j;
    end  
end

green_cirshift_new=circshift(green,counter_min_gr);
blue_cirshift_new=circshift(blue,counter_min_bl);

g=cat(3,red,green_cirshift_new,blue_cirshift_new);

%imshow(g);
rgbResult = g;
end

