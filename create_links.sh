#!/bin/bash

src_list='bashrc aliases gitconfig gitignore vimrc vim/functionsrc vim/commandsrc vim/mappingsrc vim/pluginsrc'
for src in ${src_list}
do
   echo  "Creating back up of ${HOME}/.${src} in ${HOME}/${src}_config-files.bak"
	cp -L                      ${HOME}/.${src}    ${HOME}/${src}_config-files.bak
   echo             "Deleting ${HOME}/.${src}"
	rm -f                      ${HOME}/.${src}
   echo "Creating new link of ${HOME}/.${src} pointing to ${PWD}/${src}"
	ln -s ${PWD}/${src}        ${HOME}/.${src}
   echo ""
done
