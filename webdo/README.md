Server to respond to Github Web URL hooks and execute a something.

usage: listen.py [-h] -s SCRIPT

I run it my web server user (nginx) so that it can write into that directory. The easiest way to do this is to add a line to /etc/rc.local that look something like:

```
su -s /bin/bash - nginx -c "/usr/local/bin/listen.py --script /usr/local/bin/cv-update"
```
