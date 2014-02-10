var fs  = require("fs");
fs.readFileSync(process.argv[2]).toString().split('\n').forEach(function (line) {
    if (line != "") {
        var lines = line.split(' ');
        lines[0] = lines[0].replace(/0/g, 'A+');
        lines[0] = lines[0].replace(/1/g, '(A+|B+)');
        process.stderr.write(lines[0]);
        var re = new RegExp('^' + lines[0] + '$');
        process.stdout.write( lines[1].match(re) ? 'Yes': 'No');
        process.stdout.write("\n");
    }
});
