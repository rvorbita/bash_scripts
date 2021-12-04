#! /bin/bash
# ask for password with timer.



if read -t 10 -sp "Enter the password: " pass; then

    echo -e password is 123 : $pass

else
    
    echo -e password input timeout.
    exit 1

fi

