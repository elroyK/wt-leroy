# PROJET DOCKER

### 1. Mettre à jour Ubuntu

SERVEUR DISTANT
```bash
apt-get update
apt-get upgrade
adduser (...)
usermod -aG sudo chris
usermod -aG docker chris
sudo do-release-upgrade -d
```
`do-release-upgrade` important pour MAJ kernel pour réseau virtuel de Docker (reverse-proxying).

### 2. Générer pair de clés RSA
LOCAL
```bash
ssh-keygen -t rsa -b 4096 -f ./id_rsa
ssh-copy-id ./id_rsa chris@151.80.119.139
```

> Désactiver l'authentification en password clair
Modification via VIM du fichier /etc/ssh/sshd_config

### OPTIONNEL - Installer Zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

### 3. Créer image web
Voir web/Dockerfile
```bash
docker build -t chris/web:latest .
```

### 4. Lancer image web
Voir web/run.sh
__Faire attention à l'écrasement des données de volumes dans le container__.
```bash
docker cp web:/etc/apache ./etc
docker cp web/etc/ssl ./ssl
```

### 5. Lancer image DNS
Voir bind/run.sh
+ Accéder à https://vps375407.ovh.net:10000/ , onglet serveur BIND
+ Créer zone leroy.ephec-ti.be avec master NS en ns.leroy.ephec-ti.be
+ Créer un A record en www.leroy.ephec-ti.be vers 151.80.119.139
+ Créer 2 CNAME de b2b & intranet vers www
+ Appliquer la configuration
+ (optionnel) Modifier fichier /etc/hosts en attendant le __glue record__

### 6. Mettre à jour Apache
Voir web/run.sh
+ Détruire image
+ Supprimer port mapping (sera dans le reverse proxy nginx)
+ Créer 3 virtual hosts dans etc/sites-availables
+ `docker exec web a2ensite www`
+ `docker exec web a2ensite b2b`
+ `docker exec web a2ensite intranet`
+ `docker exec web a2ensite service apache2 reload`
+ (optionnel si envie de désactiver) `docker exec web a2dissite b2b`
+ Modification du fichier etc/ports/conf avec `listen 80` qui devient `listen 8080`

### 7. Mise en place reverse proxy
Voir reverse-proxy/run.sh
+ `cp etc/conf.d/default.conf etc/conf.d/[www|b2b|intranet].conf`
+ Modification des fichiers créés pour le reverse proxying (`location / { proxy-pass 10.20.30.50:8080; }`)
+ `docker exec reverse-proxy service nginx reload`
