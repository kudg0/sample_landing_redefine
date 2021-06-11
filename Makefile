.PHONY: build

run: server

server:
	bundle
	bundle exec middleman server

build:
	bundle exec middleman build --verbose
