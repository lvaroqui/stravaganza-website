#!/bin/bash

sleep 2;
while [ -f lock ]; do
	sleep 1
done

exec $@
