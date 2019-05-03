# Navigation
function ..	; cd .. ; end
function ...	; cd ../.. ; end
function ....	; cd ../../.. ; end
function .....	; cd ../../../.. ; end

alias vim "nvim"

alias pbcopy 'xclip -selection clipboard'
alias pbpaste 'xclip -selection clipboard -o'

alias c "clear"


alias pc "proxychains4"


set v2rayPath "~/SoftW/v2ray-v2.42-linux-32"
# alias v2ray "$v2rayPath/v2ray -config $v2rayPath/vpoint_socks_vmess.json"
# alias v2 "v2ray 2>> ~/Log/v2ray.log &"


function tree1; tree --dirsfirst -ChFLQ 1 $argv; end
function tree2; tree --dirsfirst -ChFLQ 2 $argv; end
function tree3; tree --dirsfirst -ChFLQ 3 $argv; end
function tree4; tree --dirsfirst -ChFLQ 4 $argv; end
function tree5; tree --dirsfirst -ChFLQ 5 $argv; end
function tree6; tree --dirsfirst -ChFLQ 6 $argv; end

alias i3config "nvim ~/.config/i3/config"
alias vfon "vf activate"
alias deactivate "vf deactivate"
alias update "sudo pacman -Syu"
