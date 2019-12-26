
.PHONY: all
all: test reviewdog-local

.PHONY: reviewdog-install
reviewdog-install:
	go get -u github.com/reviewdog/reviewdog/cmd/reviewdog

.PHONY: reviewdog-report
reviewdog-report:
	git clone -b add-errorformat git@github.com:rung/gosec.git && cd gosec && go install
	reviewdog -conf=.reviewdog.yml -reporter=github-pr-review

.PHONY: reviewdog-local
reviewdog-local:
	git clone -b add-errorformat git@github.com:rung/gosec.git && cd gosec && go install
	reviewdog -conf=.reviewdog.yml -diff="git diff master"

