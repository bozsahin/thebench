#!/bin/bash
# cem bozsahin 2023
if [ $1 ]; then
  sure=$1
else
  sure='not-sure'
fi
if [ ! $sure = sure ]; then
  echo "exiting without uninstall. Please run it as 'bench.uninstall.sh sure' to remove"
  echo "this is to avoid accidental removal"
  exit -1
fi
BENCH_HOME="`cat ~/.thebenchhome`"
cd ~
if [ -d "$BENCH_HOME" ]; then
  echo "Removing $BENCH_HOME"
  rm -fr $BENCH_HOME
fi
if [ -d "/tmp/thebench" ]; then
  echo "Removing /tmp/thebench"
  rm -fr /tmp/thebench
fi
rm "~/.thebenchhome"
rm "~/.thebenchhistory"
rm "~/bin/bench.train"
rm "~/bin/bench"
echo "Done."
