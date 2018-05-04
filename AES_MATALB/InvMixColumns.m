function [ output ] = InvMixColumns( input )
%UNTITLED9 Summary of this function goes here
%   Detailed explanation goes here


poly=283;
m=8;

if(isa(input,'gf')==0)
    input=gf(input,m,poly);
end

A=gf([14,11,13,9;9,14,11,13;13,9,14,11;11,13,9,14],m,poly);
output=A*input;


end

