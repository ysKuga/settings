.DEFAULT_GOAL := help

# Makefile 関連
# https://gist.github.com/ysKuga/d1c699330cb275a3395dd239120013e3

vscode/extensions-recommendations: ## .vscode/extensions/recommendations/ を extensions.json に反映する
	bash ./scripts/vscode/extensions-recommendations.sh

# help の記述
# https://ktrysmt.github.io/blog/write-useful-help-command-by-shell/
help: ## print this message
	@echo "Example operations by makefile."
	@echo ""
	@echo "Usage: make SUB_COMMAND argument_name=argument_value"
	@echo ""
	@echo "Command list:"
	@echo ""
	@printf "\033[36m%-30s\033[0m %-50s %s\n" "[Sub command]" "[Description]" "[Example]"
	@grep -E '^[/a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | perl -pe 's%^([/a-zA-Z_-]+):.*?(##)%$$1 $$2%' | awk -F " *?## *?" '{printf "\033[36m%-30s\033[0m %-50s %s\n", $$1, $$2, $$3}'
