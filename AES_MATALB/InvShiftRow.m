function [ output ] = InvShiftRow(  input)
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here
output=input;
output(2,:)=input(2,[4 1 2 3]);
output(3,:)=input(3,[3 4 1 2]);
output(4,:)=input(4,[2 3 4 1]);

end

