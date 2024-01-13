all:
	stow --verbose --target=$$HOME --restow */
delete:
	stow --verbose --target=$$HOME --delete */
tmux:
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
