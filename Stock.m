function [ X, opt, C ] = Stock( A, B, LB )
%On veut minimiser la fonction objectif des stocks
% On rajoute une contrainte pour assurer un bénéfice minimum 
A = [A; -5.67 -11.88 -12.27 -1.03 -31.65 -27.55];
[Xcompt, OptCompt, Ccompt]= Comptable(A,B,LB);
B = [B; OptCompt/2];
f = [ 5; 5; 6; 10; 5; 4;];
X = linprog( f, A, B, [], [], LB, []);
opt = f'*X;
C = A*X - B;

end

