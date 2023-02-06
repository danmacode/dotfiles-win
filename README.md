# Dotfiles

Managed with [`chezmoi`](https://github.com/twpayne/chezmoi). It can be used as an idempotent tool; can be applied multiple times without causing any conflict. It comes with a built-in `git` to use if there's none in `$PATH`.

Installing these dotfiles with chezmoi is very straightforward:

```powershell
chezmoi init https://github.com/danmacode/dotfiles-win.git
chezmoi apply # will show diff before any overwrite
```

Or just ssh clone the repo and then download the submodules(if there are any).

```sh
git clone git@github.com:danmacode/dotfiles-win.git
cd dotfiles-win; git submodule update --init --recursive
```

## License

MIT
