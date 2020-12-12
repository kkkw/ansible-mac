ANSIBLE_PATH=~/workspace/ansible-mac

.PHONY:help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

setup:
	xcode-select --install
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	brew install ansible
	git clone -b template https://github.com/kkkw/ansible-mac.git ${ANSIBLE_PATH}
	cd ${ANSIBLE_PATH}
