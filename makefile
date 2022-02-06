XCODE=~/Library/Developer/Xcode

USERDATA=UserData
XCODE_USERDATA=$(XCODE)/UserData

# Templates

TEMPLATES=Templates/File\ Templates
XCODE_TEMPLATES=$(XCODE)/Templates

.PHONY: clean_install_templates
clean_install_templates: clean_templates install_templates

.PHONY: install_templates
install_templates:
	$(call copy_from_to,$(TEMPLATES),$(XCODE_TEMPLATES))

.PHONY: clean_templates
clean_templates:
	$(call clean_directory,$(XCODE_TEMPLATES))

# Snippets

SNIPPETS=$(USERDATA)/CodeSnippets
XCODE_SNIPPETS=$(XCODE_USERDATA)/CodeSnippets

.PHONY: clean_install_snippets
clean_install_snippets: clean_snippets install_snippets

.PHONY: install_snippets
install_snippets:
	$(call copy_from_to,$(SNIPPETS),$(XCODE_SNIPPETS))

.PHONY: clean_snippets
clean_snippets:
	$(call clean_directory,$(XCODE_SNIPPETS))

# Themes

THEMES=$(USERDATA)/FontAndColorThemes
XCODE_THEMES=$(XCODE_USERDATA)/FontAndColorThemes

.PHONY: clean_install_themes
clean_install_themes: clean_themes install_themes

.PHONY: install_themes
install_themes:
	$(call copy_from_to,$(THEMES),$(XCODE_THEMES))

.PHONY: clean_themes
clean_themes:
	$(call clean_directory,$(XCODE_THEMES))

# Preferences

## See https://github.com/aizatto/character-length
.PHONY: apply_preferences
apply_preferences:
	defaults write com.apple.dt.Xcode DVTTextShowPageGuide -bool YES
	defaults write com.apple.dt.Xcode DVTTextPageGuideLocation -integer 120

	defaults write com.apple.dt.Xcode DVTTextEditorTrimTrailingWhitespace -bool YES
	defaults write com.apple.dt.Xcode DVTTextEditorTrimWhitespaceOnlyLines -bool YES

	defaults write com.apple.dt.Xcode DVTTextIndentUsingTabs -bool NO
	defaults write com.apple.dt.Xcode DVTTextIndentTabWidth -integer 2
	defaults write com.apple.dt.Xcode DVTTextIndentWidth -integer 2
	defaults write com.apple.dt.Xcode DVTTextIndentSoloBraces -bool NO
	defaults write com.apple.dt.Xcode DVTTextIndentCase -bool YES
	defaults write com.apple.dt.Xcode DVTTextIndentCaseInC -bool YES

# Helpers

# 1 — source directory path
# 2 - destination directory path
define copy_from_to
	@if [ ! -d $(2) ]; then mkdir -p $(2); fi
	@cp -R $(1)/* $(2)
	@echo "Copied from $(1) to $(2)"
endef

# 1 — directory path
define clean_directory
    @rm -r $(1)
	@echo "Cleaned $(1)"
endef