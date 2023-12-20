echo "Installing linux dependencies..."
sudo apt-get update && sudo apt-get install libffi-dev curl git-core gcc make zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev libssl-dev lzma liblzma-dev libbz2-dev
echo "Cloning pyenv into $HOME/.pyenv ..."
git clone https://github.com/pyenv/pyenv.git $HOME/.pyenv
echo "Setting up .bashrc for pyenv"
echo "## pyenv configs" >> $HOME/.bashrc
echo """export PYENV_ROOT="$HOME/.pyenv"export PATH="$PYENV_ROOT/bin:$PATH"""" >> $HOME/.bashrc
echo """[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"""" >> $HOME/.bashrc
echo """eval "$(pyenv init -)"""" >> $HOME/.bashrc
source $HOME/.bashrc
read -p "Enter the python version you want to install: " version
echo "installing python $version"
pyenv install $version
