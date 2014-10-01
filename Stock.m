function [ X, opt, C ] = Stock( A, B, LB )
%On veut minimiser la fonction objectif des stocks
f = [ 5; 5; 6; 10; 5; 4;];
X = linprog( f, A, B, [], [], LB, []);
opt = f'*X;
C = A*X - B;

end

