#!/bin/bash

commands=(node npm python pip3 nvim)

npms="eslint_d prettier neovim"

for cmd in ${commands[*]}
do
	if ! command -v "$cmd" &> /dev/null
	then
		echo "$cmd not installed"
		exit
	fi
done

sudo npm install -g "$npms"

