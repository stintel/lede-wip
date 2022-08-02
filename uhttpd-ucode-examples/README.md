# Using ucode scripts or templates in uhttpd

These examples call the LuCI Lua API. For this to work, the ucode-mod-lua
package is required.

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

## uhttpd-mod-ucode

With uhttpd-mod-ucode, scripts are always executed in template mode.
Configuring a ucode_prefix in uhttpd is required. For this example we used
/ucode/env=/usr/share/ucode/uhttpd/env.uc as ucode_prefix.

Example: ./files/usr/share/ucode/uhttpd/env.uc
