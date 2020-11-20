This is my Vim config.

To use it, clone this repo to your `$HOME` directory where vim looks for user-specific configuration files.

I use Vundle plugin manager to install the plugins specified in `vimrc`. To install these, open up vim and `:PluginInstall`. Vundle will fetch the plugins it finds from github so that they are available for use.

Note that some plugins (YouCompleteMe and UltiSnps) require vim installed with python support. Check that vim has this (`vim --version | grep python`), and if not, either forgo usage of those plugins by commenting them out of `vimrc` or recompile vim from source. Referencing official [YouCompleteMe](https://github.com/ycm-core/YouCompleteMe) installation instructions may be useful. If planning to use vim on RCC Midway UChicago, vim 8.1 with python support is available as a module, so the following instructions should work to get vim working with YouCompleteMe installed:

```bash
#load vim with python support.
#Consider adding this to bashrc and make sure it is in $PATH with preference over other vim binaries
module load vim/8.1
```

Then start vim, and `:PluginInstall` to fetch plugins. Note that the YouCompleteMe plugin references my personal fork of the official YouCompleteMe repo, which I reset to an old commit which is compatible with vim8.1 (as opposed to the current official YouCompleteMe which requires vim8.2 and is more difficult to install on Midway). Finish installation by navigating to `bundle/YouCompleteMe/` and run  `python install.py` to finish installation of YouCompleteMe.
