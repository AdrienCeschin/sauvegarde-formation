#!/bin/sh

set -u # en cas de variable non définie, arreter le script
set -e # en cas d'erreur (code de retour non-zero) arreter le script

# Afficher de l'aide
ws_help() {
	1>&2 echo "Usage: sh jenkins_server_setter.sh" 
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

# A function checking if disk sdX has a partition
jss_disk_has_partition() {
	disk_name="${1:-}"
	partitions_and_disk_number=cat /proc/partitions | grep $disk_name | wc -l
	partition_number=$partitions_and_disk_number-1
	test $partition_number -ne 0
}

jss_disk_size() {
	disk_name="${1:-}"
	disk_space=0
	cat /proc/partitions | grep $disk_name$ | while read major minor blocks name
	do
		$disk_space=$disk_space+$blocks
	done
	echo $disk_space
}

jss_disk_can_have_wanted_partition() {
	disk_name="${1:-}"
	
	used_space=0
	disk_space=jss_disk_size $disk_name
	
	partitions_and_disk_number=cat /proc/partitions | grep $disk_name | wc -l
	partition_table=cat /proc/partitions | grep $disk_name | grep-v $disk_name$ | grep -n
	for i in "seq 2 $partitions_and_disk_number";
	do
		cat /proc/partitions | grep $disk_name | while read major minor blocks name
		do
			$used_space=$used_space+$blocks
		done
	done
	
	if [ $disk_space-$used_space -lt 5242880 ]; then
		1>&2 echo "ERROR: not enough space remaining on disk "$disk_name" to create the wanted partition"
		exit 1
	fi
}	

jss_write_partition() {
}

jss_create_partition() {
	disk_name="${1:-}"
	
	if [ -z "$disk_name" ]; then
		1>&2 echo "ERROR: the expected disk does not exist"
		exit 1
	fi	
	
	if [ jss_disk_size $disk_name -lt 5242880 ]; then
			1>&2 echo "ERROR: this disk is not big enough to create the expected partition"
			exit 1
	fi
	
	if [ jss_disk_has_partition $disk_name ]; then
		jss_disk_can_have_wanted_partition $disk_name
		jss_write_partition $disk_name
	else
		jss

# Une fonction qui vérifie si un package est installé
# et qui sinon l'installe
ws_install_package() {
	PACKAGE_NAME="$1"
	if ! dpkg -l |grep --quiet "^ii.*$PACKAGE_NAME " ; then 
		apt-get install -y "$PACKAGE_NAME"
	fi

}