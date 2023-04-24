# A améliorer

- duplication de code dans les vues (en particulier fights/new.html), utiliser plus de partial aurait été préférable
- n+1 sur l'index des characters (se documenter sur les n+1 et includes)
- logique de combat dans le controller (se renseigner sur les services par exemple), et qui possède du code dupliqué et une condition très longue qui aurait mérité être extraite dans une méthode bien nommée
- les form de création et edition de character sont proches, on aurait aimé un peu de code en commun
- Enfin, l'utilisation de weapon_item est discutable, vu qu'on n'a au final qu'un item de chaque type et vu l'existance et l'utilisation des méthodes unequip et de la character#equipped_weapon et character#equipped_shield, on aurait aussi vite fait d'avoir deux relations directe entre character et item (mais moins important que les points précédents).

## Résultat attendu

Le but de ce challenge est de tester ta capacité à monter une petite application [dans le respect des bonnes pratiques](https://medium.com/captain-contrat-tech).  
On te propose quatre étapes clés, avec des bonus facultatifs.

Nous nous intéresserons tout particulièrement aux choix de conception que tu feras, comment tu abordes les fonctionnalités à développer et ta connaissance des outils que tu utilises.

## Tes armes

- Ruby
- Rails
- git

## Étapes

### 0. ~~Forker~~ Cloner ce repo

Pour commencer, il faudra cloner (ne *PAS* forker) ce repo afin d'y ajouter tes modifications.

### 1. Page d'accueil statique

C'est l'accueil de l'arène, d'où nous pourrons lancer les combats.  
Le but est donc de modifier (ou supprimer/remplacer) la page d'accueil existante.

Bonus :

- Un petit texte d'introduction de ton cru. C'est plus fun.
- Joli design (mais n'y perd pas trop de temps non plus)

### 2. Pouvoir créer un personnage

Données requises :

- Nom
- Points de vie
- Points d'attaque

Assure-toi qu'il n'y ait pas de grand déséquilibre entre combattants.  

Bonus :

- L'arène n'est pas vide au premier démarrage de l'appli.
- Les persos ont une photo de profil (ou de face)
- Crud complet des personnages
- Ajouter d'autres caractéristiques de ton choix aux personnages

### 3. READY? FIGHT!

Pouvoir choisir deux personnages et les faire combattre, puis afficher le gagnant avec un récapitulatif du combat.

Bonus :

- Historique des combats qui ont eu lieu
- Ajout de points d'expérience (mais pourquoi faire ?)
- Statistiques des combats : taux de victoire par perso et tout ça

### 4. Des armes

Pouvoir assigner une arme aux personnages avant le combat.

Bonus :

- Il n'y a pas que les armes dans la vie, il y a des boucliers aussi
- Pouvoir utiliser plusieurs équipements
