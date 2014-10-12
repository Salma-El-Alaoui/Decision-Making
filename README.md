Aide-Decision
=============

lien pour le gdoc
https://drive.google.com/folderview?id=0B3sUSdIZDoLrZ1BqSHR4anJyckE&usp=sharing

##TODO

- pour le personnel, il faut montrer le temps d'utilisation minimal `en mn par semaine` pur les machines 3 et 5 séparément.
- toujours dans la partie du personnel, pour le cas de figure des machines 3+5, il faut donner le temps de chaque machine séparément.
- Et pour le bénéfice, il faut spécifier une unité ? (au moins dire xx unités).
- Que pensez vous de rajouter pour le personnel et les stock des graphes ou en tracerait l'évolution des stocks en fonction du pourcentage de bénéfice max utilisé pour la contrainte ? on n'est pas vraiment obligés de le mettre à 50% en fait, on peut essayer d'affiner.(et pareil pour le personnel avec le temps d'utilisation des machines).


## Rajouter à probleme.m
 %% ================ Partie 3: Electre I ================
 Matrice_jugement = [6 5 5 5; 5 4 9 3; 3 4 7 3; 3 7 5 4; 5 4 3 9; 2 5 7 3;5 4 2 9; 3 5 7 4];

 Matrice_jugement_sans_domines = [6 5 5 5; 5 4 9 3; 3 7 5 4; 5 4 3 9; 3 5 7 4];
