function [ warp_im ] = warpA( im_gray, A, out_size )
% warp_im=warpAbilinear(im, A, out_size)
% Warps (w,h,1) image im using affine (3,3) matrix A 
% producing (out_size(1),out_size(2)) output image warp_im
% with warped  = A*input, warped spanning 1..out_size
% Uses nearest neighbor mapping.
% INPUTS:
%   im : input image
%   A : transformation matrix 
%   out_size : size the output image should be
% OUTPUTS:
%   warp_im : result of warping im by A

[r,c]=size(im_gray);
%[m,n]=size(out_size);
newimg=zeros(r,c);

for i=1:r
    for j=1:c
        im_res=A*[j,i,1]';
        a1= round(im_res(1,1),0);
        a2= round(im_res(2,1),0);
        
        if(a1>0 && a1<=c && a2>0 && a2<= r)
        newimg(a2,a1)= im_gray(i,j);
      
        end
    end
end
warp_im=newimg;
end

        
        


