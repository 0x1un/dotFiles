.PHONY: install clean test vscode-config clean-vscode
CONFIG_SRC=$(wildcard config/*)
TO=${HOME}
DOTCONFIG=$(TO)/.config
SOME_DOT_FILES:=zshrc profile pylintrc xinitrc # 需要安装的dot配置文件
VSCODE_CONFIG=$(TO)/.config/Code/User
VSCODE_CONFIG_DEST=$(VSCODE_CONFIG)/settings.json

install:
	@mkdir -pv $(DOTCONFIG)
	@$(foreach var,$(SOME_DOT_FILES),ln -sf ${PWD}/$(var) $(TO)/.$(var);)
	@$(foreach var,$(CONFIG_SRC),ln -sf ${PWD}/$(var) $(TO)/.$(var);)
	@echo Copied config files into $(DOTCONFIG)

clean:
	@$(foreach var,$(notdir $(CONFIG_SRC)),rm -rf $(DOTCONFIG)/$(var);)
	@$(foreach var,$(SOME_DOT_FILES),unlink $(TO)/$(var);)
	@echo Cleaning config files from $(DOTCONFIG)
	@rm -rf $(DOTCONFIG) && echo Deleted $(DOTCONFIG)

clean-vscode:
	@unlink $(VSCODE_CONFIG_DEST) && echo Deleted $(VSCODE_CONFIG_DEST)

vscode-config:
	@mkdir -pv $(VSCODE_CONFIG)
	@ln -sf ${PWD}/editor/vscode/settings.json $(VSCODE_CONFIG_DEST)

test:
	@echo $(SOME_DOT_FILES)
