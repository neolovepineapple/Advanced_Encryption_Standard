function [ output ] = KeyExpansion( input )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
poly=283;
m=8;

Nk=floor(length(input)/4);
Nr=10;
RC=[1,2,4,8,16,32,64,128,27,54,108];


w=input(1:Nk*4);
for(i=(Nk+1):4*(Nr+1))
    temp=w((i-1)*4-3:(i-1)*4);
    if(mod(i,Nk)==0)
        temp=temp([2,3,4,1]);
        temp=SubBytes(int32(temp));
        Rcon=[RC(i/Nk),0,0,0];
        temp=temp';
        temp=bitxor(temp,Rcon);
    elseif(Nk==8 & (mod(i,Nk)==4))
        temp=SubBytes(int32(temp));
    end
    w((i)*4-3:(i)*4)=char(bitxor(int32(w((i-Nk)*4-3:(i-Nk)*4)),int32(temp)));
end
        
       
output=w;
end

