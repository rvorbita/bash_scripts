#! /bin/bash

TITLE="SYSTEM INFORMATION"
TIME_STAMP=$(date +"%H:%M:%S %Y/%m/%d")

#fucntions
#server uptime
server_uptime () {
cat <<- _EOF_
    <h2>System Uptime</h2>
    <pre>$(uptime)</pre>
_EOF_
return
}

#server disk space
server_disk_space () {
cat <<- _EOF_
    <h2>System Disk Space</h2>
    <pre>$(df -h)</pre>
_EOF_
return
}

#home server disk space
home_disk_space () {
if [[ $(id -u ) -eq 0 ]]; then
cat <<- _EOF_
    <h2>Home Disk Space</h2>
    <pre>$(du -sh /Users/*)</pre>
_EOF_
else
cat <<- _EOF_
    <h2>Home Disk Space</h2>
    <pre>$(du -sh /Users/raymart)</pre>
_EOF_
fi
return
}




cat <<- _EOF_

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>$TITLE</title>
</head>
<body>

<h1>System Information Report</h1>
    <span>Generated $TIME_STAMP by $USER</span>

    
    <p>$(server_uptime)</p>
    <p>$(server_disk_space)</p>
    <p>$(home_disk_space)</p>

</body>
</html>

_EOF_