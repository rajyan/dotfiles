#!/usr/bin/env zsh

set -eux

# install fonts
## download powerline fonts
git clone https://github.com/powerline/fonts.git --depth=1 && pushd fonts

## download and build source han code jp
git clone https://github.com/adobe-fonts/source-han-code-jp.git
git clone https://github.com/adobe-type-tools/afdko.git
python3 -m venv afdko_env && source afdko_env/bin/activate && pip3 install afdko
pushd source-han-code-jp && ./commands.sh && popd
deactivate && rm -rf afdko* && popd

## install
fonts/install.sh && rm -rf fonts
