#!/bin/bash

sourceFolder='./source'

echo -e "Let's go install some useful stuff!\n"

apt-get update

$sourceFolder/getGit.sh
$sourceFolder/getVim.sh
$sourceFolder/getVsCodium.sh
$sourceFolder/getInsomnia.sh
$sourceFolder/getDocker.sh
