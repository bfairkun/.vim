This is my Vim config.

To use it, clone this repo to your `$HOME` directory where vim looks for user-specific configuration files.

I use Vundle plugin manager to install the plugins specified in `vimrc`. To install these, open up vim and `:PluginInstall`. Vundle will fetch the plugins it finds from github so that they are available for use.

Note that some plugins (YouCompleteMe and UltiSnps) require vim installed with python support. Check that vim has this (`vim --version | grep python`), and if not, either comment out those plugins in `vimrc`, or compile vim from source with python support. If on midway, software should be installed in home directory.

```bash
git clone https://github.com/vim/vim.git && cd vim
./configure --prefix=$HOME/pkg/stow/vim/ --enable-pythoninterp --enable-python3interp
 --prefix=$HOME
make && make install
```

your `$PATH` to take preference over other vim executables in `$PATH`.
