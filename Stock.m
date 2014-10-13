function [ X, opt, C, f ] = Stock( A, B, LB )
%On veut minimiser la fonction objectif des stocks
% On rajoute une contrainte pour assurer un bénéfice minimum 

[Xcompt, OptCompt, Ccompt]= Comptable(A,B,LB);

rate = 2;
A = [A; -5.67 -11.88 -12.27 -1.03 -31.65 -27.55];
B1 = [B; -OptCompt/rate];

f = [ 5; 5; 6; 10; 5; 4;];
X = linprog( f, A, B1, [], [], LB, []);
opt = f'*X;
C = A*X - B1;

R = zeros(100);
for i=1:100
    
    B2 = [B; -(i/100)*OptCompt]; 
    X1 = linprog( f, A, B2, [], [], LB, []);
    R(i) = f'*X1;
    
end
figure;
xlabel('pourcentage de benefice minimal');
ylabel('quantité de produits et de matières premières dans le stock');;
hold on
plot(R)
hold off;

figure;
str = {'A','B','C','D','E','F'};
bar(X);
title('Stock')
set(gca, 'XTickLabel',str, 'XTick',1:numel(str));


end

