#!/bin/zsh

set -euo pipefail

# ========== CONFIG ==========
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"
FONT_NAME="MesloLGS NF Bold.ttf"
FONT_URL="https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf"
VERBOSE=false  # Set to true for full output

# ========== LOGGING ==========
log()    { echo -e "\033[1;32m[INFO]\033[0m $*"; }
warn()   { echo -e "\033[1;33m[WARN]\033[0m $*"; }
err()    { echo -e "\033[1;31m[ERROR]\033[0m $*" >&2; }
run()    { $VERBOSE && "$@" || "$@" > /dev/null 2>&1; }

check_cmd() {
    local cmd="$1"
    local msg="${2:-Required command '$cmd' not found. Please install it.}"
    if ! command -v "$cmd" >/dev/null 2>&1; then
        err $msg
        return 1
    fi
}

# ========== INSTALL OH-MY-ZSH WITHOUT SHELL RESTART ==========
install_omz() {
    log "Installing Oh My Zsh..."
    export RUNZSH=no  # prevent auto shell restart
    export CHSH=no    # prevent shell change
    run sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
}

# ========== INSTALL PLUGINS ==========
install_plugins() {
    log "Installing Zsh plugins..."
    run git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
    run git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
}

# ========== INSTALL POWERLEVEL10K ==========
install_theme() {
    log "Installing Powerlevel10k theme..."
    run git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$ZSH_CUSTOM/themes/powerlevel10k"
}

# ========== INSTALL FONT ==========
install_fonts() {
    log "Installing font $FONT_NAME..."
    mkdir -p ~/.local/share/fonts
    wget -q --show-progress -O "$FONT_NAME" "$FONT_URL"
    mv "$FONT_NAME" ~/.local/share/fonts/"$FONT_NAME"
    run fc-cache -f -v
}

# ========== RUN SETUP ==========
main() {
    check_cmd wget || exit 1
    check_cmd fc-cahe || exit 1
    
    warn "your dot files will over wirte by default config of p10k and omz."

    install_omz
    install_plugins
    install_theme
    install_fonts

    log "Zsh setup complete. You may need to restart your terminal."
    log "you can copy the dot files form this repo with ./mvconf"
}

main
