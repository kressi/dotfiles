Inspired by
http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/

Restore dotfiles
----------------
Dotfiles are stored in `~/dotfiles/` and symlinked to `~/`.

Clone git repository and create symlinkes to home directory with `bootstrap.sh`. Already existing dotfiles are moved to `~/dotfiles_old`.

```
git clone git@github.com:kressi/dotfiles.git ~/dotfiles
cd ~/dotfiles
./bootstrap.sh
```
