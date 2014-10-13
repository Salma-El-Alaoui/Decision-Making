function [ jugement_pondere ] = changement_echelle( jugement )
% Applique le changement d'echelle à la matrice de jugements en fonction
% des poids définis.
%  

jugement_pondere = zeros(size(jugement));
[L,C] = size(jugement);
a1=0;
b1=10;
a2=0;
b2=10;
for i=1:C
    switch i
        case 2 %Critère g2 de poids moyen
            a2 = 3;
            b2 = 7;
        case 3 %Critère g3 de poids moyen
            a2 = 2;
            b2 = 8;
        case 4 %Critère g4 de poids faible
            a2 = 3;
            b2 = 7;
    end
    for j = 1:L
        jugement_pondere(j,i) = jugement(j,i)*(b2-a2)/(b1-a1) + (b1*a2-a1*b2)/(b1-a1);
    end
end



end

