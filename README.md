This is my Vim config.

To use it, clone this repo to your `$HOME` directory where vim looks for user-specific configuration files.

```bash
cd ~
git clone https://github.com/bfairkun/.vim.git
```

I use Vundle plugin manager to install the plugins specified in `vimrc`. To install these, after cloning this repo, open up vim and `:PluginInstall`. Vundle will fetch the plugins it finds from github so that they are available for use.

Note that the Plugin YouCompleteMe requires vim installed with python3 support. Check that vim has this (`vim --version | grep python`), and if not, either forgo usage of those plugins (Note the `Plugin 'ycm-core/YouCompleteMe'` line in the `vimrc` is conditional on vim Python support) or recompile vim from source with python3 support. Referencing official [YouCompleteMe](https://github.com/ycm-core/YouCompleteMe) installation instructions may be useful. If planning to use vim on RCC Midway UChicago, vim 8.1 with python3 support is available as a module, so the following instructions should work to get vim working with YouCompleteMe installed:

```bash
#load vim with python support.
#Consider adding this to bashrc and make sure it is in $PATH with preference over other vim binaries
module load vim/8.1
```

Then, start vim and `:Plugin Install` to fetch plugins. Note  `Plugin 'bfairkun/YouCompleteMe'` will be installed over `Plugin 'ycm-core/YouCompleteMe'` if using vim8.1...  The `bfairkun/YouCompleteMe` plugin references my personal fork of the official YouCompleteMe repo, which I reset to an old commit which is compatible with vim8.1 (as opposed to the current official YouCompleteMe which requires vim8.2 and a few other up-to-date dependencies which are more painful to install on Midway). 

Finish installation of YouCompleteMe by navigating to `bundle/YouCompleteMe/` and run `python install.py`. For whatever reason, I think this step doesn't work well if you use python included in miniconda/anaconda. Use `which python` to check this.
