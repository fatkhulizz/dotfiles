all:
	stow --verbose --target=$$HOME --restow */
delete:
	stow --verbose --target=$$HOME --delete */
tmux-setup:
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
