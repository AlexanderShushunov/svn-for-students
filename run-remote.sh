#!/bin/sh
deployAddress="remote-host-address"

cat ./commands | ssh root@${deployAddress}