CANDIDATES := $(wildcard .??*)
EXCLUSIONS := .DS_Store .git
DOTFILES   := $(filter-out $(EXCLUSIONS), $(CANDIDATES))
COLORS_DIR := ~/.config/nvim/colors

list: ## Show dot files in this repo
	@$(foreach val, $(DOTFILES), ls -dF $(val);)

install: ## Create symlink to home directory
	@echo '==> Start to deploy dotfiles to home directory.'
	@echo ''
	@$(foreach val, $(DOTFILES), ln -sfnv $(abspath $(val)) $(HOME)/$(val);)
	@ln -sfnv $(abspath config/nvim/init.vim) ~/.config/nvim/init.vim
	mkdir -p $(COLORS_DIR)
	cp jellybeans.vim $(COLORS_DIR)
