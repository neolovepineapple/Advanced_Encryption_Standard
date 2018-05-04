function [ output ] = Decryption( in,w )
%UNTITLED13 Summary of this function goes here
%   Detailed explanation goes here

m=8;
poly=283;
Nr=10;

state=int32(in);
state=(bitxor(state,int32(reshape(w(Nr*16+1:Nr*16+16),4,4))));

for(i=Nr-1:-1:1)
    state=int32(InvSubBytes(InvShiftRow(state)));
    
    state=(bitxor(state,int32(reshape(w(i*16+1:i*16+16),4,4))));
    state=InvMixColumns(state);
    state=reshape(gf2dec(state,m,poly),4,4);
end
state=int32(InvSubBytes(InvShiftRow(state)));

state=char(bitxor(state,int32(reshape(w(1:16),4,4))));
output=state(:);

    



end

