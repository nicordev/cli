#! /usr/bin/php

<?php

define('SCRIPT_NAME', array_shift($argv));
define('FUNCTION_NAME', array_shift($argv));

function _getScriptContent() {
    return file_get_contents(__DIR__.'/'.SCRIPT_NAME);
}

function sayHello($name) {
    echo "Hello {$name}!\n";
}

function howItWorks() {
    echo _getScriptContent();
}

function _listFunctions() {
    $content = _getScriptContent();
    $functions = [];
    preg_match_all('#function ([a-z]{1}[a-zA-Z0-9]*)\(#', $content, $functions);
    echo implode("\n", $functions[1])."\n";
}

if ($argc <= 1) {
    _listFunctions();
    exit;
}

call_user_func_array(FUNCTION_NAME, $argv);
