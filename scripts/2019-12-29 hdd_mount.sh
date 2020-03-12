# Mount HDD in one command checking if it's already mounted
# MOUNT_DIR set in ~/.zshenv

HDD_MOUNT_DIR="$MOUNT_DIR/HDD"
DEV_DIR="/dev/sdb1"

if [[ ! -d "${HDD_MOUNT_DIR}" ]]
then
  sudo mkdir -p $HDD_MOUNT_DIR
  sudo mount $DEV_DIR $HDD_MOUNT_DIR
  echo "Munted $DEV_DIR on $HDD_MOUNT_DIR"
  cd $HDD_MOUNT_DIR
  exec zsh
else
  sudo umount $DEV_DIR
  echo "Unmounted $DEV_DIR"
  sudo rmdir $HDD_MOUNT_DIR
fi
