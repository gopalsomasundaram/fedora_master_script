#!/bin/bash

font_check="$(fc-list | grep JetBrains)"
if [[ -z "$font_check" ]]; then
	echo "it is empty";
else
	echo "it aint empty";
fi
