#!/usr/bin/ucode -T

<h1>Syslog</h1>

<pre>
{%
'use strict';

const lua = require("lua");

let vm = lua.create();

vm.eval('lsys = require("luci.sys")');
vm.eval('log = lsys.syslog()');

let log = vm.get('log').value();

print(log);
%}
</pre>
