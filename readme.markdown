# Airsol
airsol44.com

## comment mettre à jour

### rajouter une image

1. rajouter dans le dossier `/img/(type de réalisation)/(nom de la réalisation)`
  une image en .jpg ou .png uniquement (créer le dossier au besoin)
2. ouvrir le fichier `/yml/(type de réalisation).yml` correspondant avec gedit
  (éditeur de texte)
3. repérer la réalisation voulue dans `workList`
4. ajouter un élément de liste (deux lignes : slideAlt et slideUrl) en copiant/collant
  depuis une autre liste d'images.
  * en slideUrl mettre le chemin du fichier depuis le dossier
  `(nom de la réalisation)` ou il a été mis
  * en slideAlt mettre le titre de l'image
5. enregistrer les modifications et publier le site selon la méthode décrite dans
  aide.markdown

### rajouter une réalisation

(...)

## comment j'ai construit ce site

1. design
2. templating mustache avec des vars "namespaced" (genre main-menu-item)
3. génération des données selon l'usage mustache
4. le script qui met des points de colle sur le tout
5. rédaction et remplissage

à terme il y a sûrement moyen de faire un micro framework, une structure ou
de bonnes "coding practices".
