CANDIDATES := $(wildcard .??*)
EXCLUSIONS := .DS_Store .git .gitmodules .github
DOTFILES   := $(filter-out $(EXCLUSIONS), $(CANDIDATES))

deploy:
	@$(foreach val, $(DOTFILES), ln -sfnv $(abspath $(val)) $(HOME)/$(val);)

update:
	git submodule update --init --recursive

init:
	bash etc/init/init.sh

