function [ output ] = Encryption( in,w )
%UNTITLED10 Summary of this function goes here
%   Detailed explanation goes here
m=8;
poly=283;
Nr=10;

state=int32(in);
state=(bitxor(state,int32(reshape(w(1:16),4,4))));

for(i=1:Nr-1)
    state=MixColumns(ShiftRows(SubBytes(state)));
    state=int32(reshape(gf2dec(state,m,poly),4,4));
    state=(bitxor(state,int32(reshape(w(i*16+1:i*16+16),4,4))));
end
    
state=(ShiftRows(SubBytes(state)));

state=char(bitxor(int32(state),int32(reshape(w(Nr*16+1:Nr*16+16),4,4))));
output=state(:);




end

