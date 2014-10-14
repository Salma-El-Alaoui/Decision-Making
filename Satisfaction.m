function [VS, PM,Y] = Satisfaction( MG,X,fcompta , fatel, fstock,fpers,fm3,fm5 )
%vecteur qui represente le pourcentage de satisfaction de l'objectif de
%chaque responsable.
%X est la solution choisie
%MG est la matrice de gain

VS = zeros(5,1);
%Point de mire
PM = zeros(5,1);
for i=1:5
    PM(i)= MG(i,i);
end 
ecart=abs((X(1) + X(2) + X(3)) - (X(4) + X(5) + X(6)));
echelle = X(1) + X(2) + X(3) + X(4) + X(5) + X(6);
Y=[ fcompta'*X; fatel'*X; fstock'*X;ecart;fpers'*X; fm3'*X; fm5'*X];
for i=1:3
VS(i)= max(0,(1-(abs(PM(i)-Y(i))/PM(i))));
end
VS(4)=max(0, 1-(ecart/echelle));
VS(5)= max(0,(1-(abs(Y(5)-PM(5))/PM(5))));
end

