function [ X, opt, C ] = Atelier( A, B, LB )
%on veut maximiser  la fonction objectif de l'atelier 
f = ones (6,1);
X = linprog( -f, A, B, [], [], LB, []);
opt = f'*X;
C = A*X - B;

end

