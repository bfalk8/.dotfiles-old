# .dotfiles

# Linux Install
- `git clone https://github.com/bfalk8/.dotfiles ~/.dotfiles && cd ~/.dotfiles && ./install`
- sit back and let the Dotbot magic happen :)

# Windows Install
forget about it...the environment changes too much...

# Post-Init
# vim
open vim and run `:PlugInstall`
Follow installation for plugins
- [YouCompleteMe](https://github.com/Valloric/YouCompleteMe)
- [Haskell Environment](http://www.stephendiehl.com/posts/vim_2016.html)

# atom
- `cd ~/.dotfiles/atom`
- `apm install --packages-file my-atom-packages.txt`

if you add to the packages list...
- `apm list --installed --bare > my-atom-packages.txt`
