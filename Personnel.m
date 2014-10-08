function [ X,Xm3, Xm5, opt,opt3, opt5,C,Cm3, Cm5 ,ftotal, fm3, fm5 ] = Personnel( A, B, LB )
%On veut minimiser la fonction objectif du personnel
%On veut un bénéfice minimum de 50% du bénéfice optimal

[Xcompt,optcompt, Ccompt]=Comptable(A,B,LB);

A = [A;-5.67 -11.88 -12.27 -1.03 -31.65 -27.55]; 
B =[B;-optcompt/2];
%somme des temps des 
ftotal = [ 13; 1; 11; 7; 20; 50;];
%fm3 et fm5 correspondent aux fonctions à minimiser pour les machines 3 et 5
fm3=[ 8; 1; 11; 0; 10; 25;];
fm5=[ 5;0; 0; 7; 10; 25;];

X = linprog( ftotal, A, B, [], [], LB, []);
Xm3 = linprog( fm3, A, B, [], [], LB, []);
Xm5 = linprog( fm5, A, B, [], [], LB, []);

opt = ftotal'*X;
opt3 = fm3'*Xm3;
opt5 = fm5'*Xm5;

C = A*X - B;
Cm3 = A*Xm3 - B;
Cm5 = A*Xm5 - B;

figure(5)
str = {'A','B','C','D','E','F'};
bar(X);
title('Personnel')
set(gca, 'XTickLabel',str, 'XTick',1:numel(str));
    
    
    


end
