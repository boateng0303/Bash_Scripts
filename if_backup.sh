#!/bin/bash



#Define array of files to back up

files_to_backup=(
    /"home/ec2-user/if.sh"
    /"home/ec2-user/README.md"

)


#Define the backup detination

backup_destination="/home/ec2-user/backup"


#Create backup destination directiory if it doesnot exit
mkdir -p ${backup_destination}


#Get current Date and time for backup filename

timestamp=$(date +'%Y%m%d%H%M%S')

#Define  the backup filename

backup_filename="file_backup_$timestamp.tar.gz"


#Define full path of backup filename

backup_path="${backup_destination}/${backup_filename}"


#create the tar.gz archive containing all files

tar -czvf "$backup_path" "${files_to_backup[@]}"


#print message to indicate backup is complete

echo "Backup files completed successfully Archive saved as $back_path"