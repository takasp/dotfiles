CANDIDATES := $(wildcard .??*)
EXCLUSIONS := .DS_Store .git .github
DOTFILES   := $(filter-out $(EXCLUSIONS), $(CANDIDATES))

deploy:
	@$(foreach val, $(DOTFILES), ln -sfnv $(abspath $(val)) $(HOME)/$(val);)
	@mkdir -p $(HOME)/.config
	@ln -sfnv $(abspath .config/starship.toml) $(HOME)/.config/starship.toml

init:
	bash etc/init/init.sh

