#!/bin/awk -f
BEGIN {
  FS=": "
}
/Server/ {
  match($2, /[[:alpha:]]+-*[[:alpha:]]+/) 
  print substr($2, RSTART, RLENGTH)
}
END {}
