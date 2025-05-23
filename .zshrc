if [[ "$ZPROF" = true ]]; then
  zmodload zsh/zprof
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    fzf
    fzf-tab
    zsh-syntax-highlighting
    zsh-autosuggestions
    docker
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# PATH
export FZF_BASE=/usr/bin/fzf

# ALIASES
alias install='sudo apt install -y'
alias update='sudo apt upgrade -y && sudo apt autoremove -y && sudo snap refresh'
alias uninstall='sudo apt remove'
alias clean='sudo apt clean && sudo apt autoremove'
alias fix='sudo apt install -f'
alias moo='apt moo'
alias tux='cowsay -f tux'
alias cls='clear'
alias cd..='cd ..'
alias reload='source ~/.zshrc'
alias venv='uv venv env'
alias activate='source ./*env/bin/activate'
alias cpwd='pwd && pwd | xclip -selection clipboard'
alias copy='xclip -selection clipboard'
alias ccat='pygmentize -g -O linenos=1'
alias submodule='git submodule update --init --recursive'
alias ls='eza'
alias ll='eza -alh'
alias bat='batcat'
alias b='bat'
alias fzfc='fzf | xclip -selection clipboard'
alias czsh='code ~/.zshrc'
alias ckitty='code ~/.config/kitty'
alias s='search'
alias coin='toss-a-coin'
alias lg='lazygit'
alias ros='source /opt/ros/jazzy/setup.zsh'
alias req='pip install -r requirements.txt'
alias pip='uv pip'
alias notify='notify-send Finalizado acabou'
alias upload='curl bashupload.com -T '
alias shared='cd $SHARED_PATH'
alias nvm='fnm'
alias gj='gitmoji'

function reclone() {
    repo_url=$(git remote get-url origin)
    branch_name=$(git symbolic-ref --short HEAD)
    repo_directory=$(pwd)

    if [ -n "$repo_url" ] && [ -n "$branch_name" ]; then
        cd ..
        rm -rf $repo_directory
        git clone $repo_url
        cd $repo_directory
        git checkout $branch_name
        git pull
    else
        echo "Não foi possível determinar o link remoto ou a branch atual."
    fi
}

# Funções
function alert() {
    local last_command_status=$?
    local icon
    local title
    local message

    # Define ícone e título com base no status do último comando
    if [ $last_command_status -eq 0 ]; then
        icon="dialog-information"
        title="✅ Sucesso"
    else
        icon="dialog-error"
        title="❌ Erro"
    fi

    # Pega o último comando sem metadados e remove "; alert"
    message=$(tail -n1 ~/.zsh_history | sed -E 's/^.*;([^;]+)\; alert$/\1/')

    # Envia a notificação
    notify-send -i "$icon" "$title" "$message"
}

## TODO: Ver isso com Kitty
# # Configura atalhos para executar scripts Python no diretório $HOME/scripts
# for file in $SCRIPTS_PATH/*.py; do
#     name=$(basename "$file" .py)
#     alias $name="$SCRIPTS_PATH/env/bin/python3 \"$file\""
# done

# # Configura atalhos para executar workflows do kitty
# for file in $HOME/.config/kitty/workflows/*.sh; do
#     name=$(basename "$file" .sh)
#     alias $name="source \"$file\""
# done

# Função para compilar e executar C
function compile_c() {
    name=$(ls *.c | head -n 1 | cut -d'.' -f1)
    mkdir -p out
    gcc "$name.c" -o "out/$name.o" -lm
    ./out/$name.o
}

# Função para criar diretório e navegar até ele
function take() {
    mkdir -p "$1"
    cd "$1"
}

function tamper(){
    file_path=$1
    mkdir -p "$(dirname "$file_path")" && touch "$file_path"
}

# Função para apagar o diretório atual e recriá-lo
function retake(){
    dir=$(basename "$(pwd)")
    cd ..
    rm -rf "$dir"
    take "$dir"
}

# Função para clonar repositório e navegar até ele
function clone() {
    git clone "$1"
    cd "$(basename "$1" .git)"
}

# Função para abrir repositório remoto na branch atual
function open_remote() {
    origin_url=$(git remote get-url origin)
    repo_url=$(echo "$origin_url" | grep -o 'github\.com[:/].*\.git' | sed 's/github\.com[:/]\(.*\)\.git/\1/')
    branch_name=$(git symbolic-ref --short HEAD)

    if [ -n "$repo_url" ] && [ -n "$branch_name" ]; then
        url="https://github.com/$repo_url/tree/$branch_name"
        echo "Abrindo repositório remoto na branch atual no navegador: $url"
        open "$url"
    else
        echo "Não foi possível determinar o link remoto ou a branch atual."
    fi
}

# Função para lançar comandos em background
function launch() {
    nohup "$@" &>/dev/null & disown
}

function webm_mp4() {
    if [ $# -eq 0 ]; then
        echo "Uso: webm_mp4 <arquivo.webm>"
        return 1
    fi

    for file in "$@"; do
        if [[ $file == *.webm ]]; then
            output="${file%.webm}.mp4"
            ffmpeg -i "$file" -c:v libx264 -c:a aac "$output"
            echo "Convertido: $file -> $output"
        else
            echo "O arquivo $file não é um .webm"
        fi
    done
}

function cvt_last() {
    lookdir="/home/eduardo-barreto/Videos/Screencasts"

    last_webm=$(ls "$lookdir"/*.webm -snew 2>/dev/null | head -n 1 | tr -d "'")

    if [ -z "$last_webm" ]; then
        echo "Nenhum arquivo .webm encontrado no diretório $dir"
        return 1
    fi

    webm_mp4 "$last_webm"
}

# generate with
# curl -L https://github.com/carloscuesta/gitmoji/raw/master/packages/gitmojis/src/gitmojis.json|jq -r '.gitmojis[] | "\(.emoji):\(.description)"'

gitmojis=$(cat << EOF
🎨: (art) Improve structure / format of the code.
⚡️: (zap) Improve performance.
🔥: (fire) Remove code or files.
🐛: (bug) Fix a bug.
🚑️: (ambulance) Critical hotfix.
✨: (sparkles) Introduce new features.
📝: (memo) Add or update documentation.
🚀: (rocket) Deploy stuff.
💄: (lipstick) Add or update the UI and style files.
🎉: (tada) Begin a project.
✅: (white-check-mark) Add, update, or pass tests.
🔒️: (lock) Fix security or privacy issues.
🔐: (closed-lock-with-key) Add or update secrets.
🔖: (bookmark) Release / Version tags.
🚨: (rotating-light) Fix compiler / linter warnings.
🚧: (construction) Work in progress.
💚: (green-heart) Fix CI Build.
⬇️: (arrow-down) Downgrade dependencies.
⬆️: (arrow-up) Upgrade dependencies.
📌: (pushpin) Pin dependencies to specific versions.
👷: (construction-worker) Add or update CI build system.
📈: (chart-with-upwards-trend) Add or update analytics or track code.
♻️: (recycle) Refactor code.
➕: (heavy-plus-sign) Add a dependency.
➖: (heavy-minus-sign) Remove a dependency.
🔧: (wrench) Add or update configuration files.
🔨: (hammer) Add or update development scripts.
🌐: (globe-with-meridians) Internationalization and localization.
✏️: (pencil2) Fix typos.
💩: (poop) Write bad code that needs to be improved.
⏪️: (rewind) Revert changes.
🔀: (twisted-rightwards-arrows) Merge branches.
📦️: (package) Add or update compiled files or packages.
👽️: (alien) Update code due to external API changes.
🚚: (truck) Move or rename resources (e.g.: files, paths, routes).
📄: (page-facing-up) Add or update license.
💥: (boom) Introduce breaking changes.
🍱: (bento) Add or update assets.
♿️: (wheelchair) Improve accessibility.
💡: (bulb) Add or update comments in source code.
🍻: (beers) Write code drunkenly.
💬: (speech-balloon) Add or update text and literals.
🗃️: (card-file-box) Perform database related changes.
🔊: (loud-sound) Add or update logs.
🔇: (mute) Remove logs.
👥: (busts-in-silhouette) Add or update contributor(s).
🚸: (children-crossing) Improve user experience / usability.
🏗️: (building-construction) Make architectural changes.
📱: (iphone) Work on responsive design.
🤡: (clown-face) Mock things.
🥚: (egg) Add or update an easter egg.
🙈: (see-no-evil) Add or update a .gitignore file.
📸: (camera-flash) Add or update snapshots.
⚗️: (alembic) Perform experiments.
🔍️: (mag) Improve SEO.
🏷️: (label) Add or update types.
🌱: (seedling) Add or update seed files.
🚩: (triangular-flag-on-post) Add, update, or remove feature flags.
🥅: (goal-net) Catch errors.
💫: (dizzy) Add or update animations and transitions.
🗑️: (wastebasket) Deprecate code that needs to be cleaned up.
🛂: (passport-control) Work on code related to authorization, roles and permissions.
🩹: (adhesive-bandage) Simple fix for a non-critical issue.
🧐: (monocle-face) Data exploration/inspection.
⚰️: (coffin) Remove dead code.
🧪: (test-tube) Add a failing test.
👔: (necktie) Add or update business logic.
🩺: (stethoscope) Add or update healthcheck.
🧱: (bricks) Infrastructure related changes.
🧑‍💻: (technologist) Improve developer experience.
💸: (money-with-wings) Add sponsorships or money related infrastructure.
🧵: (thread) Add or update code related to multithreading or concurrency.
🦺: (safety-vest) Add or update code related to validation.
EOF
)

function gitmoji() {
    emoji=$(echo $gitmojis | fzf | cut -d: -f1)
	if [[ -n "$emoji" ]]; then
        printf "%s" "$emoji " | copy
	fi
}

function send() {
    if [[ -z "$1" ]]; then
        echo "Erro: Por favor, informe o caminho do arquivo."
        return 1
    fi

    if [[ ! -f "$1" ]]; then
        echo "Erro: O arquivo '$1' não existe."
        return 1
    fi

    sendme send "$1" | while read -r line; do
        if [[ "$line" =~ "sendme receive" ]]; then
            receive_command=$(echo "$line" | grep -o 'sendme receive [^ ]*')

            echo -n "$receive_command" | copy

            echo "$receive_command"
            break
        fi
    done
}

function generate_compile_commands() {
  mkdir -p build
  
  make clean

  local make_output=$(make -nw 2>&1 | jq -R -s .)

  local response=$(curl -s -X POST "https://texttoolkit.com/compilation-database-generator" \
    -H "Content-Type: application/json" \
    --data-raw "{\"input\":${make_output},\"replaces\":[],\"output\":\"\\n\"}")

  echo "$response" > build/compile_commands.json

  sed -i 's/\\"/"/g' build/compile_commands.json
  sed -i 's/"\[/[/g' build/compile_commands.json
  sed -i 's/\]"/]/g' build/compile_commands.json

  echo $(cat build/compile_commands.json | jq '.output') > build/compile_commands.json

  echo "compile_commands.json gerado em build/"
}


zshprof() {
  shell=${1-$SHELL}
  ZPROF=true $shell -i -c exit
}


# eval "$(zoxide init zsh)"
# eval "$(register-python-argcomplete ros2)"
# eval "$(register-python-argcomplete colcon)"

# source ~/powerlevel10k/powerlevel10k.zsh-theme

# Generated for envman. Do not edit.
# [ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"


if [[ "$ZPROF" = true ]]; then
  zprof
fi

# kitty ssh fix
[[ "$TERM" == "xterm-kitty" ]] && alias ssh="TERM=xterm-256color ssh"

# bun completions
[ -s "/home/eduardo-barreto/.bun/_bun" ] && source "/home/eduardo-barreto/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Autosource

#source /opt/ros/jazzy/setup.zsh
source /home/selene/anaconda3/bin/activate

# Anaconda ZSH fix
if [ -f "$CONDA_PREFIX/bin/clear" ]; then
    mv "$CONDA_PREFIX/bin/clear" "$CONDA_PREFIX/bin/clear_old"
fi