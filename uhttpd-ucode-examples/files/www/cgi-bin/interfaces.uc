#!/usr/bin/ucode

'use strict';

print("Status: 200 OK\r\n");
print("Content-Type: text/plain\r\n");
print("\r\n");

const lua = require("lua");

let vm = lua.create();

vm.eval('lip = require("luci.ip")');
vm.eval('lsys = require("luci.sys")');

vm.eval('devices = lsys.net.devices()');
let devices = vm.get('devices').value();

for (let dev in devices)
{
        vm.set({ldev: dev});
        vm.eval('devinfo = lip.link(ldev)');
        printf("%s\n", vm.get('devinfo').value());
}
