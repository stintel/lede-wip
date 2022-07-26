# Using ucode scripts or templates in uhttpd

## CGI

Requires a shebang line.

### Script

Drop a ucode script in a directory configured as cgi_prefix. Sending a status
line is required.

Example: ./files/www/cgi-bin/interfaces.uc

### Template

Drop a ucode template in a directory configured as cgi_prefix. It is possible
to send a status header, but not required. When sending a status header, it
should go right below the shebang line, without empty newline.

Example: ./files/www/cgi-bin/syslog.uc
