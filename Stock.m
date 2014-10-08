function [ X, opt, C, f ] = Stock( A, B, LB )
%On veut minimiser la fonction objectif des stocks
% On rajoute une contrainte pour assurer un bénéfice minimum 

[Xcompt, OptCompt, Ccompt]= Comptable(A,B,LB);

rate = 2;
A = [A; -5.67 -11.88 -12.27 -1.03 -31.65 -27.55];
B = [B; -OptCompt/rate];

f = [ 5; 5; 6; 10; 5; 4;];
X = linprog( f, A, B, [], [], LB, []);
opt = f'*X;
C = A*X - B;

figure(2)
str = {'A','B','C','D','E','F'};
bar(X);
title('Stock')
set(gca, 'XTickLabel',str, 'XTick',1:numel(str));


end

