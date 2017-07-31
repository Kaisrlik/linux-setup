# get the path to this script
MY_PATH=`dirname "$0"`
MY_PATH=`( cd "$MY_PATH" && pwd )`

package=tmux tmuxinator vim urxvt i3 vimtex ranger vimiv athame

# define paths
APPCONFIG_PATH=$MY_PATH/appconfig

all: git_init install_packages
	echo Missing rules git_path tmux bash
	toilet All Done

git_init:
	git pull
	git submodule update --init --recursive

# install packages
install_packages:
	sudo apt-get -y update
	sudo apt-get -y remove vim-*
	sudo apt-get -y install cmake cmake-curses-gui ruby git sl htop git indicator-multiload \
		figlet toilet gem ruby build-essential tree exuberant-ctags libtool automake	\
	       	autoconf autogen libncurses5-dev python3-dev python2.7-dev libc++-dev clang-3.8	\
	       	clang-format openssh-server pandoc xclip xsel python-git vlc pkg-config
	# for mounting exfat
	sudo apt-get -y install exfat-fuse exfat-utils

# in the future it will be so much sofisticated
${package}:
	echo Doing following rule: $@
	bash $${APPCONFIG_PATH}/$@/install.sh

#############################################
# adding GIT_PATH variable to .bashrc 
#############################################
#git_path:
#	# add variable for path to the git repository
#	# TODO: Rewrite it to makefile format "ifeq ($(shell test -e $(FILE) && echo -n yes), yes)" 
#	num=`cat ~/.bashrc | grep "GIT_PATH" | wc -l` 		\ 
#	if [ "$num" -lt "1" ]; then				\
#		TEMP=`( cd "$MY_PATH/../" && pwd )`		\
#		echo "Adding GIT_PATH variable to .bashrc"	\
#		echo "						\
#		# path to the git root				\
#		export GIT_PATH=$TEMP" >> ~/.bashrc		\
#	fi
#
#	#############################################
#	# add tmux sourcing of dotbashrd to .bashrc
#	#############################################
#tmux:
#	num=`cat ~/.bashrc | grep "RUN_TMUX" | wc -l` 	\
#	if [ "$num" -lt "1" ]; then			\
# 		default=y				\
#	  	while true; do				\
#			[[ -t 0 ]] && { read -t 10 -n 2 -p $'\e[1;32mDo you want to run TMUX automatically with every terminal? [y/n] (default: '"$default"$')\e[0m\n' resp || resp=$default ; } \
#			if [[ $response =~ ^(y|Y)=$ ]]	\
#			then				\
#				echo "			\
#				export RUN_TMUX=true" >> ~/.bashrc	\
#				echo "Setting variable RUN_TMUX to true" 	\
#				break						\
#			elif [[ $response =~ ^(n|N)=$ ]]			\
#			then							\
#				echo "						\
#				export RUN_TMUX=false" >> ~/.bashrc		\
#				echo "Setting variable RUN_TMUX to false"	\
#				break						\
#			else							\
#				echo " What? \"$resp\" is not a correct answer. Try y+Enter."	\
#			fi	\
#  		done		\
#	fi
#
##############################################
## creating .vimpath file 
##############################################
#
## path for ctags
## path for file search
#
##############################################
## add sourcing of dotbashrd to .bashrc
##############################################
#bash:
#	num=`cat ~/.bashrc | grep "dotbashrc" | wc -l` 			\
#	if [ "$num" -lt "1" ]; then					\
#  		echo "Adding source to .bashrc"				\
#  		echo "							\
#		source $APPCONFIG_PATH/bash/dotbashrc" >> ~/.bashrc	\
#	else								\
#  		echo "Reference in .bashrc is already there..."		\
#	fi
#	bash ~/.bashrc
#
