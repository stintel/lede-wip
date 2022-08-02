{%
'use strict';

global.handle_request = function(env) {
	print("Content-Type: application/json\n\n");
	print(env);
};
