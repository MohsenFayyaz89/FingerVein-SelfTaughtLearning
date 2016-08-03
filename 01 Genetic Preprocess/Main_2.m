clear all; clc;

load('finalChromosome.mat');
load('imgPack.mat');

for i=1:size(imgPack,3)
    img=imgPack(:,:,i)*255;
    hstg=GetHist(img);
    for j=1:size(finalChr,2)
        if size(finalChr{j},1)==size(hstg,1)
            imgPack(:,:,i)=RemapHist(img,hstg,finalChr{j})/255;
        end
    end
end

save('imgPackNew','imgPack');
