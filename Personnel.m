function [ X, opt, C,f ] = Personnel( A, B, LB )
%On veut minimiser la fonction objectif du personnel
%On veut un bénéfice minimum de 50% du bénéfice optimal

[Xcompt,optcompt, Ccompt]=Comptable(A,B,LB);

A = [A;-5.67 -11.88 -12.27 -1.03 -31.65 -27.55]; 
B =[B;-optcompt/2];

f = [ 13; 1; 11; 7; 20; 50;];
X = linprog( f, A, B, [], [], LB, []);
opt = f'*X;
C = A*X - B;


figure(5)
str = {'A','B','C','D','E','F'};
bar(X);
title('Personnel')
set(gca, 'XTickLabel',str, 'XTick',1:numel(str));
    
    
    


end
