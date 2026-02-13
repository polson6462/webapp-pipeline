#!/usr/bin/env bash
set -e
grep -q "Deployed via Jenkins Pipeline" index.html
echo "OK: test passed"
