#!/bin/bash

x="$(sudo dnf install firefox -y)"
if [ "$x" == "Nothing to do." ]; then
	echo "tis a match";
else
	echo $x;
fi
