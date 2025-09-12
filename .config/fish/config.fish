fish_vi_key_bindings

_pure_set_default pure_symbol_prompt "λ"
_pure_set_default pure_symbol_reverse_prompt "Λ" # used for VI mode

set -gx PATH /home/gilli/.local/bin /usr/bin /home/gilli/.cargo/bin /home/gilli/.gem/ruby/2.7.0/bin $PATH

set -gx TERM xterm-256color

export LIBVA_DRIVER_NAME=iHD

if [ -f $HOME/.config/fish/alias.fish ]
	source $HOME/.config/fish/alias.fish
end

if status is-interactive
    # Commands to run in interactive sessions can go here
end
# THEME PURE #
set fish_function_path /home/gilli/.config/fish/functions/theme-pure/functions/ $fish_function_path
source /home/gilli/.config/fish/functions/theme-pure/conf.d/pure.fish
