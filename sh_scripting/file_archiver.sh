#!/bin/bash

# for documenting purpose

#$Revision:001$
#$Thu Oct 22 09:51:50 AM +0545 2026$

# Variables to set as needed
DEFAULT_DIR="$HOME/test"  # change this to change default behaviour
MODIFIED_TIME=0 #days
FILE_SIZE=1 #Megabites (MB)
FILE_EXTENSION="*.py" #default for now
MAX_DEPTH=2 # folder and subfolder 


RUN=0 # to denote whether the script's main goal should run or not


# use 1 for interactive 

if [ "$1" == 1 ]
then
    read -p "Folder to consider for archieving :" BASE_DIR
    
    if [[ "$BASE_DIR" == "" ]]
    then 
        echo "Reverting to default directory"
        BASE_DIR="$DEFAULT_DIR"
    fi

else
    BASE_DIR="$DEFAULT_DIR"
fi



# printing base directory
echo "Directory of activity: $BASE_DIR"
echo ""


# ensuring specified base directory exists
if [ ! -d "$BASE_DIR" ]
then 
    echo "$BASE_DIR does not exist"
    echo ""
    exit 1
fi


# Ensuring archive directory exists

if [ ! -d "$BASE_DIR/archive" ]
then 
    echo "Creating Archive Directory"
    mkdir "$BASE_DIR/archive"
    echo ""
    echo "Created Directory : $BASE_DIR/archive"
fi

# -mtime : modified time in days
# -size : M (MB), K (KB), G (GB)
# -type : f (file)
# -name : particular name or pattern
# -iname : for case insensitive name/pattern search
# -maxdepth : how many levels down within files to search

# note : if using this with any files containing spaces (For loop will fail)

for i in $(find "$BASE_DIR" -maxdepth "$MAX_DEPTH" -size +"$FILE_SIZE"M -mtime "$MODIFIED_TIME" -type f -name "$FILE_EXTENSION" )
do 
    # echo $i
    if [ $RUN -eq 0 ]
    then 

        gzip "$i" || exit 1
        mv "$i.gz" "$BASE_DIR/archive" || exit 1 

        echo "[ARCHIEVING]:" 
        echo ""$i" ==> "$BASE_DIR/archive" "
        echo "$(date "+%D %T")"
        echo ""
    fi
done


# use `gunzip <filename>.gz` to unzip
# use `gunzip -k <filename>.gz` to unzip while keeping the original zipped file as it is.