#!/usr/bin/env bash
read -p "==== Quer configurar o SSH? s/n ====
" shh
if [ "$shh" == "s" ] || [ "$shh" == "S" ]; then
  read -p "==== Qual seu email? ====
  " EMAIL
  read -p "==== Qual seu nome? ====
  " NAME
  git config --global user.name `$NAME`
  git config --global user.email `$EMAIL`
  ssh-keygen -t rsa -b 4096 -C `$EMAIL`
  eval "$(ssh-agent -s)"
  ssh-add ~/.ssh/id_rsa
fi
echo "Só colar, a chave está no seu clipboard!"
xclip -sel clip < ~/.ssh/id_rsa.pub
exit 0
