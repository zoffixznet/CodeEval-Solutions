<?php
    $fh = fopen($argv[1], "r");
    while (true) {
        $test = fgets($fh);
        if ( !strlen($test) ) {
            break;
        }
        ini_set('pcre.backtrack_limit',1000000);
        $things = explode(' ', $test, 2);
        $things[0] = str_replace('0', 'A+', $things[0]);
        $things[0] = str_replace('1', '(?:A+|B+)',$things[0]);
        $things[0] = "/^$things[0]$/";
        print (preg_match($things[0], $things[1]) ? 'Yes' : 'No');
        print "\n";
        print preg_last_error() . "\n";
    }
?>