function [ output ] = MixColumns( input )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
poly=283;
m=8;
if(isa(input,'gf')==0)
    input=gf(input,m,poly);
end

A=gf([2,3,1,1;1,2,3,1;1,1,2,3;3,1,1,2],m,poly);
output=A*input;
end

