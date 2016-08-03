function [  ] = makePatch(  )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
patchDim   = 10;
numPatches = 378000;
epsilon = 0.1;
load('imgPack.mat');
patches=zeros(100,numPatches);
k=1;
for i=1:3600
    for x=1:5:31
        for y=1:5:71
            window=imgPack(x:x+patchDim-1,y:y+patchDim-1,i);
            patches(1:100,k)=reshape(window(:,:,1)',100,1);
            k=k+1;
        end
    end
%     for j=1:25
%         pos=randi(50-patchDim+1,2,1);
%         window=unlabeledImages(pos(1):pos(1)+patchDim-1,pos(2):pos(2)+patchDim-1,:,i);
%         patches(1:100,k)=reshape(window(:,:,1)',100,1);
%         patches(101:200,k)=reshape(window(:,:,2)',100,1);
%         k=k+1;
%     end
end

meanPatch = mean(patches, 2);  
patches = bsxfun(@minus, patches, meanPatch);
% Apply ZCA whitening
sigma = patches * patches' / numPatches;
[u, s, v] = svd(sigma);
ZCAWhite = u * diag(1 ./ sqrt(diag(s) + epsilon)) * u';
patches = ZCAWhite * patches;
save('Final Datasets\\Patches_size100_378000.mat', 'patches','-v7.3');
save('02 Feature Extraction\\DataFeatures\\Mean_ZCA.mat', 'ZCAWhite', 'meanPatch');

end

