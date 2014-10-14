function [ X,Xm3, Xm5, opt,opt3, opt5,C,Cm3, Cm5 ,ftotal, fm3, fm5 ] = Personnel( A, B, LB )
%On veut minimiser la fonction objectif du personnel
%On veut un benefice minimum de 50% du benefice optimal

[Xcompt,optcompt, Ccompt]=Comptable(A,B,LB);

A = [A;-5.67 -11.88 -12.27 -1.03 -31.65 -27.55]; 
B1 =[B;-optcompt/2];
%somme des temps des machines
ftotal = [ 13; 1; 11; 7; 20; 50;];
%fm3 et fm5 correspondent aux fonctions a minimiser pour les machines 3 et 5
fm3=[ 8; 1; 11; 0; 10; 25;];
fm5=[ 5;0; 0; 7; 10; 25;];

X = linprog( ftotal, A, B1, [], [], LB, []);
Xm3 = linprog( fm3, A, B1, [], [], LB, []);
Xm5 = linprog( fm5, A, B1, [], [], LB, []);

opt = ftotal'*X;
opt3 = fm3'*Xm3;
opt5 = fm5'*Xm5;

C = A*X - B1;
Cm3 = A*Xm3 - B1;
Cm5 = A*Xm5 - B1;

R = zeros(100);
R3 = zeros(100);
R5 = zeros(100);
for i=1:100
    
    B2 = [B; -(i/100)*optcompt];
    X2=linprog( ftotal, A, B2, [], [], LB, []) ;
    R(i) = ftotal'*X2;
    R3(i) = fm3'*X2;
    R5(i) = fm5'*X2;
    
end

figure;

subplot(3,1,1), 
plot(R,'r')
title('machines 3 et 5');
subplot(3,1,2),
plot(R3,'g')
title('machine 3');
ylabel('temps dutisation des machines en mn par semaine');
subplot(3,1,3),
plot(R5,'b')
title('machine 5');
xlabel('pourcentage de benefice minimal');
hold off


figure(5)
str = {'A','B','C','D','E','F'};
bar(X);
title('Personnel')
set(gca, 'XTickLabel',str, 'XTick',1:numel(str));
end
