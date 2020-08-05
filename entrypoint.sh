#!/bin/sh
# A simple entrypoint script - it:
# 1 - prints a welcome message
# 2 - determin background mode or cli mode
# 3 - executes the arguments passed in. 
# Naturally it can be customised...to perform checks, start various services, etc.,
# One good use case for the entrypoint would be to pass in a specific script and port to run. in this case a 'master' script like master.q could start on e.g. port 5000 and a set of worker scripts worker-1.q, worker-2.q etc., could run on 5001, 5002...
echo "Welcome to KDB+ on Docker"

print_usage() {
  printf "$0  [MODE] [ARGS]\n"
  printf "MODE - \"BG\" or \"IT\" for running kdb+ process in background or interactively\n"
  printf "ARGS - arguments to kdb+ process\n"
}

arg="${@}"
#cmd="q ${arg#*[[:space:]] entrypoint.q}"
cmd="q ${@} entrypoint.q"
#if [[ "${1}" == "BG" ]]; then
#    cmd="nohup ${cmd} &> /dev/null &"
#else
#  if [[ "${1}" != "IT" ]]; then
#    printf "Invalid MODE supplied."
#    print_usage
#    exit 3
#  fi
#fi


echo ${cmd}
exec ${cmd}
