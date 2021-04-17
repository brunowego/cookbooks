SHELL := /bin/sh

GUNICORN_PID := $(shell cat gunicorn.pid)

.DEFAULT_GOAL := app/run
.PHONY: app/run

app/run:
	gunicorn -b 0:5000 -k eventlet -D -p gunicorn.pid app:app

app/restart:
	kill -s HUP $GUNICORN_PID

app/stop:
	kill -s TERM $GUNICORN_PID
