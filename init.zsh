#!/usr/bin/env zsh

set -eux

DOT_DIR=${DOT_DIR:-$HOME/dotfiles/dots}

# setup dotfiles
for filepath in "$DOT_DIR"/.*
do
    file=${filepath##*/}
    [[ -f "$HOME/$file" ]] && mv -f "$HOME/$file" "$HOME/$file".bak
    ln -svf "$filepath" "$HOME/$file"
done

# run zinit
zsh

# install fonts
## powerline fonts
git clone https://github.com/powerline/fonts.git --depth=1 && fonts/install.sh && rm -rf fonts

## source han code jp
git clone https://github.com/adobe-type-tools/afdko.git
git clone https://github.com/adobe-fonts/source-han-code-jp.git
python -m venv afdko_env && source afdko_env/bin/activate && pip3 install afdko
pushd source-han-code-jp && ./commands.sh && popd
deactivate && rm -rf afdko* source-han-code-jp

