function [ X, opt, C ] = Personnel( A, B, LB )
%On veut minimiser la fonction objectif du personnel
f = [ 13; 1; 11; 7; 20; 50;];
X = linprog( f, A, B, [], [], LB, []);
opt = f'*X;
C = A*X - B;

end
