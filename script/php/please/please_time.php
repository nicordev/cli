#! /usr/bin/php

<?php

class DateIntervalEnhanced extends DateInterval
{

    public function recalculate()
    {
        $from = new DateTime;
        $to = clone $from;
        $to = $to->add($this);
        $diff = $from->diff($to);
        foreach ($diff as $k => $v) $this->$k = $v;
        return $this;
    }
}

define('SCRIPT_NAME', array_shift($argv));
define('FUNCTION_NAME', array_shift($argv));

function _getScriptContent()
{
    return file_get_contents(__DIR__ . '/' . SCRIPT_NAME);
}

function convertTime($parameters = [])
{
    if (2 > count($parameters)) {
        echo sprintf("%s %s \e[33mtime unit\e[0m\n", SCRIPT_NAME, FUNCTION_NAME);

        return;
    }

    $time = sprintf("PT%s%s", $parameters[0], strtoupper($parameters[1]));
    $formattedTime = (new DateIntervalEnhanced($time))->recalculate()->format("%h:%i:%s");

    echo sprintf("\n%s\n", $formattedTime);
}

function howItWorks()
{
    echo _getScriptContent();
}

function _listFunctions()
{
    $content = _getScriptContent();
    $functions = [];
    preg_match_all('#function ([a-z]{1}[a-zA-Z0-9]*)\(#', $content, $functions);
    echo implode("\n", $functions[1]) . "\n";
}

if ($argc <= 1) {
    _listFunctions();
    exit;
}

call_user_func(FUNCTION_NAME, $argv);
