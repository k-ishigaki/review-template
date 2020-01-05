.PHONY: all
all:
	cd src; rake clean web

.PHONY: clean
clean:
	cd src; rake clean

.PHONY: pdf
pdf:
	cd src; rake pdf

.PHONY: web
web:
	cd src; rake web
