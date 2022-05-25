#!/bin/bash
    for i in test_ko/*; do
		cat $i | ./analyseur.out
		echo "$?-1"
	done