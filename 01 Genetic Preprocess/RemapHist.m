function [ img ] = RemapHist( img, hstg, gen )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
tmp=reshape(img,3200,1);
for i=1:size(hstg,1)
    idx= tmp==hstg(i);
    tmp(idx)=gen(i);
end
img=reshape(tmp,40,80);

end

