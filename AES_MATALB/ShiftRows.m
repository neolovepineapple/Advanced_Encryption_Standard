function [ output ] = ShiftRows( input )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
idx=mod([0:3]+[0:3]',4)+1;
output=input;
output(2,:)=input(2,idx(2,:));
output(3,:)=input(3,idx(3,:));
output(4,:)=input(4,idx(4,:));
end

