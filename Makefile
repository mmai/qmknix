dev: checknix
	nix develop
checknix:
	bash ./nixfiles/checknix.sh
venv:
	source .venv/bin/activate
new:
	qmk new-keymap -kb ferris/0_2
edit:
	vim /home/henri/qmk_firmware/keyboards/ferris/keymaps/mmai/keymap.json
compile:
	qmk compile -kb ferris/0_2 -km mmai
flash:
	qmk flash -kb ferris/0_2 -km mmai
