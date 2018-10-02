# Référentiels SIG 

Il s'agit des INSERT SQL pour peupler la base de données Kollect avec :
- *communes* : les périmètres des communes à jour des modifications au 1er avril 2018, 
- *comsaisie* : la géométrie des emprises communales permettant la saisie au point x/y (à l'aide d'un click sur la carte lors de la saisie d'une observation).

# Source des données

Il s'agit des données ADMIN EXPRESS fournies par l'IGN. Elles sont sont sous "licence ouverte" version 2.0 : [Plus d'information sur le site de l'IGN](http://professionnels.ign.fr/adminexpress) et [sur le site d'ETALAB.gouv](https://www.etalab.gouv.fr/wp-content/uploads/2017/04/ETALAB-Licence-Ouverte-v2.0.pdf).

Pour la table *comsaisie*, nous conseillons néanmoins d'utiliser des données plus précises issues par exemple de la [BD TOPO de l'IGN (données payantes)](http://professionnels.ign.fr/bdtopo).

# Insérer les données

Par défaut à l'installation, le référentiel se peuple avec la liste des anciennes communes. 

Le remplacement avec les nouvelles communes doit se faire avant toute saisie (à cause des clés étrangères présentes dans la base de données). 


Ouvrir un terminal avec l'utilisateur courant (non-root) et cloner le git dans votre répertoire

```
cd ~ && git clone https://github.com/dsi-cen/kollect-referentiel-sig.git
```

Se connecter à la base de données 
 
```
psql -h localhost -p 5432 -U USER KDB
```

Vider la table *commune* pour y insérer la mise à jour (adapter les chemins avec le nom de votre utilisateur)
**N'insérer que les départements correspondants à l'emprise sélectionnée à l'installation !**

```
\i /home/user/kollect-referentiel-sig/commune/TRUNCATE_commune.sql
\i /home/user/kollect-referentiel-sig/commune/commune_2018_24.sql
\i /home/user/kollect-referentiel-sig/commune/commune_2018_33.sql
\i ... 
```

Créer la table *comsaisie* et insérer la mise à jour, **n'insérer que les départements correspondants à l'emprise sélectionnée à l'installation !**

```
\i /home/user/kollect-referentiel-sig/comsaisie/CREATE_comsaisie.sql
\i /home/user/kollect-referentiel-sig/comsaisie/comsaisie_2018_24.sql
\i /home/user/kollect-referentiel-sig/comsaisie/comsaisie_2018_33.sql
\i ... 
```

# Affichage du bilan

Après l'insertion du nouveau référentiel, vérifier le bon affichage de la carte dans l'onglet **BILAN** de Kollect. 

En effet, selon l'emprise de votre application Kollect, il est possible que la carte bilan ne s'affiche pas (erreur 500). Les nouvelles géométries étant plus précises, il faudra alors augmenter la taille de votre mémoire dans votre `php.ini` : [plus de précisions dans la documentation](https://docs.kollect.fr/installation/#chargement-des-communes-sur-le-bilan).