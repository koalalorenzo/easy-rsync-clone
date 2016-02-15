# easy-rsync-clone
Easy to use shell script to clone files into an external device.

### Features

  * Using rsync to replace only files that changed.
  * Checksum to verify files (sha256).
  * GPG/PGP Signature to verify the authenticity of the hashes.

### Installation

  1. *Clone* this repository, or *copy* its content into the device that will store all the copy of your files.
  2. Edit `directories.list` : Add the full path of the directories you want to clone.
  3. Edit `exclude.list` : Add the name of the files and directories that you don't want to clone.
  4. (*optional*) Edit `rsync-clone.sh` and add new features!

### Usage
To run a backup just double-click (Mac) the `rsync-clone.sh` script, or just open a new terminal on the device and run it.
Treat your self with a tea or coffee because the first time it may take some time according to what you are cloning.
