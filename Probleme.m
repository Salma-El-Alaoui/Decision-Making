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
 [Xpers, optpers, Cpers, fpers] = Personnel(A,B,LB);
 
 %% ================ Partie 2: Programmation lin�aire multicrit�re ================
% On calcule la matrice de gain pour les diff�rentes solutions trouv�es pr�c�demment. 
% On maximise toutes les fonctions sauf fstock et fpers.

MG = MatriceGain(Xcompta, Xatel, Xstock, Xcom, Xpers,fcompta , fatel, fstock, fcom,fpers) 
