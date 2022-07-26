# Using ucode scripts or templates in uhttpd

## CGI

Requires a shebang line.

### Template

Drop a ucode template in a directory configured as cgi_prefix. It is possible
to send a status header, but not required. When sending a status header, it
should go right below the shebang line, without empty newline.

Example: ./files/www/cgi-bin/syslog.uc
