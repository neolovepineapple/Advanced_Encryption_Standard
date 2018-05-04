function [ output ] = AES_Decryption( ciphertext,cipher )
%UNTITLED12 Summary of this function goes here
%   Detailed explanation goes here

decryption=[];
cipher=KeyExpansion(cipher);
hwait=waitbar(0,'Decryption>>>>>>>>');
tneed=length(ciphertext)/16;
tic
for(i=0:tneed-1)
    waitbar((i+1)/tneed,hwait,[num2str(round((i+1)/(tneed)*100,2)),'% Time Left: ',num2str((toc/i)*(tneed-i)),' seconds']);
    decryption=[decryption,Decryption(reshape(ciphertext(i*16+1:i*16+16),4,4),cipher)];
end

output=decryption(:)';



end

