%% Projet d'aide à la décision 
% 
%
%  
%  ------------
% 
%% ================ Définition des contraintes générales ================

% vecteur de la quantité de produits par semaine
%X =[xa; xb; xc; xd; xe; xf];

% Nous avons défini des contraintes suivantes:
%   - temps d'usage de chaque machine < 16 h par jour
%   - quantité de matières premières  utilisées inférieures aux seuils
%   précisés
%   - les quantités des produits doivent êtres positives

% matrice de contraintes générales
A = [8 15 0 5 0 10; 7 1 2 15 7 12; 8 1 11 0 10 25; 2 10 5 4 13 7; 5 0 0 7 10 25; 5 5 3 12 8 0;5 3 5 8 0 7; 1 2 1 5 0 2; 2 2 1 2 2 1; 1 0 3 2 2 0];
% vecteur de seuils
B = [ 4800 ; 4800; 4800; 4800;4800; 4800; 4800; 350; 620; 485];
% vecteur de containtes de domaine
LB = zeros (6,1);

%% ================ Partie 1: Programmation linéaire monocritère ================

% Chaque cadre ayant un objectif de production, il faut dans un premier
% temps considérer indépendamment chacun des objectifs.

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
 
 %% ================ Partie 2: Programmation linéaire multicritère ================
% On calcule la matrice de gain pour les différentes solutions trouvées précédemment. 
% On maximise toutes les fonctions sauf fstock et fpers (et fm3 et fm5).

MG = MatriceGain( Xcompta, Xatel, Xstock, Xcom, Xpers, Xm3, Xm5, fcompta , fatel, fstock,fpers, fm3, fm5 );
Moy = sum(MG,1)/5;
Med = median(MG,1);

% réecriture du problème
% On veut maximiser le bénefice. On transforme les autres fonctions
% objectif en contraintes.
A2 = [A;(-fatel)';fstock';(-fcom)';fpers'];
B2 = [B; -290; 1450; -10;4000]; 
%B2 = [B; -200; 1400; -200;4000]; 
%Medianes : B2 = [B; -360; 1690; -190; 9000];
[X2, opt1, C1, fcompta] = Comptable(A2,B2,LB);
%On essaye d'améliorer les critères
% ajustement = eye(16,16);
% for i=11:16
% ajustement(:,i)= ajustement(:,i)*1.1;
% end
% B3 =  ajustement*B2;
% [X2, opt2, C2, fcompta] = Comptable(A2,B2,LB);

%On regarde maintenant le pourcentage de satisfaction des objectifs de
%chaque responsable:
[VS, PM,Y]=Satisfaction(MG,X2, fcompta , fatel, fstock,fpers,fm3, fm5)

%% ================ Partie 3: Analyse multi-critere ================
Matrice_jugement = [6 5 5 5; 5 4 9 3; 3 4 7 3; 3 7 5 4; 5 4 3 9; 2 5 7 3;5 4 2 9; 3 5 7 4];
Matrice_jugement_sans_domines = [6 5 5 5; 5 4 9 3; 3 7 5 4; 5 4 3 9; 3 5 7 4];
poids_uniformes = [1 1 1 1];
ponderation = [5 2 3 2];
% matrices de concordances et discordance sans application des poids.
MC=concordance(Matrice_jugement_sans_domines, poids_uniformes );
MD = discordance(Matrice_jugement_sans_domines);
% matrices de concordances et discordance avec application des poids aux critères.
MC1=concordance(changement_echelle(Matrice_jugement_sans_domines), ponderation);
MD1 = discordance(changement_echelle(Matrice_jugement_sans_domines));
L=changement_echelle(Matrice_jugement)



