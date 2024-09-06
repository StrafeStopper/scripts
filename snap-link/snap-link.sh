# run this when you install new snap packages
# zsh somehow broke snap PATH linking
# this will copy snap links into the main applications directory
# you need to run this as root (sudo)
cp -a /var/lib/snapd/desktop/applications/. /usr/share/applications/
