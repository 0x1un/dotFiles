export ZSH="/home/aumujun/.oh-my-zsh"

ZSH_THEME="lambda-mod"
plugins=(
  git
  zsh-autosuggestions
  # zsh-syntax-highlighting
  fast-syntax-highlighting 
)

source $ZSH/oh-my-zsh.sh

autoload -U compinit && compinit -u

source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting-filetypes/zsh-syntax-highlighting-filetypes.zsh

# source ~/SoftWare/zsh-autosuggestions/zsh-autosuggestions.zsh
alias pc="proxychains4"
v2rayPath="~/SoftW/v2ray-v2.42-linux-32"
alias v2ray="$v2rayPath/v2ray -config $v2rayPath/vpoint_socks_vmess.json"
alias v2="v2ray > ~/Log/v2ray.log 2>&1 &"
alias c="clear"
alias wget="wget -c"
alias untar="tar -zxvf"

#######Python虚拟环境#########
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/workspace
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python
source /usr/bin/virtualenvwrapper.sh
#######Python虚拟环境结束#####

#######Java8配置##########
export JAVA_HOME=/opt/Java/Java8 
export JRE_HOME=${JAVA_HOME}/jre
export CLASSPATH=.:${JAVA_HOME}/lib:${JRE_HOME}/lib
export PATH=${JAVA_HOME}/bin:$PATH
######Java8 end....######
alias LinuxBackup="tar -zcvf ArchLinuxBackup.tar.gz --exclude-from=/home/aumujun/excl /"
alias sudo="sudo "
alias archBackup="rsync -aAXv --exclude-from=/home/aumujun/excl --delete / /run/media/aumujun/DATA/BackUp/Arch-Backup"
alias backpkg="rsync -aAXv --progress --delete /var/cache/pacman/pkg/* /run/media/aumujun/DATA/PacmanCache/pkg"
alias ungz="tar zxvf"
alias top="htop"


# export PROJECT_GO=$HOME/Project/Go
# export GOROOT=/usr/lib/go
export GOPATH=$HOME/GoP
export PATH=$PATH:$GOPATH/bin
# z.lua路径跳转工具
eval "$(lua ~/.dotfiles/data/z.lua/z.lua --init zsh)"
eval "$(lua ~/.dotfiles/data/z.lua/z.lua  --init zsh once enhanced)"    # ZSH 初始化
alias zf="z -I"
alias zb="z -b"
alias godns="echo -e 'nameserver 114.114.114.114\nnameserver 114.114.115.115'"
alias zreboot="sync && sleep 3 && reboot"
alias zshutdown="sync && sleep 3 && shutdown -h now"
alias kc="killall -q conky"
alias i3config="vim ~/.config/i3/config"
alias data="ranger /run/media/aumujun/DATA/"
alias ref="exec $SHELL"

alias res="fg %1"

# alias rm=trash
# alias r=trash
# alias rl='ls ~/.local/share/Trash/files/'
# alias ur=recoverfile
# recoverfile()
# {
	# mv -i ~/.local/share/Trash/files/$@ ./
# }
#
# trash()
# {
	# mv $@ ~/.local/share/Trash/files/
# }

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
