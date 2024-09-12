#!/bin/sh

sytemctl --user deamon-reload
sytemctl --user enable nvim-share-cleanup.timer
sytemctl --user start nvim-share-cleanup.timer
