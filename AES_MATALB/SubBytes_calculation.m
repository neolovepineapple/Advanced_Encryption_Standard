function [output]=SubBytes_calculation(input)
flag=0;
if(sum(size(input)==[4,4])==2)
    flag=1;
    input=input(:);
end
n=length(input);
poly=283;
m=8;
zeroidx=find(input==gf(0,m,poly));
input(zeroidx)=gf(1,m,poly);
inverse=gf(1,m,poly)./input;
inverse(zeroidx)=gf(0,m,poly);
binnum=dec2bin(gf2dec(inverse,m,poly),8);
binnum=str2num(binnum(:));
binnum=reshape(binnum,n,8)';
binnum=binnum(8:-1:1,:);
A=[1 0 0 0 1 1 1 1;
    1 1 0 0 0 1 1 1;
    1 1 1 0 0 0 1 1;
    1 1 1 1 0 0 0 1;
    1 1 1 1 1 0 0 0;
    0 1 1 1 1 1 0 0;
    0 0 1 1 1 1 1 0;
    0 0 0 1 1 1 1 1];
proj=mod(A*binnum+repmat([1 1 0 0 0 1 1 0]',1,n),2);
output=gf(2.^[0:7]*proj,m,poly);


if(flag)
    output=reshape(output,4,4);
end


end