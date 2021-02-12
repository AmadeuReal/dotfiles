export ZSH="/Users/amadeu.demartos/.oh-my-zsh"

ZSH_THEME="powerlevel9k/powerlevel9k"
ZSH_DISABLE_COMPFIX=true

ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"


plugins=(
  git
  zsh-autosuggestions
  yarn 
  web-search 
  jsontools
  macports
  node 
  osx 
  sudo
  thor
  docker
)

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Reload the plugin to highlight the commands each time Iterm2 starts 
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Visual customisation of the second prompt line
local user_symbol="$"
if [[ $(print -P "%#") =~ "#" ]]; then
    user_symbol = "#"
fi

source $ZSH/oh-my-zsh.sh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


# Colorise the top Tabs of Iterm2 with the same color as background
# Just change the 18/26/33 wich are the rgb values 
echo -e "\033]6;1;bg;red;brightness;18\a"
echo -e "\033]6;1;bg;green;brightness;26\a"
echo -e "\033]6;1;bg;blue;brightness;33\a"

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon context battery dir vcs root_indicator)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status time dir_writable ip custom_wifi_signal ram command_execution_time)

POWERLEVEL9K_PROMPT_ON_NEWLINE=true

POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="❱  "

#POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
#POWERLEVEL9K_USER_ICON="\uF415" # 
POWERLEVEL9K_ROOT_ICON="\uF09C"
#POWERLEVEL9K_SUDO_ICON=$'\uF09C' # 

POWERLEVEL9K_VCS_GIT_HOOKS=(vcs-detect-changes git-untracked git-aheadbehind git-remotebranch git-tagname)

#cenas

POWERLEVEL9K_CUSTOM_WIFI_SIGNAL="zsh_wifi_signal"
POWERLEVEL9K_CUSTOM_WIFI_SIGNAL_BACKGROUND="white"
POWERLEVEL9K_CUSTOM_WIFI_SIGNAL_FOREGROUND="black"

zsh_wifi_signal(){
        local output=$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport -I)
        local airport=$(echo $output | grep 'AirPort' | awk -F': ' '{print $2}')

        if [ "$airport" = "Off" ]; then
                local color='%F{black}'
                echo -n "%{$color%}Wifi Off"
        else
                local ssid=$(echo $output | grep ' SSID' | awk -F': ' '{print $2}')
                local speed=$(echo $output | grep 'lastTxRate' | awk -F': ' '{print $2}')
                local color='%F{black}'

                [[ $speed -gt 100 ]] && color='%F{black}'
                [[ $speed -lt 50 ]] && color='%F{red}'

                echo -n "%{$color%}$speed Mbps \uf1eb%{%f%}"
        fi
}

POWERLEVEL9K_CONTEXT_TEMPLATE='%n'
POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND='white'

POWERLEVEL9K_BATTERY_CHARGING='yellow'
POWERLEVEL9K_BATTERY_CHARGED='green'
POWERLEVEL9K_BATTERY_DISCONNECTED='$DEFAULT_COLOR'
POWERLEVEL9K_BATTERY_LOW_THRESHOLD='10'
POWERLEVEL9K_BATTERY_LOW_COLOR='red'
POWERLEVEL9K_BATTERY_STAGES=($'\u2581 ' $'\u2582 ' $'\u2583 ' $'\u2584 ' $'\u2585 ' $'\u2586 ' $'\u2587 ' $'\u2588 ')
POWERLEVEL9K_BATTERY_ICON='\uf1e6 '

POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='red'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='yellow'

POWERLEVEL9K_SHORTEN_DIR_LENGTH=3

POWERLEVEL9K_TIME_FORMAT="%D{\uf017 %H:%M \uf073 %d/%m}"
POWERLEVEL9K_TIME_BACKGROUND='white'
POWERLEVEL9K_RAM_BACKGROUND='yellow'

POWERLEVEL9K_LOAD_CRITICAL_BACKGROUND="white"
POWERLEVEL9K_LOAD_WARNING_BACKGROUND="white"
POWERLEVEL9K_LOAD_NORMAL_BACKGROUND="white"
POWERLEVEL9K_LOAD_CRITICAL_FOREGROUND="red"
POWERLEVEL9K_LOAD_WARNING_FOREGROUND="yellow"
POWERLEVEL9K_LOAD_NORMAL_FOREGROUND="black"

POWERLEVEL9K_LOAD_CRITICAL_VISUAL_IDENTIFIER_COLOR="red"
POWERLEVEL9K_LOAD_WARNING_VISUAL_IDENTIFIER_COLOR="yellow"
POWERLEVEL9K_LOAD_NORMAL_VISUAL_IDENTIFIER_COLOR="green"

POWERLEVEL9K_HOME_ICON=''
POWERLEVEL9K_HOME_SUB_ICON=''
POWERLEVEL9K_FOLDER_ICON=''

POWERLEVEL9K_STATUS_VERBOSE=true
POWERLEVEL9K_STATUS_CROSS=true

# Alias
alias cls="clear"
alias down="cd ~/Downloads"
alias ..="cd .."
alias ....="cd ../.."

alias look="sudo find . -name"
alias search="sudo grep --color -rnw ./ -e "
alias ports="sudo lsof -PiTCP -sTCP:LISTEN"

alias xclip="xclip -selection c"

alias speedtest="wget -O /dev/null cachefly.cachefly.net/100mb.test"
alias suroot='sudo -E -s'
alias sfab='env SKIP_FASTFILE_IMPORT="true" bundle exec fastlane change_tenant tenant:Browns'
alias sfatb='env SKIP_FASTFILE_IMPORT="true" bundle exec fastlane change_tenant tenant:ThomBrowne'
alias sfac='env SKIP_FASTFILE_IMPORT="true" bundle exec fastlane change_tenant tenant:Chanel'
alias sfam='env SKIP_FASTFILE_IMPORT="true" bundle exec fastlane change_tenant tenant:Matarazzo'

alias bi='bundle install && bundle exec pod install'
alias tailor='~/workspace/sfa/scripts/Mocks/mock_creator.rb' 

alias rba='launchctl reboot apps' #Reboot apps
alias xc='open -a Xcode *.xcworkspace' #Will open .xcworkspace file
POWERLEVEL9K_VCS_BRANCH_ICON=$'\uF126 '
POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=$'\uE0B1'
POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=$'\uE0B3'

# `vcs` color customization
POWERLEVEL9K_VCS_CLEAN_FOREGROUND='green'
POWERLEVEL9K_VCS_CLEAN_BACKGROUND='black'
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='yellow'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='black'
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='red'
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='black'

# `vi_mode` color customization
POWERLEVEL9K_VI_MODE_INSERT_FOREGROUND='teal'


export LSCOLORS=""
export PROMPT_COMMAND="history -a; history -n"
export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"
export PATH="$PATH:/Users/amadeu.demartos/bin"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
