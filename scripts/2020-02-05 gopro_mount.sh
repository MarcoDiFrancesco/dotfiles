# Mount GoPro with simple-mtpfs
# MOUNT_DIR set in ~/.zshenv

GOPRO_MOUNT_DIR="$MOUNT_DIR/GoPro"

if [[ $(simple-mtpfs -l) = *1:\ GoPro* ]]
then
  mkdir $GOPRO_MOUNT_DIR/GoPro
  simple-mtpfs --device 1 $GOPRO_MOUNT_DIR
  cd $GOPRO_MOUNT_DIR
  exec zsh
else
  echo "GoPro device not detected in port 1"
fi
