#!/bin/bash
cat /dev/null > times

function measure() {
  echo "$1 package loss" >> times
  tc qdisc add dev eth1 root netem loss $1%

  for i in {1..5}
  do
    (time salt -t 180 'minion' state.highstate) 2>> times
    sleep 1
  done

  tc qdisc del dev eth1 root netem loss $1%
}



for i in {0..60..5}
  do
    measure $i
  done
