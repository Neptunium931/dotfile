#!/bin/env bash

rm -f perf.data
sudo perf record -F 99 -g -- $@
sudo perf script | stackcollapse-perf | flamegraph >$1.svg
rm -f perf.data
