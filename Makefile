dev: checknix
	nix develop
checknix:
	bash ./nixfiles/checknix.sh
venv:
	source .venv/bin/activate
new:
	qmk new-keymap -kb planck/rev6
edit:
	nvim /home/henri/qmk_firmware/keyboards/planck/keymaps/mmai/keymap.json
compile:
	qmk compile -kb planck/rev6 -km mmai
flash:
	qmk flash -kb planck/rev6 -km mmai
newEZ:
	qmk new-keymap -kb ergodox_ez
editEZ:
	nvim /home/henri/qmk_firmware/keyboards/ergodox_ez/keymaps/mmai_preonic/keymap.json
compileEZ:
	qmk compile -kb ergodox_ez -km mmai_preonic
flashEZ:
	qmk flash -kb ergodox_ez -km mmai_preonic
newFerris:
	qmk new-keymap -kb ferris/0_2
editFerris:
	nvim /home/henri/qmk_firmware/keyboards/ferris/keymaps/mmai/keymap.json
compileFerris:
	qmk compile -kb ferris/0_2 -km mmai
flashFerris:
	qmk flash -kb ferris/0_2 -km mmai
