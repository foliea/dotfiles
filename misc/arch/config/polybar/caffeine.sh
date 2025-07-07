#!/bin/bash
set -e

results_count=$(ps aux | grep caffeine-ng | wc -l)

if [ "$results_count" -gt 1 ]; then
	echo ""
else
	echo ""
fi
