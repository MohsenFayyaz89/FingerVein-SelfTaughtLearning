makePatch();

for hidden=125:125:500
    for i=1:2:7
        theta = initializeParameters(hidden, 100);
        opt = linearDecoder( hidden, i, theta );
    end
end
