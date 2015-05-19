#!/bin/bash
cat /dev/null > times

function measure() {
  echo "$1 bandwidth" >> times
  # egress limit
  tc qdisc add dev eth1 handle 1: root htb default 11
  tc class add dev eth1 parent 1: classid 1:1 htb rate $1kbps
  tc class add dev eth1 parent 1:1 classid 1:11 htb rate $1kbps

  #ingress filter
  tc qdisc add dev eth1 handle ffff: ingress
  tc filter add dev eth1 parent ffff: protocol ip prio 50 u32 match ip src 0.0.0.0/0 police rate $1kbit burst 10k drop flowid :1

  for i in {1..5}
  do

    (time salt -t 180 'minion' state.sls copy) 2>> times
    salt -t 180 'minion' state.sls delete
    sleep 5
  done

  #remove egress
  tc qdisc del dev eth1 root    &>/dev/null
  #remove ingress
  tc qdisc del dev eth1 ingress &>/dev/null
}


#for i in 102400 24576 3072 2048 1024 250 40 20
for i in 2048 1024 250 40 20
  do
    measure $i
  done
