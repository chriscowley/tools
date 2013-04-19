Server to respond to Github Web URL hooks and execute a script.

usage: listen.py [-h] -s SCRIPT

I run it as my web server user (nginx) on CentOS.  You will need to modify the line below based on which web server/distribution you are using. The easiest way to do this is to add a line to /etc/rc.local that look something like:

```
su -s /bin/bash - nginx -c "/usr/local/bin/listen.py --script /usr/local/bin/cv-update"
```
