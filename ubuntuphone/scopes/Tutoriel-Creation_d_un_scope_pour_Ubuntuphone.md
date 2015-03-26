
# Tutoriel : Création d'un scope pour Ubuntuphone

L'une des fonctionnalité les plus interessante de l'Ubuntuphone est sans contestation ses scopes, permettant d'agréeger tout type de contenus et de le présenter dans une vue.

Si créer des scopes complexe n'est pas à la porter de n'importe qui, on peut, toutefois, sans trop s'y connaitre en technique, créer des scopes personnalisés à partir de flux Twitter, RSS ou YouTube grâce à l'utilitaire `scopecreator` écrit par [Chris Wayne](http://chrismwayne.com "Le blog personnel de Chris Wayne"), un employé de [Canonical](http://www.canonical.com "Le site de Canonical").

Nous allons prendre ici l'exemple de la création d'un scope agrégeant les flux RSS de [Métro News](http://http://www.metronews.fr "MetroNews.fr"), les sites d'actualités étant parfaitement adaptés pour l'exercice. Cela aussi montrera que contrairement au monde iOS et Androïd, il n'est pas nécessaire de connaitre la programmation pour proposer une _« application »_ pour les sites d'actualités, un scope pouvant souvent faire l'affaire

<<<<<<< HEAD
<<<<<<< HEAD
## 1. Installation de `scopecreator` de Chris Wayne
=======
## <a name="1"></a>1. Installation de `scopecreator` de Chris Wayne
>>>>>>> 76305113a960354127782f73ad7475feebbaa6b2
=======
## <a name="1"></a>1. Installation de `scopecreator` de Chris Wayne
>>>>>>> 76305113a960354127782f73ad7475feebbaa6b2

Tout d'abord nous allons installer l'outils `scopecreator` à partir de l'archive de paquets personnelle (PPA) de Chris :

    sudo add-apt-repository ppa:cwayne18/ppa
    sudo apt-get update
    sudo apt-get install scopecreator

**ATTENTION : Comme toujours, l'installation de paquets provenant d'un PPA peut entrainer des erreurs sur votre système. Cette opération est à faire à vos risques et périls.**

<<<<<<< HEAD
<<<<<<< HEAD
## 2. Création d'un compte sur le portail des developpeurs Ubuntu
=======
## <a name="2"></a>2. Création d'un compte sur le portail des developpeurs Ubuntu
>>>>>>> 76305113a960354127782f73ad7475feebbaa6b2
=======
## <a name="2"></a>2. Création d'un compte sur le portail des developpeurs Ubuntu
>>>>>>> 76305113a960354127782f73ad7475feebbaa6b2

Ensuite nous nous créerons un profil sur [le portail des développeurs Ubuntu](http://developer.ubuntu.com "Le portail des développeurs Ubuntu"). Je vous invite à vous y rendre régulièrement tant le site fourmille d'infos, sur les API, des recettes pour créer vos applications, et des tutoriaux souvent bien fournis.

Lors de la création de votre compte, qui est lié à votre compte Ubuntu One, il vous sera demandé de renseigné un _« Short package namespace »_. Il vous sera conseillé de garder votre login launchpad si vous avez déjà un compte.

Pour ma part, le mien est, sans surprise, `vinzjobard`

<<<<<<< HEAD
<<<<<<< HEAD
## 3. Les ressources

Nous allons préparer les ressources qui nous permettront de faire l'habillage de ce scope, pour le rendre conforme ou presque avec la chartre du site

### 3.1. Les élements graphiques
=======
=======
>>>>>>> 76305113a960354127782f73ad7475feebbaa6b2
## <a name="3"></a>3. Les ressources

Nous allons préparer les ressources qui nous permettront de faire l'habillage de ce scope, pour le rendre conforme ou presque avec la chartre du site

### <a name="31"></a>3.1. Les élements graphiques
<<<<<<< HEAD
>>>>>>> 76305113a960354127782f73ad7475feebbaa6b2
=======
>>>>>>> 76305113a960354127782f73ad7475feebbaa6b2

Le logo du site se trouve [ici](http://www.metronews.fr/locale/fr/templates/img/global/metronews_logo_341x72.png "Logo Metronews")

J'ai découpé le "O" pour en faire une icone.

<div class="four-col box box-highlight resource">
<h2>
Icone MetroNews&nbsp;›<div class="separator" style="clear: both; text-align: center;">
</div>
</h2>
<a href="http://2.bp.blogspot.com/-jN5viTz1_2g/VPXblb0yivI/AAAAAAAAx7c/3Y6XG7FoRyI/s1600/icon-metronews.png" imageanchor="1" style="clear: left; float: left; margin-bottom: 1em; margin-right: 1em;"><img border="0" src="http://2.bp.blogspot.com/-jN5viTz1_2g/VPXblb0yivI/AAAAAAAAx7c/3Y6XG7FoRyI/s1600/icon-metronews.png" height="50" /></a>
Télécharger l'icône MetroNews pour le scope Ubuntu.</div>

J'ai aussi repéré le code hexadécimal du vert _MétroNews_, ce qui nous servira pour les boutons et l'arrière-plan de notre entête : `#087437`

On utilisera le gris du site MétroNews pour faire le divider : `#F1F2F3`

### <a name="32"></a>3.2. Les flux de MétroNews

Je reprendrais les flux RSS de MétroNews défini [ici](http://www.metronews.fr/fr/article/2006/10/14/11/3127-35/index.xml "Metro en RSS") :

Rubrique   | Flux RSS
-----------|---------
Actualité  | http://www.metronews.fr/fr/rss.xml?c=section-news
Loisirs    | http://www.metronews.fr/fr/rss.xml?c=section-art
Ma vie     | http://www.metronews.fr/fr/rss.xml?c=section-lifestyle
Ma Planète | http://www.metronews.fr/fr/rss.xml?c=1157379272-32
Sports     | http://www.metronews.fr/fr/rss.xml?c=section-sports
Numérique  | http://www.metronews.fr/fr/rss.xml?c=1157379272-44
Jeux       | http://www.metronews.fr/fr/rss.xml?c=1157379272-52
Emploi     | http://www.metronews.fr/fr/rss.xml?c=1157379272-53
Immobilier | http://www.metronews.fr/fr/rss.xml?c=1157379272-54
Argent     | http://www.metronews.fr/fr/rss.xml?c=section-economy
Voyages    | http://www.metronews.fr/fr/rss.xml?c=1157379272-56
Photo      | http://www.metronews.fr/fr/rss.xml?c=1157379272-58

**NB :** Il semblerait qu'il n'exite plus qu'un flux d'actualité pour MétroNews. Du coup nous n'aurons qu'une rubrique

Rubrique                 | Flux RSS
-------------------------|--------------------------------
L'information en continu | http://www.metronews.fr/rss.xml

<<<<<<< HEAD
<<<<<<< HEAD
## 4. Création du scope `metronews-fr-scope`

### 4.1. Génération du scope 
=======
## <a name="4"></a>4. Création du scope `metronews-fr-scope`

### <a name="41"></a>4.1. Génération du scope 
>>>>>>> 76305113a960354127782f73ad7475feebbaa6b2
=======
## <a name="4"></a>4. Création du scope `metronews-fr-scope`

### <a name="41"></a>4.1. Génération du scope 
>>>>>>> 76305113a960354127782f73ad7475feebbaa6b2

Grâce à `scopecreator`, on va générer le template nous permettant de créer notre scope

    scopecreator create rss vinzjobard metronews-fr-scope

L'outils va nous créer un répertoire `metronews-fr-scope` avec les différents fichiers et répertoires que voici :

-   le fichier `manifest.json` : C'est en quelque sorte la _« carte d'identité »_ de notre scope. C'est ce fichier que nous modifieront lorsque nous [configurerons l'identité du scope](#42)
-   le fichier `scope-security.json` qui gère le profil de sécurité [AppArmor](http://doc.ubuntu-fr.org/apparmor "Fiche de AppArmor sur Ubuntu-fr.org") de notre scope
-   le répertoire `metronews-fr-scope`, contenant :

    -   un répertoire `images`. C'est là où nous placeront nos éléments graphiques
    -   un fichier `feeds.json`, qui contiendra la définition de nos flux
    -   un fichier `metronews-fr-scope.vinzjobard_metronews-fr-scope.ini`, qui contient le paramétrage esthéthique du scope. C'est ce fichier que nous modifierons lorsque nous [configurerons l'habillage du scope](#43)
    -   un fichier `libmetronews-fr-scope.vinzjobard_metronews-fr-scope.so`, binaire contenant les templates du scope

Nous travaillerons désormais à partir du répertoire de travail `metronews-fr-scope` 

    cd metronews-fr-scope/

### <a name="42"></a>4.2. Configuration de l'identité du scope ###

Nous allons ensuite configurer ce scope avec ces quelques infos :

-   Espace de nom du scope : `metronews-fr-scope.vinzjobard` (Par défaut)
-   Description : `Scope non-officiel du site metronews.fr`
-   Framework : `ubuntu-sdk-14.10` (Par défaut)
-   Architecture : `armhf` (Par défaut)
-   Titre : `MetroNews`
-   Hameçons :
    
    -   `metronews-fr-scope` (Par défaut) :

        -  Scope : `metronews-fr-scope` (Par défaut)
        -  AppArmor : `scope-security.json` (Par défaut)

-   Version : `0.1` (Par défaut, à faire évoluer avec l'évolution de votre scope)
-   Mainteneur : `Votre Nom <votre.adresse@email.com>`

Pour ce faire nous allons utiliser la commande intégrée `edit` de `scopecreator` pour modifier la `config` de notre scope

    scopecreator edit config

Cela va avoir pour effet d'ouvrir le fichier `manifest.json` via l'éditeur `nano` par défaut

Nous aurons donc le fichier `manifest.json` suivant :

    {
        "name": "metronews-fr-scope.vinzjobard",
        "description": "Scope non-officiel du site metronews.fr",
        "framework": "ubuntu-sdk-14.10",
        "architecture": "armhf",
        "title": "MetroNews",
        "hooks": {
            "metronews-fr-scope": {
                "scope": "metronews-fr-scope",
                "apparmor": "scope-security.json"
            }
        },
        "version": "0.1",
        "maintainer": "Winael <vinzjobard@gmail.com"
    }

Petite astuce : Sous Nano, il est possible de remplacer une occurrence en utilisant `<Ctrl>+\` 

Sauvegardons (`<Ctrl>+O`, `<Entrée>`), puis quittons l'édition du fichier (`<Ctrl>+X`).

### <a name="43"></a>4.3. Configuration de l'habillage du scope ###

A présent nous allons habiller notre scope.

Tout d'abord récupérons les éléments graphiques (logo et icône)

    wget http://www.metronews.fr/locale/fr/templates/img/global/metronews_logo_341x72.png metronews-fr-scope/images/logo.png
    wget http://2.bp.blogspot.com/-jN5viTz1_2g/VPXblb0yivI/AAAAAAAAx7c/3Y6XG7FoRyI/s1600/icon-metronews.png metronews-fr-scope/images/icon.png

Nous allons ensuite configurer ce scope avec ces quelques infos :

**Configuration du scope :**

-   **Nom d'affichage :** `MetroNews`
-   **Description :** `Scope non-officiel du site metronews.fr`
-   **Auteur :** Nom de l'auteur du scope. Pour moi ce sera `Winael`
-   **Art :** (Nous commenterons cette clé pour le moment tant que nous n'avons pas créer de copie d'écran)
-   **Icone :** `images/icon.png` (Notre image icône précédement téléchargée)
-   **Aide visuelle pour la recherche :** `Rechercher dans MetroNews` (ce texte s'affichera quand l'utilisateur voudra faire une recherche)
   
**Apparence du scope :**

-   **Couleur de premier plan :** `#272727`
-   **Couleur du bouton de prévisualisation :** `#087437`
-   **Logo pour l'entête :** `images/logo.png`(Notre image logo précédement téléchargée)
-   **Couleur d'arrière plan de l'entête :** `#087437`
-   **Couleur de premier plan de l'entête :** `#FFFFFF`
-   **Couleur du diviseur :** `#F1F2F3`
-   **Couleur de la barre de navigation :** `#087437`

Nous allons utiliser la commande intégrée `edit` de `scopecreator` pour modifier le `branding` de notre scope.   

    scopecreator edit branding

Cela va avoir pour effet d'ouvrir le fichier `metronews-fr-scope/metronews-fr-scope.vinzjobard_metronews-fr-scope.ini` via l'éditeur `nano` par défaut

Nous aurons donc le fichier `metronews-fr-scope/metronews-fr-scope.vinzjobard_metronews-fr-scope.ini` suivant après édition :

    [ScopeConfig]
    DisplayName=MetroNews
    Description=Scope non-officiel du site metronews.fr
    Author=Winael
    #Art=images/screenshot.png
    Icon=images/icon.png
    SearchHint=Rechercher dans MetroNews
    
    [Appearance]
    ForegroundColor=#272727
    PreviewButtonColor=##087437
    PageHeader.Logo=images/logo.png
    PageHeader.Background=color:///#087437
    PageHeader.ForegroundColor=#FFFFFF
    PageHeader.DividerColor=#F1F2F3
    PageHeader.NavigationBackgroundColor=color:///#087437
    
Sauvegardons (`<Ctrl>+O`, `<Entrée>`), puis quittons l'édition du fichier (`<Ctrl>+X`).

### <a name="44"></a>4.4. Configuration des flux du scope

Maintenant nous allons configurer ce scope avec [les flux disponibles](#32) :

-   **Etiquette :** Dernières actualités
-   **ID :** http://www.metronews.fr/rss.xml

Nous allons utiliser la commande intégrée `edit` de `scopecreator` pour modifier les `channels` (canaux) de notre scope.   

    scopecreator edit branding

Cela va avoir pour effet d'ouvrir le fichier `metronews-fr-scope/feeds.json` via l'éditeur `nano` par défaut.

Nous aurons donc le fichier `metronews-fr-scope/feeds.json` suivant après édition :

    [
        {
            "label": "Dernières actualités",
            "id": "http://www.metronews.fr/rss.xml"
        }
    ]
    
<<<<<<< HEAD
<<<<<<< HEAD
### 4.5. Génération du package
=======
### <a name="45"></a>4.5. Génération du package
>>>>>>> 76305113a960354127782f73ad7475feebbaa6b2
=======
### <a name="45"></a>4.5. Génération du package
>>>>>>> 76305113a960354127782f73ad7475feebbaa6b2

Si vous avez un téléphone sous Ubuntu, tel un Ubuntuphone, ou un Nexus 4, il vous suffit de brancher votre téléphone sur votre PC via un câble USB, de le déverrouiller, puis de lancer `scopecreator`avec l'option `build`

    scopecreator build
    
Un package click sera généré et installé directement sur votre téléphone.

Vous devriez donc voir apparaitre votre scope dans la liste des scopes installés

![Le scope Metronews est présent dans la liste des scopes installés](https://github.com/Winael/scopes/blob/master/metronews-fr-scope/metronews-fr-scope/images/screenshot20150208_140231438.png)

Voici un aperçu de notre scope :

![Screenshot1](https://github.com/Winael/scopes/blob/master/metronews-fr-scope/metronews-fr-scope/images/screenshot20150208_140251911.png)
![Screenshot2](https://github.com/Winael/scopes/blob/master/metronews-fr-scope/metronews-fr-scope/images/screenshot20150308_140304466.png)
![Screenshot3](https://github.com/Winael/scopes/blob/master/metronews-fr-scope/metronews-fr-scope/images/screenshot20150308_140318392.png)
![Screenshot4](https://github.com/Winael/scopes/blob/master/metronews-fr-scope/metronews-fr-scope/images/screenshot20150308_140348174.png)

Il est temps de publier notre scope

<<<<<<< HEAD
<<<<<<< HEAD
### <a name="45"></a>4.5. Publication du scope
=======
### <a name="46"></a>4.6. Publication du scope
>>>>>>> 76305113a960354127782f73ad7475feebbaa6b2
=======
### <a name="46"></a>4.6. Publication du scope
>>>>>>> 76305113a960354127782f73ad7475feebbaa6b2

Pour publier son scope dans la logithèque d'Ubuntu, il faut [se rendre dans son espace personnel du portail des developpeurs Ubuntu](https://myapps.developer.ubuntu.com/dev/click-apps/ "Espace personnel sur le portail des developpeurs Ubuntu")

- Cliquer sur *« New Application »*

![New Application](https://github.com/Winael/scopes/blob/master/img/Capture.png)

- Charger le click package

![Charger le package click](https://github.com/Winael/scopes/blob/master/img/Capture-1.png)

- Choisir sa catégorie, précisez l'adresse de support (peut être un mailto:adresse@email.com), et le type de licence

![Choisir la catégorie](https://github.com/Winael/scopes/blob/master/img/Capture-2.png)

- Définir des mots-clés pour trouver facilement votre application dans la logithèque. Ici on pourra utiliser les mots-clés *scopes*, *news*, *actualités*

![Définissez les mots-clés]
(https://github.com/Winael/scopes/blob/master/img/Capture-4.png)

- Choisir son icône en 256x256. Normalement l'icône `icon.png` dans `metronews-fr-scope/metronews-fr-scope/images` devrait faire l'affaire

![Choisir l'icône](https://github.com/Winael/scopes/blob/master/img/Capture-5.png)

- Choisir le prix de son application

![Choisir le prix de l'application](https://github.com/Winael/scopes/blob/master/img/Capture-6.png)

- Soumettez votre application

![Soumettez votre application](https://github.com/Winael/scopes/blob/master/img/Capture-7.png)

Si tout se passe bien, votre application devrait être validée dans la foulée et prête à être publiée.

Amusez-vous bien
