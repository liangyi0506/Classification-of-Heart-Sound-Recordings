function e = getEnergy(signal)
% path: the path of audio sample
% E: the short time energy of each frame
framelength = 240;                                          % set length of window  
framenumber = fix(length(signal)/framelength);   
for i = 1:framenumber                                     % enframe   
    framesignal = signal((i-1)*framelength+1:i*framelength);
    E(i) = 0;                                                 
    for j = 1:framelength                                   % calcuate energy of each frame   
        E(i) = E(i)+framesignal(j)^2;    
    end    
end 

s = size(E);
s = s(1);
e = 0;
for j = 1:s
    e = e+E(i);
end
e = e/s;
end
