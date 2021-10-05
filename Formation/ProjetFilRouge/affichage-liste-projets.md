# Affichage de la liste des projets gérés par l'application

### Description
	En tant qu'administrateur, une fois connecté, je veux pouvoir visualiser une liste de tous les projets gérés par l'application, et pour accéder aux paramètres de chacun.
	
### Critères d'acceptance
	- [] Chaque projet occupe une ligne
	- [] L'ensemble des projets gérés par l'application est affiché
	- [] Si le nombre de projets est trop important pour tenir sur un seul écran, une barre de scroll doit apparaître sur la droite de l'écran.
	- [] On doit pouvoir monter et descendre dans la page, soit à l'aide de la barre de scroll, soit à l'ade des flêches "haut" et "bas" du clavier.
	- [] Chaque projet est représenté par son attribut nom.
	- [] Chaque nom de projet est un lien cliquable qui renvoie vers une page d'information du projet.
	- [] La page respecte les ébauches graphiques fournies.




## TASK : Affichage des projets

### Description
	- Récupérer les champs "nom" de tous les projets stockés dans le fichier "liste-projets.json".
	- Afficher chaque nom sur une ligne.
	- Faire du nom un lien.
	- Rediriger le lien vers l'url http://url-de-l-application/liste-de-projets/nom-du-projet
	
## TASK : Gérer la navigation dans la page

### Description
	- Générer une barre de scroll qui s'adapte au nombre d'éléments affichés sur la page.
	- Gérer les touches "flêche haut" et "flèche bas".
	
## TASK : Mettre en place l'aspect graphique

### Description
	- Gérer le front pour respecter les ébauches graphiques fournies.
	
## TASK : Rédiger la documentation

### Description
	- Créer une page de spécifications techniques et commencer à la remplir avec les éléments de cette story.
	- Créer un page de spécifications fonctionnelles pour la fonction liste de projets/information sur les projets/mise à jour des projets.