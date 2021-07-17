const { watch } = require('gulp');
const { exec } = require("child_process");

async function UpdateLuafiles(cb) {
	exec("cd gamefiles && wsl busted Tests", (error, stdout, stderr) => {
		console.log(`${stdout}`);
	});
}
  
exports.default = function() {
	watch('gamefiles/**/*.lua', UpdateLuafiles);
};