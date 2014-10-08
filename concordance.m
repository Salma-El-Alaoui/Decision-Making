function [ mat_concordance ] = concordance( jugement)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

[L,C] = size(jugement);
mat_concordance = zeros(L);

for i=1:L
    for k=1:L
        for j=1:C
            if (jugement(i,j) >= jugement(k,j))
                mat_concordance(i,k) = mat_concordance(i,k) +1;
            end
        end
    end
end


end

