# Airsol : mettre à jour le site

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

## rajouter une image

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

[YAML]: http://fr.wikipedia.org/wiki/YAML
