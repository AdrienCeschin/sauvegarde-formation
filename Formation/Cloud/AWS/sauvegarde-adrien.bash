
#!/bin/bash

# date du jour
backupdate=$(date +%Y-%m-%d)

#répertoire de backup
dirbackup=/backup/backup-$backupdate

# création du répertoire de backup
/bin/mkdir $dirbackup

# tar -cjf /destination/fichier.tar.bz2 /source1 /source2 /sourceN
# créé une archive bz2
# sauvegarde de /home
/bin/tar -cjf $dirbackup/home-$backupdate.tar.bz2 /home

# sauvegarde mysql
/usr/bin/mysqldump --user=xxxx --password=xxxx --all-databases | /usr/bin/gzip > $dirbackup/mysqldump-$backupdate.sql.gz

# configure aws credentials to allow connection to the bucket
aws configure set aws_access_key_id xxxx
aws configure set aws_secret_access_key yyyy

#create the bucket if it does not exist already

if aws s3 mb s3://$dirbackup ; then
	echo "bucket created"
else
	echo "bucket already exists"
fi

# copy the two files to the bucket
aws s3 cp $dirbackup/home-$backupdate.tar.bz2 s3://$dirbackup
aws s3 cp $dirbackup/mysqldump-$backupdate.sql.gz s3://$dirbackup

aws s3 ls s3://$dirbackup | while read day hour size name
do
	file_date=$day' '$hour
	file_date_timestamp=$(date -d "$file_date" +"%s")
	current_date_timestamp=$(date +%s)
	if [ $(($current_date_timestamp-$file_date_timestamp)) -gt 604800 ]; then
		aws s3 rm s3://$dirbackup/$file
	fi
done