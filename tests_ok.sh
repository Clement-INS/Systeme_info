#!/bin/bash
	for i in test_ok/*; do
		cat $i | ./analyseur.out
		echo "$?-0"
	done