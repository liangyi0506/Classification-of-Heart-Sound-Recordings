function e = getZCR(signal)

framelength = 240;                                                % the length of each frame
framenumber = fix(length(signal)/framelength);  
for i = 1:framenumber                                            % enframe 
    framesignal = signal((i-1)*framelength+1:i*framelength);      % take one frame signal 
    zcr(i) = 0;  
    for j = 2:framelength-1                                      % calcuate the times of zero-crossing 
       	 zcr(i) = zcr(i) + abs(sign(framesignal(j))-sign(framesignal(j-1)));
    end
end  
zcr = zcr/(2*length(signal));                                         % calcuate the ratio 

s = size(zcr);
s = s(1);
e = 0;
for j = 1:s
    e = e+zcr(i);
end
e = e/s;
end

