function [ X, opt, C ] = Comptable( A, B, LB)

X=ones(6,1);

F=[-5.67; -11.88; -12.27; -1.03; -31.65; -27.55];

X=linprog(F,A,B,[],[],LB,[]);

opt=F'*X;

C=A*X-B;

end

