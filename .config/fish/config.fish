set -gx LIBVIRT_DEFAULT_URI "qemu:///system"

fish_add_path ~/.local/bin

if status is-interactive
  # fish_config prompt save nim
  # fish_config theme save 'ayu Dark'
  starship init fish | source
end

shadowenv init fish | source
