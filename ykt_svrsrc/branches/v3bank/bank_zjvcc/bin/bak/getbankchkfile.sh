dzdate=$1
dzfile="/home/bankftp/BANK05${dzdate}.txt"
if [ -f  $dzfile ];then
   echo "filename:${dzfile}"
   exit 0
else
   echo "$dzfile not exist"
   exit 1
fi
