function [ mat_seuillage ] = seuillage_electre( s,v, mat_jugement )

mat_seuillage = zeros (size(mat_jugement));
mat_concordance = concordance(mat_jugement);
mat_discordance = discordance(mat_jugement);

[L,C] = size(mat_concordance);
for i=1:L
    for j=1:C
        if((mat_concordance(i,j) >= s) && (mat_discordance(i,j)<=v))
            mat_seuillage(i,j) = 1;
        end
    end
end
end

