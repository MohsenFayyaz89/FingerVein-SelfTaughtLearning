
for hidden=125:125:500
    for i=1:2:7
        TrainFeatures = ConvolutionPooling( i, hidden, 'imgPack.mat' );
        save(sprintf('03 Convolution&Pooling\\TrainFeatures\\TrainFeatures_H%d_I%d.mat',hidden,i*100), 'TrainFeatures');
    end
end
