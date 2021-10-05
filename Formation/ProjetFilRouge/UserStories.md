# Panneau de log in pour les administrateurs

### Description
	En tant qu'administrateur je veux pouvoir me logger à l'application lorsque je rentre une url de l'application dans un navigateur web.
	Toutes les urls de l'application doivent rediriger vers le panneau de log in si l'utilisateur n'est pas déjà connecté.
	Le panneau doit comprendre deux champs : un champ pour le username et un champ pour le mot de passe.
	Si l'un des deux champs est mal rempli l'authentification doit échouer et l'utilisateur peut retenter de se logger.
	
### Critères d'acceptance
	- [] On ne doit pas pouvoir accéder à l'application sans passer par l'écran de log in
	- [] Deux champs doivent être remplis : username et mot de passe
	- [] Si l'un des deux n'est pas bon l'authentification échoue
	- [] Les usernames ou mots de passe vides ne sont pas acceptés
	- [] Les usernames et mots de passe n'acceptent que des caractères étant des : lettres (majuscules ou minuscules), des chiffres, des tirets hauts ou bas
	- [] Les utilisateurs n'ont pas de limite au nombre d'essais pour s'authentifier
	- [] Un bouton "Se Connecter" est disponible pour valider la saisie du username et mot de passe
	- [] L'utilisation de la touche "entrée" est équivalente à l'utilisation du bouton "Se Connecter"
	- [] La page doit respecter les ébauches graphiques fournies
	


# Blocage des tentatives d'authentification après un nombre d'échecs successifs trop élevés

### Description	
	Les utilisateurs ne peuvent essayer de se logger que trois fois. Après trois échecs successifs l'adresse ip d'où vient la tentative d'authentification ne peut plus essayer de se logger pendant 1h.
	
### Critères d'acceptance
	- [] On ne doit pouvoir essayer de se logger que trois fois. Trois échecs successifs bloquent l'écran d'authentification.
	- [] Le blocage de l'écran d'authentification se fait par adresse ip.
	- [] Le blocage de l'écran d'authentification dure 1h.
	- [] L'écran d'authentification doit être remplacé par un écran sur lequel est marqué "Les tentatives d'authentification sont bloqués pour une heure sur cette adresse ip".
	

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


# Affichage d'un menu de navigation

### Description
	En tant qu'administrateur je veux pouvoir circuler dans les différentes pages de l'interface graphique de l'application à l'aide d'un menu situé en haut de page.
	
### Critères d'acceptance
	- [] Le menu est présent sur toutes les pages de l'interface graphique de l'application.
	- [] Le menu est le premier élément en haut de page, il respecte les ébauches graphiques fournies.
	- [] Le menu contient trois éléments : "Liste des projets", "Ajouter un projet", "Paramétrage"
	- [] Chaque élément du menu est un lien cliquable qui renvoie vers la page correspondante de l'interface graphique de l'application.
	- [] L'élément du menu correspondant à la page actuellement consultée est affiché en gras.
	

# Accès aux pages de l'interface graphique par url

### Description
	En tant qu'administrateur, une fois connecté à l'application, je veux pouvoir naviguer dans les différentes pages de l'interface graphique en entrant directement les bonnes urls.

### Critères d'acceptance
	- [] Si l'utilisateur n'est pas connecté toutes les urls de toutes les pages de l'interface graphique de l'application redirigent vers l'écran d'authentification.
	- [] Si l'utilisateur est connecté l'url renvoie directement vers la page idoine.
	- [] Si l'url correspond à une page de projet qui n'existe plus l'utilisateur est redirigé automatiquement vers la page de liste des projets.
	

# Affichage des pages d'information projet

### Description
	En tant qu'administrateur je veux pouvoir inspecter pour chaque projet géré par l'application ses caractéristiques. 
	
### Critères d'acceptance
	- [] L'url de ces pages d'information projet doit être la suivante : URL-PAGE-LISTE-PROJET/NOM-DU-PROJET
	- [] Le menu est l'élément le plus en haut de page.
	- [] Les champs suivants sont indiqués : "Nom du Projet", "Url du Dépot GitHub", "Projet Privé", "Secret du GitHub".
	- [] Le secret du GitHub ne doit pas être indiqué en clair.
	- [] Un bouton doit être accessible pour permettre à l'administrateur de demander à recevoir par mail le secret du GitHub associé à un projet.
	- [] La page doit respecter les ébauches graphiques fournies.
	
	
# Mise à jour des informations non secrètes d'un projet

### Description
	En tant qu'administrateur je veux pouvoir modifier les valeurs du nom d'un projet, de l'url du dépot GitHub.
	Je veux pouvoir réaliser cette action champ par champ, depuis la page d'information projet.
	
### Critères d'acceptance
	- [] Un bouton "Modifier" est présent à côté de la valeur affectée au champ "Nom du Projet" et du champ "Url du Dépot GitHub".
	- [] En appuyant sur le bouton "Modifier" un espace de saisie remplace l'affichage de la valeur du champ.
	- [] L'espace de saisie est pré-rempli par la valeur déjà connue de ce champ.
	- [] Les conditions appliquées aux valeurs de champs pour qu'elles soient valides sont les mêmes que pour la création d'un nouveau projet (Nom unique, dépot GitHub valide).
	- [] Pendant l'édition d'un champ le bouton "Modifier" devient un bouton "Valider". Un bouton "Abandonner" apparaît à côté du bouton "Valider", qui permet d'annuler la mise à jour du champ.
	- [] Un appui sur le bouton "Valider" fait disparaître l'espace de saisie et affiche la nouvelle valeur entrée.
	- [] Un appui sur le bouton "Valider" lorsque la nouvelle valeur du champ n'est pas valide entraîne l'affichage d'un message d'erreur "Valeur non valide".
	- [] Un appui sur le bouton "Abandonner" fait disparaître l'espace de saisie et affiche l'ancienne valeur du champ. Le bouton "Modifier" est de nouveau affiché, les deux boutons "Modifier" et "Abandonner" disparaissent.
	

# Ajout d'un nouveau projet

### Description
	En tant qu'administrateur je veux pouvoir ajouter un nouveau projet. 
	Je dois pouvoir renseigner les information essentielles sur ce projet (Nom du Projet, Url du Dépot GitHub, si le dépot est privé ou non, et si oui le Secret du Dépot).
	Je veux pouvoir réaliser cette action depuis un page d'ajout de projet.
	
### Critères d'acceptance
	- [] Le menu est présent en haut de la page d'ajout de projet.
	- [] L'url de la page d'ajout de projet est URL-PAGE-AJOUT-PROJET.
	- [] La page peut être accédée soit par l'élément "Ajouter un Projet" dans le menu, soit par son url, si l'utilisateur est connecté seulement.
	- [] Les champs suivants sont à renseigner : "Nom du Projet", "Url du Dépot GitHub", "Projet Privé", "Secret du GitHub".
	- [] Le Nom du Projet doit être unique.
	- [] Le Nom du Projet ne peut être composé que de caractères alphanumériques (minuscules et majuscules, au moins un), d'espaces et de tirets hauts et bas.
	- [] La longueur du Nom du Projet ne peut dépasser 30 caractères.
	- [] L'url du Dépot GitHub doit être valide (vérification de l'existence du dépot à la création du projet).
	- [] Le champ "Projet Privé" ne peux accepter qu'une réponse booléenne, "oui" ou "non".
	- [] Le champ "Secret du GitHub" n'est accessible que si la valeur rentrée pour le champ "Projet Privé" est "oui".
	- [] La validité du secret doit être vérifiée à la création du projet.
	- [] Un bouton de validation de l'ajout de projet est disponible en bas de page. Son utilisation redirige sur la page de Liste des Projets.
	- [] Les ébauches graphiques de la page sont respectées.
	

# Supprimer un projet

### Description
	En tant qu'administrateur je veux pouvoir supprimer un projet existant.
	Je veux pouvoir réaliser cette action depuis la page d'information du projet à supprimer.
	
### Critères d'acceptance
	- [] Un bouton "Supprimer le Projet" est disponible en bas à droite de l'écran.
	- [] Un clic sur ce bouton entraîne la suppression du projet et de toutes ses information.
	- [] L'utilisateur est redirigé sur la page de Liste des Projets.
	- [] Une fois le projet supprimé il n'est plus possible d'accéder au projet, que ce soit par un lien sur la page de Liste des Projets ou par son url.
	- [] Une fois le projet supprimé, les pages web associées au projet ne sont plus accessibles par un navigateur.


# Supprimer un projet depuis la page de Liste des Projets

### Description
	En tant qu'administrateur je veux pouvoir supprimer un projet existant directement depuis la page de Liste des Projets.
	
### Critères d'acceptance
	- [] Une icône "poubelle" est disponible à droite de l'écran, sur chaque ligne comportant le nom d'un projet sur la page Liste des Projets.
	- [] La page Liste des Projets respecte les ébauches graphiques fournies.
	- [] Un clic sur l'icône "poubelle" entraîne la suppression du projet situé sur la même ligne.
	- [] La page de Liste des Projets se recharge pour présenter une liste de projets dans laquelle ne figure pas le projet supprimé.
	- [] Une fois le projet supprimé il n'est plus possible d'accéder au projet, que ce soit par un lien sur la page de Liste des Projets ou par son url.
	- [] Une fois le projet supprimé, les pages web associées au projet ne sont plus accessibles par un navigateur.


# Paramétrage du stockage cloud des pages html

### Description
	En tant qu'administrateur je veux pouvoir spécifier le nom du bucket S3 qui sera utilisé pour stocker les pages html des sites et les rendre accessible sur un navigateur.
	
### Critères d'acceptance
	- [] Le menu est présent en haut de la page de paramétrage.
	- [] La page peut être accédée soit par l'élément "Paramétrage" dans le menu, soit par son url, si l'utilisateur est connecté seulement.
	- [] Un champ de saisie est disponible pour renseigner le nom du bucket S3.
	- [] Un bouton "ok" est disponible en bas de page pour valider le nom saisi.
	- [] Un clic sur le bouton "ok" entraine la mise à jour du nom du bucket, ou son ajout s'il n'est pas déjà connu. L'utilisateur est redirigé sur la page de "Liste des Projets".
	- [] Les ébauches graphiques de la page sont respectées.
	

# Livraison de l'application

### Description 
	En tant que propriétaire de l'application je veux pouvoir avoir accès aux différentes versions livrées de l'application.
	
### Critères d'acceptance
	- [] L'accès à la solution de stockage des versions de l'application est sécurisé. Les accès ne sont connus que de l'équipe agile.
	- [] Toutes les versions de l'application sont accessibles sans limite de temps sur cette solution de stockage.
	- [] Le versionning de l'application respectera la norme suivante : nom-de-l-application_01.XX.YY où "XX" correspond à la version de la release (numéro du sprint) et YY à la numérotation de la version corrective de cette livraison.
	- [] Une version utilisable de l'application est livrée dans un dossier répondant à la convention précédente. Sont également livrés avec l'application un PV de livraison (dans lequel figurera un rapport sur les campagnes de tests réalisées pour cette livraison) et un BL.
	

# Accessibilité des pages de sites depuis un navigateur web

### Description
	En tant que rédacteur je veux que les pages de mon site soient accessibles librement sur un navigateur, sur une adresse spécifiée.

### Critères d'acceptance
	- [] En utilisant une url de la forme http://url-de-base/nom-de-mon-site/nom-de-page n'importe quel internaute doit pouvoir accéder à une page de mon site.
	- [] En utilisant une url de la forme http://url-de-base/ n'importe quel internaute doit pouvoir accéder à une page récapitulant l'ensemble des pages de mon site.
	- [] Sur la page d'index de mon site, les noms des différentes pages sont des liens cliquables qui redirigent l'internaute vers la page correspondante.
	

# Présence d'une table des matières pour chaque page

### Description
	En tant que rédacteur je veux qu'une fois publiées mes pages comportent une section "table des matières" en haut de page, permettant aux internautes de naviguer plus aisément au sein de la page.
	
### Critères d'acceptance
	- [] Une table des matières regroupant tous les titres de ma page est présente.
	- [] Cette table des matières est le premier élément de la page.
	- [] Si une table des matières est déjà présente dans les documents .md déposés sur mon compte GitHub je ne veux pas qu'une nouvelle table des matières vienne l'écraser.
	

# Tests de la qualité de l'application

### Description
	En tant que propriétaire je veux que l'application livrée réponde à des critères de qualité de code et de fonctionnalité.
	
### Critères d'acceptance
	- [] La qualité du code et les bonnes pratiques de codage sont vérifiées pour faciliter la maintenabilité de l'application.
	- [] Des tests de non régression sont joués afin de valider le bon fonctionnement de l'application.
	- [] Les tests passent à plus de 90%.
	- [] Les cas de tests en échec sont tracés et justifiés dans le PV de livraison. Des mesures sont prises dès la prochaine itération pour corriger ces échecs.
	

# Tests de fiabilité de l'application

### Description
	En tant que propriétaire, mon application étant accessible en ligne, je veux m'assurer qu'elle soit fiable.
	
### Critères d'acceptance
	- [] Des tests sont joués afin de s'assurer que l'application pourra supporter la charge d'utilisation.
	- [] Des tests sont joués afin de s'assurer qu'il n'existe pas de faille de sécurité dans l'application, risquant de compromettre son fonctionnement ou celui des sites, de même que les données de nos clients.
	- [] Les tests passent à plus de 90%.
	- [] Les cas de tests en échec sont tracés et justifiés dans le PV de livraison. Des mesures sont prises dès la prochaine itération pour corriger ces échecs.
	

# Mise en ligne de l'application

### Description
	En tant qu'administrateur je veux pouvoir accéder à la plateforme de gestion de site de l'application depuis un navigateur web.
	
### Critères d'acceptance
	- [] L'application est accessible depuis un navigateur web via l'url http://url-de-mon-application
	- [] Si je suis déjà connecté, en suivant l'url précédente on accède à la page de Liste des Projets.
	- [] Si je ne suis pas déjà connecté, en suivant l'url précédente j'accède à la page d'authentification qui me redirigera automatiquement vers la page de Liste des Projets.
	- [] Si je suis déjà connecté, en suivant l'url http://url-de-mon-application/page-spécifique j'accède à la page correspondante.
	- [] Si je ne suis pas déjà connecté, en suivant l'url http://url-de-mon-application/page-spécifique j'accède à la page d'authentification qui me redirigera automatiquement vers la page correspondante.
	

# Mise à jour systématique de l'application en ligne

### Description
	En tant que propriétaire de l'application je veux que chaque nouvelle fonctionnalité terminée (user story) soit directement disponible sur la version de l'application accessible en ligne.
	
### Critères d'acceptance
	- [] A chaque fois qu'une user story est terminée, une nouvelle version "provisoire" de l'application est générée.
	- [] Si les critères de tests (plus de 90% de tests passés) sont remplis, la nouvelle version "provisoire" de l'application remplace celle déjà en ligne.
	- [] A chaque fin de sprint la version "livrée" de l'application remplace celle déjà en ligne.
	- [] Toutes les versions "provisoire" de l'application sont livrées, pour traçabilité, sans PV ni BL mais avec un rapport de tests.
	- [] la nomenclature des dossier contenant les applications provisoires est la suivante : nom-de-l-application_version-de-l-application_SNAPSHOT_numéro-de-la-user-story-livrée.
	