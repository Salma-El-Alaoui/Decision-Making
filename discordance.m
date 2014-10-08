function [ mat_discordance ] = discordance( jugement )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

[L,C] = size(jugement);
mat_discordance = zeros(L);
for i=1:L
    for k=1:L
        for j=1:C
            if ((jugement(i,j) < jugement(k,j)) && (mat_discordance(i,k)< (jugement(k,j) - jugement(i,j)) ) )
                
                mat_discordance(i,k) = jugement(k,j) - jugement(i,j);
            end
        end
    end
end
end

