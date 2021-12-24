#! /bin/awk -f
$1 != "%CPU" {
    sum += sprintf("%f", $1) 
}

END {
    print sum"%"
}
