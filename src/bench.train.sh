#!/bin/bash
# This is nohupped by xarg in bench.py. DO NOT use it standalone.
# 
# DO NOT Ctrl-c/d/z the terminal after starting this script. It's OK if terminal times out; your process
#   continues to run; not OK if you interrupt, which goes into Lisp!!
# -cem bozsahin, july 2018-23
#
# $1 : sbcl dynamic space size in KBytes; 
#      make sure /proc/sys/vm/max_map_count can handle this.
#      That is a system wide limit; not just for sbcl.
# $2 : sbcl garbage-collect cycle size in megabytes (> 51 to rise above default)
# $3 : grammar filename
# $4 : supervision file name
# $5 : number of iterations (or 'xp')              first of 3 learning parameters (passes, learn rate, learn rate rate)
# $6 : alpha0
# $7 : c
# $8 : log file prefix for the run (so that multi-thread runs dont override their results)
#      This is also the reason why resulting file has a long name, to identify
#      the experiment.
# $9 : the function to call before training (none called if not supplied)
#      This is useful for initializing switches etc.
TRAIN=train-nohup-sbcl    # this function is in bench.lisp
BENCH_LISP="sbcl --dynamic-space-size $1"
LOGFILE="$8.log"
N=$5  # whether this is iteration count or xp determines which trainer to call
if [ $5 = xp ]; then
        N=''  # not needed
	TRAIN=$TRAIN-xp  # this is the function to call for extrapolation (also in bench.lisp)
	TRAINER="$TRAIN \"$3\" \"$4\" $2 \"$8.$6a.$7c.src\" $N $6 $7"   # passes one less argument if $N is empty string
else
	TRAINER="$TRAIN \"$3\" \"$4\" $2 \"$8.$N.$6a.$7c.src\" $N $6 $7"   # passes one less argument if $N is empty string
fi
if [ -e $LOGFILE ]; then
  rm $LOGFILE  # generated by dribble, which appends to file rather than overwrite
fi
echo '======= Log file ============'  >> $LOGFILE
echo "I am called as: $0 $@" >> $LOGFILE
echo "            at: `date`" >> $LOGFILE
echo "            in: `hostname`" >> $LOGFILE
echo "Log goes to   : $LOGFILE" >> $LOGFILE
echo "I will call sbcl as: $BENCH_LISP" >> $LOGFILE
echo "It will call $TRAIN in $BENCH_HOME/bench.lisp as: ($TRAINER)" >> $LOGFILE
echo '=======          ============' >> $LOGFILE
$BENCH_LISP --load $BENCH_HOME/src/bench.lisp --eval '(reset-globals)' --eval "($9)" --eval "($TRAINER)" --eval '(sb-ext:exit)' >> $LOGFILE
