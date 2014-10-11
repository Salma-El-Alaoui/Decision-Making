%% Projet d'aide � la d�cision 
% 
%
%  
%  ------------
% 
%% ================ D�finition des contraintes g�n�rales ================

% vecteur de la quantit� de produits par semaine
%X =[xa; xb; xc; xd; xe; xf];

% Nous avons d�fini des contraintes suivantes:
%   - temps d'usage de chaque machine < 16 h par jour
%   - quantit� de mati�res premi�res  utilis�es inf�rieures aux seuils
%   pr�cis�s
%   - les quantit�s des produits doivent �tres positives

% matrice de contraintes g�n�rales
A = [8 15 0 5 0 10; 7 1 2 15 7 12; 8 1 11 0 10 25; 2 10 5 4 13 7; 5 0 0 7 10 25; 5 5 3 12 8 0;5 3 5 8 0 7; 1 2 1 5 0 2; 2 2 1 2 2 1; 1 0 3 2 2 0];
% vecteur de seuils
B = [ 4800 ; 4800; 4800; 4800;4800; 4800; 4800; 350; 620; 485];
% vecteur de containtes de domaine
LB = zeros (6,1);

%% ================ Partie 1: Programmation lin�aire monocrit�re ================

% Chaque cadre ayant un objectif de production, il faut dans un premier
% temps consid�rer ind�pendamment chacun des objectifs.

 % ====================== Comptable ======================
 [Xcompta, optcompta, Ccompta, fcompta] = Comptable(A,B,LB);
 % ====================== Responsable d'atelier ======================
 [Xatel, optatel, Catel, fatel] = Atelier(A,B,LB);
 % ====================== Responsable des stocks ======================
 [Xstock, optstock, Cstock, fstock] = Stock(A,B,LB);
 % ====================== Responsable commercial ======================
 [Xcom, optcom, Ccom, fcom] = Commercial(A,B,LB);
 % ====================== Responsable du personnal ======================
 [Xpers,Xm3, Xm5, opt,opt3, opt5,C,Cm3, Cm5 ,fpers, fm3, fm5 ] = Personnel(A,B,LB);
 
 %% ================ Partie 2: Programmation lin�aire multicrit�re ================
% On calcule la matrice de gain pour les diff�rentes solutions trouv�es pr�c�demment. 
% On maximise toutes les fonctions sauf fstock et fpers (et fm3 et fm5).

MG = MatriceGain( Xcompta, Xatel, Xstock, Xcom, Xpers,fcompta , fatel, fstock,fpers, fm3, fm5 );
Moy = sum(MG,1)/5;
Med = median(MG,1);

% r�ecriture du probl�me
% On veut maximiser le b�nefice. On transforme les autres fonctions
% objectif en contraintes.
A2 = [A;(-fatel)';fstock';(-fcom)';fpers';fm3';fm5'];
B2 = [B; -360; 1690; -190; 9000; 4700; 4320]; 
[X1, opt1, C1, fcompta] = Comptable(A2,B2,LB)
%On essaye d'am�liorer les crit�res
ajustement = eye(16,16);
ajustement(:,11)= ajustement(:,11)*1.1;
ajustement(:,12)= ajustement(:,12)*1.1;
ajustement(:,13)= ajustement(:,13)*1.1;
ajustement(:,14)= ajustement(:,14)*1.1;
ajustement(:,15)= ajustement(:,15)*1.1;
ajustement(:,16)= ajustement(:,16)*1.1;
B3 =  ajustement*B2;
[X2, opt2, C2, fcompta] = Comptable(A2,B3,LB);
%% ================ Partie 3: Analyse multi-crit�re ================
Matrice_jugement = [6 5 5 5; 5 4 9 3; 3 4 7 3; 3 7 5 4; 5 4 3 9; 2 5 7 3;5 4 2 9; 3 5 7 4];
Matrice_jugement_sans_domines = [6 5 5 5; 5 4 9 3; 3 7 5 4; 5 4 3 9; 3 5 7 4];
% matrices de concordances et discordance sans application des poids.
MC=concordance(Matrice_jugement_sans_domines )
MD = discordance(Matrice_jugement_sans_domines)
% matrices de concordances et discordance avec application des poids aux crit�res.
MC1=concordance(changement_echelle(Matrice_jugement_sans_domines))
MD1 = discordance(changement_echelle(Matrice_jugement_sans_domines))

