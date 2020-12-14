This is my Vim config. It has a bunch of plugins and remaps that I like. Especially useful for me are the plugins Nvim-R (to create and IDE-like environment for R) and vim-slime (to create an IDE like environment for anything else if you use vim within a tmux split screen)

To use it, clone this repo to your `$HOME` directory where vim looks for user-specific configuration files.

```bash
cd ~
git clone https://github.com/bfairkun/.vim.git
```

I use [vim-plug](https://github.com/junegunn/vim-plug) plugin manager to install the plugins specified in `vimrc`. To install these, after cloning this repo, open up vim and `:PlugInstall`. vim-plug will fetch and install the plugins it finds from github so that they are available for use.

Note that the Plugin YouCompleteMe can be painful to install and installation attempts might throw errors if your environment isn't just like mine... That plugin requires vim installed with python3 support. Check that vim has this (`vim --version | grep python`), and if not, either forgo usage of those plugins (Note the `Plug 'ycm-core/YouCompleteMe'` line in the `vimrc` is conditional on vim Python support so it won't be installed unless you have python support) or recompile vim from source with python3 support. Referencing official [YouCompleteMe](https://github.com/ycm-core/YouCompleteMe) installation instructions may be useful. Also note that YouCompleteMe is only supported for very specific vim version, and if you have an older version of vim, you may need to checkout an old YouCompleteMe commit as I have done in my `vimrc`. If planning to use vim on RCC Midway UChicago, vim 8.1 with python3 support is available as a module, so the following instructions should work to get vim working with YouCompleteMe installed:

```bash
#load vim with python support.
#Consider adding this to bashrc and make sure it is in $PATH with preference over other vim binaries
module load vim/8.1
```

Then, start vim and `:PlugInstall` to fetch plugins. Note that if using vim8.1, then we will fetch an older commit of the YouCompleteMe repo which is compatible with vim8.1 (as opposed to the current official YouCompleteMe which requires vim8.2 and a few other up-to-date dependencies which are more painful to install on Midway). 

YouCompleteMe installation also requires execution of an installation script.  This should be done automatically when you `:PlugInstall` but if that fails, you might want to do this step manually by navigating to `plugged/YouCompleteMe/` and run `python install.py`... I think this step doesn't work well if you use python included in miniconda/anaconda. Use `which python` to check this.

