function [ X, opt, C,f ] = Atelier( A, B, LB )
% on veut maximiser  la fonction objectif de l'atelier 
f = ones (6,1);
X = linprog( -f, A, B, [], [], LB, []);
opt = f'*X;
C = A*X - B;

figure(4)
str = {'A','B','C','D','E','F'};
bar(X);
title('Atelier')
set(gca, 'XTickLabel',str, 'XTick',1:numel(str));
end

