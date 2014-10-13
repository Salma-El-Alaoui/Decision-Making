function [ X, opt, C, F] = Comptable( A, B, LB)
%On veut maximiser la fonction du comptable
X=ones(6,1);

F=[5.67; 11.88; 12.27; 1.03; 31.65; 27.55];

X=linprog(-F,A,B,[],[],LB,[]);

opt=F'*X;

C=A*X-B;

figure;
str = {'A','B','C','D','E','F'};
bar(X);
title('Comptable')
set(gca, 'XTickLabel',str, 'XTick',1:numel(str));

end

