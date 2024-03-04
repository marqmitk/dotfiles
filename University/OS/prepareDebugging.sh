# Write the following in bash script
# 1. Remove /tmp/sweb directory
# 2. Create it and cd into it
# 3. run 'cmake ~/Documents/University/OS/bss24e2/ make'
# 4. run "make debug; make; make qemugdb" in a new terminal

rm -rf /tmp/sweb
mkdir /tmp/sweb
cd /tmp/sweb || exit 255
pwd
cmake ~/Documents/University/OS/bss24e2/
# automatically answer yes if it asks to recursive remove
yes Y | make debug
make
~/Documents/University/OS/startDebugging.sh
