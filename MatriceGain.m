function [ MG ] = MatriceGain( Xcompta, Xatel, Xstock, Xcom, Xpersonnel, Xm3, Xm5,fcompta , fatel, fstock,fpersonnel, fm3, fm5 )

%on remplace le vecteur du commercial par l'écart entre la production de
%a+b+bc et d+e+f
ecartCompta = abs((Xcompta(1) + Xcompta(2)+Xcompta(3))- (Xcompta(4) + Xcompta(5)+Xcompta(6)));
ecartAtel = abs((Xatel(1) + Xatel(2)+Xatel(3))- (Xatel(4) + Xatel(5)+Xatel(6)));
ecartStock = abs((Xstock(1) + Xstock(2)+Xstock(3))- (Xstock(4) + Xstock(5)+Xstock(6)));
ecartCom = abs((Xcom(1) + Xcom(2)+Xcom(3))- (Xcom(4) + Xcom(5)+Xcom(6)));
ecartPers = abs((Xpersonnel(1) + Xpersonnel(2)+Xpersonnel(3))- (Xpersonnel(4) + Xpersonnel(5)+Xpersonnel(6)));
ecartM3=abs((Xm3(1) + Xm3(2) + Xm3(3)) - (Xm3(4) + Xm3(5) + Xm3(6)));
ecartM5=abs((Xm5(1) + Xm5(2) + Xm5(3)) - (Xm5(4) + Xm5(5) + Xm5(6)));

 MG = [ fcompta'*Xcompta, fatel'*Xcompta, fstock'*Xcompta,ecartCompta, fpersonnel'*Xcompta, fm3'*Xcompta, fm5'*Xcompta;
        fcompta'*Xatel, fatel'*Xatel, fstock'*Xatel, ecartAtel, fpersonnel'*Xatel, fm3'*Xatel, fm5'*Xatel;
        fcompta'*Xstock, fatel'*Xstock, fstock'*Xstock, ecartStock, fpersonnel'*Xstock, fm3'*Xstock, fm5'*Xstock;
        fcompta'*Xcom, fatel'*Xcom, fstock'*Xcom, ecartCom, fpersonnel'*Xcom, fm3'*Xcom, fm5'*Xcom;
        fcompta'*Xpersonnel, fatel'*Xpersonnel, fstock'*Xpersonnel, ecartPers, fpersonnel'*Xpersonnel, fm3'*Xpersonnel, fm5'*Xpersonnel;
        fcompta'*Xm3, fatel'*Xm3, fstock'*Xm3, ecartM3, fpersonnel'*Xm3, fm3'*Xm3, fm5'*Xm3;
		fcompta'*Xm5, fatel'*Xm5, fstock'*Xm5, ecartM5, fpersonnel'*Xm5, fm3'*Xm5, fm5'*Xm5;
        ];

end

