#!/bin/php
<?php

/**
 * Switch git branches using a filtered list.
 */

function getGitBranches(?string $criteria = null)
{
    if ($criteria) {
        $branches = explode("\n", `git branch | grep {$criteria}`);
    } else {
        $branches = explode("\n", `git branch`);
    }

    if (is_array($branches)) {
        array_pop($branches);
    }

    return $branches;
}

function displayBranches(array $branches)
{
    foreach ($branches as $key => $branch) {
        echo "$key: $branch\n";
    }
}

function selectBranch(array $branches)
{
    fscanf(STDIN, "%d\n", $branchId);

    if (
        $branchId < 0 || 
        $branchId >= count($branches)
    ) {
        echo "Wrong input. Bye.\n";
        return 1;
    }

    if (
        null === $branchId
    ) {
        $branchId = 0;
    }

    // Remove current branch hint
    $branches[$branchId] = str_replace('* ', '', $branches[$branchId]);
    
    echo "Switching to branch {$branches[$branchId]}.\n";

    `git checkout {$branches[$branchId]}`;

    return 0;
}

function main($commandArguments)
{
    $branches = getGitBranches($commandArguments[1] ?? null);
    echo "Available branches:\n\n";
    displayBranches($branches);    
    echo "\nSwitch to branch (default 0): ";
    selectBranch($branches);
}

main($argv);