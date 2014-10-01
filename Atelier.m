function [ X ] = Atelier( A, B, LB )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
f = ones (6, 1);
X = linprog( f, A, B, [], [], LB, []);

end

