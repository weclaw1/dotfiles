mkdir ~/.local/share/atuin/
atuin init nu | save -f ~/.local/share/atuin/init.nu
sed -i 's/let-env /$env./g' ~/.local/share/atuin/init.nu
chown -R weclaw:weclaw ~/.local
let config = open ~/.config/nushell/config.nu
let config_has_source = $config | str contains 'source ~/.local/share/atuin/init.nu'
if not $config_has_source {
  'source ~/.local/share/atuin/init.nu' | save --append ~/.config/nushell/config.nu
}
