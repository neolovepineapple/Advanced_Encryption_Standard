function [ output ] = AES_Encryption( text,cipher  )
%UNTITLED11 Summary of this function goes here
%   Detailed explanation goes here
text=[text,repmat(' ',1,(16-mod(length(text),16)))];
encryption=[];
cipher=KeyExpansion(cipher);
hwait=waitbar(0,'Encryption>>>>>>>>');
tneed=length(text)/16;
tic
for(i=0:tneed-1)
    waitbar((i+1)/(length(text)/16),hwait,[num2str(round((i+1)/(tneed)*100,2)),'% Time Left: ',num2str((toc/i)*(tneed-i)),' seconds']);
    encryption=[encryption,Encryption(reshape(text(i*16+1:i*16+16),4,4),cipher)];
end

output=encryption(:)';

end

