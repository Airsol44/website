# refactoring

*nécessaire pour éviter la duplication énorme de code et installer une façon
logique de nommer les variables des templates*

+ Renommer tous les "branch" en "domain", beaucoup plus explicite
+ Redécouper les templates : base.html, home.html, domain.html
+ Repenser les templates : clarté du nommage des variables et validité mustache,
  c'est la structure des données .yml qui en dépendra et pas l'inverse
+ Créer un dossier pour mettre le contenu de airsol.yml redécoupé :
  base.yml, home.yml, chaudieres.yml etc. (1 fichier par domaine)
+ Renommer "chaud" et autres shortnames en urlname "chaudières" etc. pour éviter
  les confusions et être cohérent
+ Les sous-dossiers de src/ peuvent être bougés à la racine pour plus de clarté,
  en imaginant une structure telle que :
      airsol44/
        css/
        (design)/ # temporary folder holding the initial css & html
        img/
        js/
        mustache/
        static/ # en remplacement de out qui est flou et inexact
        yml/
        airsol.rb
        readme.markdown
+ Bouger le script JQuery dans un fichier .js pour ne laisser que le domready en
  inline script
+ Renommer les images "index" et "cover" parce que ça fait bizarre

- évidemment adapter le script ruby pour que ça remarche...
