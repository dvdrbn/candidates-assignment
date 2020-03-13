#!/bin/bash
#add fix to exercise6-fix here

# set target server by local hostname
if [ "$(hostname)" = "server1" ]; then 
	target_server="server2"
else
	target_server="server1"
fi

# last argument is target directory
target_dir=${@: -1}

# transfer files via ssh
scp -v ${@:1:$#-1} $target_server:$target_dir |& grep Sink |& awk '{sum += $3} END {print sum}'

# ${@:1:$#-1} - will give all argument except last
# grep Sink   - will catch lines containing bytes of every file
# awk '{sum += $3} END {print sum}' - will sum the bytes catched by grep
