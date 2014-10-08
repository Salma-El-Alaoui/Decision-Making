function [ MG ] = MatriceGain( Xcompta, Xatel, Xstock, Xcom, Xpersonnel,fcompta , fatel, fstock, fcom,fpersonnel )

 MG = [ fcompta'*Xcompta, fatel'*Xcompta, fstock'*Xcompta, fcom'*Xcompta, fpersonnel'*Xcompta;
        fcompta'*Xatel, fatel'*Xatel, fstock'*Xatel, fcom'*Xatel, fpersonnel'*Xatel;
        fcompta'*Xstock, fatel'*Xstock, fstock'*Xstock, fcom'*Xstock, fpersonnel'*Xstock;
         fcompta'*Xcom, fatel'*Xcom, fstock'*Xcom, fcom'*Xcom, fpersonnel'*Xcom;
         fcompta'*Xpersonnel, fatel'*Xpersonnel, fstock'*Xpersonnel, fcom'*Xpersonnel, fpersonnel'*Xpersonnel;
         ];

end

