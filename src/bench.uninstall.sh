#!/bin/bash
# cem bozsahin 2023
if [ $1 ]; then
  sure=$1
else
  sure='not-sure'
fi
if [ ! $sure = sure ]; then
  echo "exiting without uninstall. Please run it as 'bench-uninstall.sh sure' to remove"
  echo "this is to avoid accidental removal"
  exit -1
fi
if [ `pwd` = $BENCH_HOME ]; then
  echo "I cannot remove the directory you are already in."
  echo "Please run the command from an upper directory"
  exit -1
fi
if [ "$BENCH_HOME" ]; then
  echo "Removing $BENCH_HOME"
  rm -fr $BENCH_HOME
fi
if [ -d "/tmp/thebench" ]; then
  echo "Removing /tmp/thebench"
  rm -fr /tmp/thebench
fi
if [ -e "~/.thebenchrc" ]; then
  echo "Effectively removing .thebenchrc from your home directory"
  echo "  by making it an empty file"
  printf '%s ' > ~/.thebenchrc
  echo "If you like, you can edit your ~/.bashrc and remove stuff added by the bench installer"
fi
unset BENCH_HOME
unset BENCH
