# Tutoriel : Créer une Webapp pour Ubuntuphone en moins de temps qu'il n'en faut pour faire cuire des pâtes

L'objectif de ce tutoriel est double :

Le premier objectif est de vous permettre de prendre conscience que la création de webapps pour l'Ubuntuphone est d'une facilité déconcertante, mais que c'est aussi ultra rapide
Le second, plus complexe dans sa mise en oeuvres, est de vous permettre de manger un plat chaud et consistant pendant que vous utiliserez voter webapp nouvellement créée.

## 1. Les accessoires

Pour ce tutoriel, nous aurons donc besoin :

- d'une casserole suffisament grande
- d'un égoutoire à pâtes
- d'une pince à pâte
- de tout type de réchaud. A titre perso j'utilise une plaque vitro-céramique
- d'un ordinateur sous Ubuntu
- du SDK Ubuntu
 
## 2. Les ingrédients

Comme ingrédients nous aurons besoin :

- de pâtes. Allons-y pour des coquilettes Barilla
- du sel
- du beurre
- d'emmental râpé ou de parmesan 
- du lien vers la version mobile du site que l'on veut convertir en webapp. Dans cet exemple nous continuerons avec Metronews. Le lien sera donc http://touch.metronews.fr

## 3. Allons-y j'ai faim

Nous allons préparer une assiète de pâtes standard, soit 250 g de pâtes. Suivant la règle des 10/100/1000 (10g sel pour 100 g de pâtes dans 1 L (1000 mL) d'eau), nous aurons donc besoin de 2.5 L d'eau dans notre casserole. 

Plaçons-la sur le feu pour porter l'eau à ebullition

Pendant que notre eau bout, nous allons installer le SDK Ubuntu

    sudo add-apt-repository ppa:ubuntu-sdk-team/ppa
    sudo apt-get update && sudo apt-get dist-upgrade  # Il faut s'assurer que tous les composants soient à jour
    sudo apt-get install ubuntu-sdk

**ATTENTION : Comme toujours, l'installation de paquets provenant d'un PPA peut entrainer des erreurs sur votre système. Cette opération est à faire à vos risques et périls.**

Pendant que le SDK s'installe, jetez un coup d'oeil à votre casserole

Si l'eau n'est pas encore au point d'ébulition, ouvrez le SDK Ubuntu.

![Ubuntu SDK dans le tableau de bord Unity](https://github.com/Winael/webapps/blob/master/img/UbuntuSDK.png)

Sur l'écran d'accueil, choisir `Projects`, puis `New Project`

![Nouveau projet](https://github.com/Winael/webapps/blob/master/img/NewProject.png)

Choisir le template :

- **Project :** `Ubuntu`
- **Template :** `Web App`

puis cliquuer sur `Choose...`

![Choisir le template](https://github.com/Winael/webapps/blob/master/img/ChooseTemplate.png)

Donnons un nom à notre projet et un répertoire de destination :

- **Name :** `webapp-metronews-fr`
- **Create in :** `/le/chemin/quil/vous/plaira`

Cliquer sur `Next >`

![Project Location](https://github.com/Winael/webapps/blob/master/img/ProjectLocation.png)

Ponner quelques *« Details »* :

- **Nickname :** *votre namespace sur le portail des developpeur Ubuntu.* Le mien est `vinzjobard`
- **Maintainer :** `Prénom Nom <adresse@email.com>`
- **App name :** `webapp-metronews-fr` (par défaut)
- **Framework :** `ubuntu-sdk-14.10` (le *bq Aquaris E4.5 Ubuntu Edition étant en 14.10)

Cliquer sur `Next >`

![Details du projet](https://github.com/Winael/webapps/blob/master/img/Details.png)

Choisir le `Kits` : `UbuntuSDK for armhf (GCC ubuntu-sdk-15.04-vivid)`

Cliquer sur `Next >`

![Kits pour le projet](https://github.com/Winael/webapps/blob/master/img/Kits.png)

Laisser les options par défaut et cliquer sur `Finish`

![Résumé du projet](https://github.com/Winael/webapps/blob/master/img/Summary.png)

Cela va générer l'arborescence suivante :

    webapp-metronews-fr\
    |_ .excludes
    |_ manifest.json
    |_ README
    |_ webapp-metronews-fr.apparmor
    |_ webapp-metronews-fr.desktop
    |_ webapp-metronews-fr.png
    
Surveiller votre casserole, l'eau devrait arriver à ébullition.

Lorsque l'eau arrive à son point d'ébullition, il faut baisser légèrement le feu puis mettre le sel (25g pour 250g de pâtes). Une fois le sel dissous, mettre les pâtes dans l'eau, ravivier le feu, puis bien agiter avec une cuillère en bois.

Se remettre au travail

Nous allons modifier le fichier `webapp-metronews-fr.apparmor` pour ne laisser que les profil AppArmor dont notre application web aura besoin, à savoir : `networking`, `content_exchange` et `webview`.

Pour cela, double cliquer sur le fichier `webapp-metronews-fr.apparmor` dans le SDK Ubuntu, puis supprimer les profils `audio` et `video` via un *clique droit > Remove*

Sauvegrder le fichier via `<Ctrl> + S`

On édite maintenant le fichier `webapp-metronews-fr.desktop` via un double clique

Les champs suivant sont à éditer :

- **Comment :** `Non official webapp for metronews.fr website` (C'est le descriptif)
- **Exec :** `webapp-container --store-session-cookies --webappUrlPatterns=https?://*metronews* http://touch.metronews.fr %u` (on supprime `--enable-back-foreward`, on veut que l'application puisse se connecter à l'ensemble du domaine `*metronews*` et l'URL de départ sera `http://touch.metronews.fr`)

    [Desktop Entry]
    Name=webapp-metronews-fr
    Comment=Non official webapp for metronews.fr website
    Type=Application
    Icon=webapp-metronews-fr.png
    Exec=webapp-container --store-session-cookies --webappUrlPatterns=https?://*metronews* http://touch.metronews.fr %u
    Terminal=false
    X-Ubuntu-Touch=true
    
On récupère l'[icone du dernier tuto](https://github.com/Winael/scopes/blob/master/metronews-fr-scope/metronews-fr-scope/images/icon.png) que l'on place dans le répertoire de travail en tant que webapp-metronews-fr.png
 
Dans un terminal se placer dans le répertoire de travail 

    cd /repertoire/de/travail/webapp-metronews-fr

Construire l'applcation

    click build .
    
Cela génèrera le fichier `webapp-metronews-fr.vinzjobard_0.1_all.click`

Allez voir vos pâtes et remuez

Il ne reste plus qu'à publier l'application comme vu au point *4.5. Publication du scope* du [Tutoriel : Création d'un scope pour Ubuntuphone](http://winael.blogspot.fr/2015/03/tutoriel-creation-dun-scope-pour.html)


 
 
 






