function [ mat_concordance ] = concordance( jugement, poids)
%   poids : vecteur ligne des poids affectes a chaque critere [1,1,1,1] ou [5,2,3,2]

[L,C] = size(jugement);
mat_concordance = zeros(L);

for i=1:L
    for k=1:L
        for j=1:C
            if (jugement(i,j) >= jugement(k,j))
                mat_concordance(i,k) = mat_concordance(i,k) + poids(1,j); 
            end
        end
    end
end
end

