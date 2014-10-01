function [ X, opt, C ] = Commercial( A, B, lb )
%Commercial 
%

Aeq = [1, 1, 1, -1, -1, -1];
Beq = 0;

%FMin et FMax sont les fonctions pour minimiser et maxiser la fonction 
FMax = [1; 1; 1; 1; 1; 1];
FMin = -FMax;

X = linprog(FMin,A,B,Aeq,Beq,lb,[]);
opt = FMax'*X; %Transposée de F
C = A*X-B;

end

