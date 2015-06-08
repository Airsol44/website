# Airsol : mettre à jour le site

## avant de commencer

Avant **toute modification** il faut s'assurer qu'on a bien la dernière version
à jour. Pour ça :

1. ouvrir un terminal
2. aller dans le bon dossier par la commande `cd (chemin vers le dossier)`
  **le bon dossier**, c'est celui ou il y a ce fichier `readme.markdown` !
3. taper la commande `git pull` qui va télécharger les modifications s'il y en a
  eu. Plus d'infos sur git dans la dernière partie.

## ajouter ou modifier une réalisation

Tous les textes sont stockés au format [YAML] dans le dossier `yml/`. Il y a un
fichier par domaine de réalisations, autrement dit :

- `chaudières.yml`
- `photovoltaique.yml`
- `poeles.yml`
- `thermique.yml`

Ce qui devrait j'espère être assez explicite. Chaque fichier commence par un
**en-tête** avec les infos générales du domaine. Ensuite on a la partie
`workList:` qui liste les réalisations : c'est **ici** qu'il faut intervenir
pour ajouter une réalisation ou en modifier une.

Une réalisation expliquée ligne par ligne :

```
- workTitle:     <- titre de la réalisation
  workName:      <- année-titre raccourci, en minuscule et séparé par des
                    tirets, c'est le nom du dossier dans lequel on va ranger
                    les images
  workDate:      <- année de réalisation
  workDesc: |    <- phrase ou paragraphe de détails sur la réalisation
    ...
  workHasSlides: <- No si pas d'images, sinon Yes
  slideList:     <- liste des images
  - slideAlt:    <- texte alternatif de l'image, ou description
    slideUrl:    <- url de l'image au sein du dossier décrit dans workName
  workTable:     <- liste de lignes du tableau des élément et du coût
  - tableRow: ["", ""]   <- en cellule 1 : nom de l'élément, cellule 2 :
                            quantité, prix, lien vers une fiche
```

Le plus sûr, c'est de se reporter aux réalisations déjà présentes pour
s'inspirer de la façon dont elles ont été écrites.

## rajouter une image

1. rajouter dans le dossier `img/(domaine)/(nom de la réalisation)`
  une image en .jpg ou .png uniquement (créer le dossier au besoin)
2. ouvrir le fichier `yml/(domaine).yml` correspondant avec gedit (éditeur de
  texte)
3. repérer la réalisation voulue dans `workList`
4. ajouter un élément de liste (deux lignes : `slideAlt` et `slideUrl`), le plus
  simple est de copier/coller depuis une autre liste d'images.
  * en `slideUrl` mettre le chemin du fichier depuis le dossier `img/(workName)`
    ou il a été mis
  * en `slideAlt` mettre le titre de l'image
  Les deux lignes sont montrées en exemple dans la réalisation détaillée au
  paragraphe précédent

## générer le site

Ce qu'on a là, ce sont de petits morceaux de site, qu'il faut maintenant
transformer en pages HTML pour que ce soit lisible par le navigateur.

1. ouvrir un terminal
2. aller dans le bon dossier par la commande `cd (chemin vers le dossier)`
3. taper la commande `./airsol.rb`

Ça lance le fichier de script qui génère le site web. Il indique au fur et à
mesure le nombre de réalisations de chaque domaine qui ont été générées. Tu peux
à présent consulter le dossier static/ qui contient ton site web à jour, pour
vérifier que tout s'est bien passé dans tes modifications.

## enregistrer la nouvelle version et publier le site

Pour la dernière étape on se sert du terminal et d'un outil appelé [Git]. Il va
enregistrer toutes les modifications de fichiers en un `commit`, une
publication, et on va pouvoir l'envoyer en ligne pour qu'elle soit visible sur
le site.

1. taper `git checkout gh-pages`
  Pour cette étape, ferme tous les fichiers ouverts dans gedit ! La commande
  `checkout` t'emmène vers une autre partie du projet, et les fichiers ne
  correspondront plus à ce que tu as dans le dossier : ne les sauve pas de force
  dans la mauvaise partie !
2. si ce n'est pas déjà fait, `git pull` pour récupérer la dernière version à
  jour
3. taper `rsync -ac --delete --exclude=static --exclude=cname static/* .`
  c'est une commande qui permet de copier le contenu du répertoire `static/` (où
  a été généré notre site web) vers le dossier courant : c'est en effet à la
  racine de ce dossier que le site va être visible.
4. les modifications du site sont maintenant visible par la commande
  `git status` qui liste tout ce qui a été ajouté, supprimé ...
5. pour ajouter les modifications de tous les fichiers à la publication :
  `git add -u .`
6. enregistrer la publication demande un commentaire court:
  `git commit -m "petit commentaire"`, c'est pour se souvenir à quoi ces
  modifications correspondent.
7. enfin, `git push origin gh-pages` publie en ligne sur la branche `gh-pages`,
  utilisée par l'hébergeur pour mettre le site en ligne.

Attention, tout ce qu'on a sauvegardé ici c'est le **site généré** ! Il faut
maintenant retourner dans la première branche pour enregistrer et envoyer en
ligne les données brutes (YAML) qui on servi à générer le site.

1. `git checkout master`, la branche principale
2. `git status` pour vérifier les modifications
3. `git add -u .` pour tout ajouter à la publication
4. `git commit -m "commentaire"` pour enregistrer et commenter la publication
5. `git push origin master` : **attention** on ne publie pas n'importe où ! on
  était avant sur la branche `gh-pages` donc on publiait dans `origin gh-pages`,
  on est maintenant sur `master` donc on publie dans `origin master`

Voilà, si tout s'est bien passé tout est enregistré et publié ... Vérifie ça sur
[airsol44.com](http://airsol44.com) et envoie-moi un mail si t'as tout cassé !

[YAML]: http://fr.wikipedia.org/wiki/YAML
[Git]: http://git-scm.com/doc
