function [ output ] = InvSubBytes_calculation( input )

%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
flag=0;
if(sum(size(input)==[4,4])==2)
    flag=1;
    input=input(:);
end
n=length(input);
poly=283;
m=8;

binnum=dec2bin(gf2dec(input,m,poly),8);
binnum=str2num(binnum(:));
binnum=reshape(binnum,n,8)';
binnum=binnum(8:-1:1,:);


A=[0 0 1 0 0 1 0 1;
    1 0 0 1 0 0 1 0;
    0 1 0 0 1 0 0 1;
    1 0 1 0 0 1 0 0;
    0 1 0 1 0 0 1 0;
    0 0 1 0 1 0 0 1;
    1 0 0 1 0 1 0 0;
    0 1 0 0 1 0 1 0];

proj=mod(A*binnum+repmat([1 0 1 0 0 0 0 0]',1,n),2);
gfn=gf(2.^[0:7]*proj,m,poly);

zeroidx=find(gfn==gf(0,m,poly));
gfn(zeroidx)=gf(1,m,poly);
output=gf(1,m,poly)./gfn;
output(zeroidx)=gf(0,m,poly);
if(flag)
    output=reshape(output,4,4);
end


end

