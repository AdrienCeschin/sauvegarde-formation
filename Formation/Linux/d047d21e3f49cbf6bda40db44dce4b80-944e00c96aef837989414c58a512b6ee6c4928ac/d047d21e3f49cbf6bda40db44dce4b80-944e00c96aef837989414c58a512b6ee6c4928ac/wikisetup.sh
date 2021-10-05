#!/bin/sh

### PARANOIA MODE
set -u # en cas de variable non définie, arreter le script
set -e # en cas d'erreur (code de retour non-zero) arreter le script

### UTILITIES ###
# fonctions, variables, etC.
# afin d'éviter les collisions, je vais préfixer mes fonctions par ws_
DOMAIN_NAME=""
DOKUWIKI_URL="https://download.dokuwiki.org/src/dokuwiki/dokuwiki-stable.tgz"
DOKUWIKI_MD5="8867b6a5d71ecb5203402fe5e8fa18c9"

# Afficher de l'aide
ws_help() {
	1>&2 echo "Usage: wikisetup.sh DOMAIN" 
	1>&2 echo "" 
}

# Vérifier que le script est lancé en tant que root
ws_assert_root() {
	REAL_ID="$(id -u)"
	if [ "$REAL_ID" -ne 0 ]; then 
		1>&2 echo "ERROR: This script must be run as root" 
		exit 1
	fi
}

# Une fonction qui vérifie si un package est installé
# et qui sinon l'installe
ws_install_package() {
	PACKAGE_NAME="$1"
	if ! dpkg -l |grep --quiet "^ii.*$PACKAGE_NAME " ; then 
		apt-get install -y "$PACKAGE_NAME"
	fi

}

ws_dokuwiki_zip_download() {
	if ! wget -O /usr/src/dokuwiki.tgz "$DOKUWIKI_URL" ; then
		1>&2 echo "ERROR: unable to download dokuwiki"
		# je supprime le fichier partiellement téléchargé
		rm -f /usr/src/dokuwiki.tgz
		exit 1
	fi

	# Verify we play with the expected version
	CURRENT_MD5="$(md5sum /usr/src/dokuwiki.tgz |cut -d' ' -f1)"
	if [ "$CURRENT_MD5" != "$DOKUWIKI_MD5" ]; then
		1>&2 echo "ERROR: dokuwiki checksum does not match v2020-07-29"
		1>&2 echo "       expected $DOKUWIKI_MD5"
		1>&2 echo "       found    $CURRENT_MD5"
		exit 1
	fi
}

ws_dokuwiki_zip_is_present() {
	test -f /usr/src/dokuwiki.tgz
}

ws_dokuwiki_dir_is_present() {
	test -d /usr/src/dokuwiki
}

ws_dokuwiki_dir_extract() {
	cd /usr/src || exit 1
	if ! tar xavf dokuwiki.tgz ; then
		1>&2 echo "ERROR: unable to extract dokuwiki archive"
		rm -fr dokuwiki-2020-07-29
		exit 1
	fi
	mv dokuwiki-2020-07-29 dokuwiki
}

ws_dokuwiki_install() {
	TARGET_DIRECTORY="$1"
	rsync -av /usr/src/dokuwiki/ "$TARGET_DIRECTORY"
}

ws_apache2_datadir_setup() {
	TARGET_DIRECTORY="$1"
	chown -R www-data:www-data "$TARGET_DIRECTORY"
}

ws_apache2_vhost_create (){
	DOMAIN="$1"
	DIRECTORY="/var/www/$1"
	CONFIG_FILE=$(echo "$DOMAIN" |tr '.' '-')
	sed \
		-e "s/#ServerName www.example.com/ServerName $DOMAIN/" \
		-e "s|DocumentRoot /var/www/html|DocumentRoot $DIRECTORY|" \
		< /etc/apache2/sites-available/000-default.conf \
		> "/etc/apache2/sites-available/$CONFIG_FILE.conf"
	a2ensite "$CONFIG_FILE" > /dev/null 
}

ws_host_entry_add() {
	DOMAIN="$1"
	if ! grep -q "127.0.0.1.*$DOMAIN" /etc/hosts ; then
		echo "127.0.0.1 $DOMAIN" >> /etc/hosts
	fi
}

ws_apache2_reload() {
	systemctl stop apache2
	systemctl start apache2
}

ws_create_virtualhost() {
	DOMAIN="$1"
	DIRECTORY="/var/www/$1"

	## Copier le contenu de dokuwiki
	ws_dokuwiki_install "$DIRECTORY"
	ws_apache2_datadir_setup "$DIRECTORY"

	## Créer la configuration du site demandé
	ws_apache2_vhost_create "$DOMAIN"

	## Créer l'entrée hosts du site demandé
	ws_host_entry_add "$DOMAIN"

	## Recharger la configuration de apache
	ws_apache2_reload
}

### ENTRY POINT ###

## Vérifier que le script est lancé en tant que root
ws_assert_root

## Vérifier que le script possède les bons parametres
DOMAIN_NAME="${1:-}"
if [ -z "$DOMAIN_NAME" ]; then
	ws_help
	1>&2 echo "ERROR: Please set DOMAIN parameter"
	exit 1
fi

## Vérifier les prérequis (apache, php, etc.)

## Installer les prérequis si nécessaire (apache, php, etc.)
ws_install_package "apache2"
ws_install_package "php7.3"
ws_install_package "libapache2-mod-php7.3"


## Télécharger et installer dokuwiki
if ! ws_dokuwiki_zip_is_present ; then
	ws_dokuwiki_zip_download
fi
if ! ws_dokuwiki_dir_is_present ; then
	ws_dokuwiki_dir_extract
fi

## Créer le dossier du site demandé
ws_create_virtualhost "$DOMAIN_NAME"

echo "SUCCESS"

