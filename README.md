This is my Vim config.

To use it, clone this repo to your `$HOME` directory where vim looks for user-specific configuration files.

I use Vundle plugin manager to install the plugins specified in `vimrc`. To install these, open up vim and `:PluginInstall`. Vundle will fetch the plugins it finds from github so that they are available for use.

Note that some plugins (YouCompleteMe and UltiSnps) require vim installed with python support. Check that vim has this (`vim --version | grep python`), and if not, either forgo usage of those plugins, or compile vim from source or some other way to get python support. If you recompile vim, and place it somewhere, make sure to add it to your `$PATH` to take preference over other vim executables in `$PATH`.
