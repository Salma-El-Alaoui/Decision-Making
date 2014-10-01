function [ X, opt, C ] = Personnel( A, B, LB )
%On veut minimiser la fonction objectif du personnel
%On veut un bénéfice minimum de 50% du bénéfice optimal
A = [A;-5.67 -11.88 -12.27 -1.03 -31.65 -27.55]; 
[Xcompt,optcompt, Ccompt]=Comptable(A,B,LB);
B =[B;Xcompt/2]

f = [ 13; 1; 11; 7; 20; 50;];
X = linprog( f, A, B, [], [], LB, []);
opt = f'*X;
C = A*X - B;

end
