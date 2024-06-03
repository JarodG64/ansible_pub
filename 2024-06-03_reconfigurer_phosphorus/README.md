# Reconfigurer PHOSPORUS

Partir d'un dietpi-backup de MAGNESIUM. Ajuster la configuration ip et hostname pour PHOSPHORUS. Faire un dietpi-backup de ce PHOSPHORUS sur clef USB pour pouvoir repartir de cette configuration de base en cas de grosse erreur.

## Archivage :

Creer une archive contenant la configuration de SFPG. Ne pas oublier le fichier */var/www/index.html* de redirection automatique.  
Archiver a part les fichiers affiches par SFPG.

## dietpi-software :

```bash
sudo dietpi-software <cmd> <id>
```

### uninstall :

+ 50 (Syncthing)
+ 56 (SFPG)
+ 83 (Apache)
+ 89 (PHP)
+ 205 (Homer)

### install :
+ 109 (NFS server)
+ 134 (Docker compose)
+ 162 (Docker)

## apt :
### install :
+ curl
+ duf
+ eza => Installation necessite la mise en place du depot
+ lf
+ htop
+ ncdu
+ ufw => Proceder a la configuration des ports apres installation

### uninstall :
+ nala => mode purge pour la config mais ne pas enlever le depot
+ neofetch

## Utilisateur :

Creer un utilisateur *mdp* appartenant aux groupes sudo, dietpi et docker. Cet utilisateur doit aussi avoir les droits "sudo" sans mot de passe. Penser a adapter le fichier */home/mdp/.bashrc* pour le systeme dietpi (pas de **neofetch**).

## Dossier :
Creer le dossier */opt/docker/* pour y stocker les fichiers des conteneurs.
