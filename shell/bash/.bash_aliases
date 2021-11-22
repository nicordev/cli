# Variables
PLEASE_TODAY=$(date +%Y%m%d)

# list
alias llg="filter_list.sh --full"
alias lg='filter_list.sh'
alias lh='ls -alFh'
alias l='ls -1'
# cd
alias cdDownloads='cd ~/Downloads'
alias cdschool='cd ~/moi/project/school/school_paperwork'
alias cdviolay='cd ~/moi/project/school/violay-rainbow-school.github.io'
# Nano
alias nano='nano -miA'
# Todo
alias please_todo='vim ~/Desktop/todo.md'
# image
alias please_show_image_dimensions='file'
# pandoc
alias please_how_to_convert_markdown='echo -e "pandoc \e[33mfileName\e[0m -f markdown -t \e[33moutputFormat\e[0m -s -o \e[33moutputFile\e[0m"'
# markdown
alias please_markdown_how_to_write_definition_list='echo -e "term to define here
: definition is here
  another definition line
  now adding a numbered list:
  1. apple
  2. peach
  3. pear"'
alias please_markdown_how_to_write_on_2_lines='echo -e "I am writing this text on 2 lines by adding 2 spaces at the end of this line
to put a carriage return character."'
# javascript
alias please_js_show_script_template="echo -e \"(function () {
    console.clear();

    function handleElements(cssSelector) {
        const elements = document.querySelectorAll(cssSelector);
        const handledElements = [];

        for (let element in elements) {
            handledElements.push(element);
        }

        return handledElements;
    }

    console.log(handleElements('a[href*=\\\"zog\\\"]'));
})();\""
alias please_js_copy_script_template="please_js_show_script_template | please_copy"
# tail
alias please_how_to_track_file_changes_using_tail='echo -e "tail -F \e[33mfileNameHere\e[0m
tail --follow=name --retry \e[33mfileNameHere\e[0m"'
# Git
alias gitl='git log --oneline --graph --max-count=15'
alias gits='git status'
alias gitb='git branch'
alias gitba='git branch -a'
alias gita='git add'
alias gitsel='git_select_branch.sh'
alias gitc='MY_GIT_BRANCH=$(git branch --show-current) && please_git checkout'
alias gitcprevious='MY_GIT_BRANCH=$(git branch --show-current) && git checkout -'
alias gitcd='MY_GIT_BRANCH=$(git branch --show-current) && please_git checkout develop'
alias gitcm='MY_GIT_BRANCH=$(git branch --show-current) && please_git checkout master'
alias gitcommit='git commit -m'
alias gitcamend='git commit --amend'
alias gitpoc='date; for remote in $(git remote); do git push $remote HEAD; done'
alias gitpoc-no-ci='date; git push -o ci.skip origin HEAD'
alias gitforcepoc='date; git push origin HEAD --force'
alias gitforcepoc-no-ci='date; gitpoc-no-ci --force'
alias gitCurrentPull='git_pull_current_branch.sh'
alias gitDevelopPull='git pull origin develop'
alias gitMasterPull='git pull origin master'
alias gitRebaseDevelop='git stash && git rebase develop && git stash pop'
alias gitStashPullDevelopRebaseDevelop='MY_GIT_BRANCH=$(git branch --show-current) && git stash && git checkout develop && git pull origin develop && git checkout $MY_GIT_BRANCH && git rebase develop && git stash pop'
alias gitPullDevelopRebaseDevelop='MY_GIT_BRANCH=$(git branch --show-current) && git checkout develop && git pull origin develop && git checkout $MY_GIT_BRANCH && git rebase develop'
alias git_reset_to_commit='git_reset_to_commit.sh'
alias git_remove_last_commit='git reset --hard HEAD~1'
alias git_reset_from_origin='git reset --hard "origin/$(git branch --show-current)"'
alias git_branch_create_and_select='git checkout -b'
alias git_branch_delete='git branch -D'
alias git_branch_rename='git branch -m'
alias please_git_what_was_my_previous_branch='echo "$MY_GIT_BRANCH"'
alias please_git_how_to_switch_to_previous_branch='echo "git checkout -"'
alias please_git_how_to_show_current_branch='echo -e "git branch --show-current
git symbolic-ref --short HEAD"'
alias please_git_how_to_edit_branch_description='echo -e "git branch --edit-description"'
alias please_git_how_to_show_branch_description='echo -e "git config branch.\e[33mbranchNameHere\e[0m.description"'
alias please_git_how_to_add_note_to_commit='echo "git note add"'
alias please_git_how_to_show_stash_modifications='echo -e "git stash show -p stash@{0}"'
alias please_git_how_to_stash_unstaged_changes='echo "git stash --include-untracked"'
alias please_git_how_to_remove_untracked_files='echo "git clean -fd"'
alias please_git_how_to_modify_last_commit_without_editing_commit_message='echo "git commit --amend --no-edit"'
alias please_git_how_to_push_with_options='echo -e "git push -o ci.variable=\"\e[33mvariableName=variableValue\"\e[0m -o ci.variable=\"\e[33mvariableName=variableValue\"\e[0m origin HEAD"'
alias please_git_how_to_show_staged_changes='echo "git diff --staged"'
alias please_git_how_to_show_unstaged_changes='echo "git diff HEAD"'
alias please_git_how_to_clone_from_github='echo -e "git clone https://github.com/\e[33muserName\e[0m/\e[33mrepositoryName\e[0m.git"'
alias please_git_how_to_push_repository_to_github='echo -e "git remote add origin  https://github.com/\e[33muserName\e[0m/\e[33mrepositoryName\e[0m.git\ngit push --set-upstream \e[33morigin master\e[0m"'
alias please_git_how_to_show_a_graphic_interface='echo "gitg"'
alias please_git_how_to_cherry_pick='echo -e "# Bring last commits of a branch to the active branch:
git cherry-pick ..\e[33mbranchName\e[0m

# Bring only the last commit of a branch to the active branch:
git cherry-pick \e[33mbranchName\e[0m"'
alias please_github_how_to_clone='echo -e "git clone https://github.com/\e[33muserName\e[0m/\e[33mrepo\e[0m.git"'
# service
alias please_how_to_stop_a_service='echo -e "sudo service \e[33mserviceNameHere actionHere\e[0m'
alias please_apache_stop='sudo service apache2 stop'
# mathematics
alias please_how_to_get_pi_value='echo -e "echo \"scale=10; 4*a(1)\" | bc -l"'
alias please_how_to_convert_hexadecimal_to_decimal='echo -e "echo \$((16#\e[33mvalueHere\e[0m))
echo \"obase=10; ibase=16; \e[33mvalueHere\e[0m\" | bc"'
alias please_how_to_convert_decimal_to_hexadecimal="echo -e \"printf '%x' \e[33mdecimalValueHere\e[0m\""
# composer
alias please_composer_how_to_show_packages='echo "composer info"'
alias please_composer_how_to_use_a_specific_branch='echo -e "In composer.json:
    {
        \"require\": {
            \"\e[33mme/myPackage\e[0m\": \"dev-\e[33mbranchName\e[0m as \e[33mversionAlias\e[0m\",
        },
        \"repositories\": [
            {
                \"type\": \"git\",
                \"url\": \"\e[33mhttps://myRepository.git\e[0m\"
            }
        ]
    }"'
# php
alias please_php_how_to_measure_execution_time='echo "\$start = microtime(true);
// your code here
var_dump(microtime(true) - \$start);
exit();"'
alias please_php_how_to_execute_a_line_of_code='echo "php -r"'
alias please_php_how_to_execute_some_lines_of_code_interactively='echo "php -a"'
alias please_php_how_to_display_some_info='echo "php -i"'
alias please_php_run='php -r'
alias please_php_run_interactively='php -a'
alias please_php_show_modules='php -m'
alias please_php_show_ini_files='php --ini'
alias please_php_start_web_server='php -S localhost:8000 -t public'
# php quality analysis
alias please_php_run_quality_tools='docker run --init -it --rm -v "$(pwd):/project" -v "$(pwd)/tmp-php-quality-analysis:/tmp" -w /project nicordev/php-tools-analysis:latest'
alias please_php_run_phpstan_analyse='please_php_run_quality_tools phpstan analyse'
alias please_php_run_infection='please_php_run_quality_tools infection'
# php infection
alias please_infection_remove_log_files='rm $(ls | grep infection.log)'
alias please_infection_how_to_remove_log_files='echo "rm $(ls | grep infection.log)"'
# php cs fixer
alias please_php_run_phpcsfixer='php php-cs-fixer.phar fix --config "./.php_cs.dist"'
# symfony
alias pbc='php bin/console'
alias please_symfony_console='php bin/console'
alias please_symfony_server_start='symfony server:start -d'
alias please_symfony_how_to_reset_database_and_create_migration='echo "php bin/console doctrine:database:drop --force && php bin/console doctrine:database:create && php bin/console make:migration"'
alias please_symfony_how_to_load_alice_fixtures='echo "php bin/console hautelook:fixtures:load"'
# Go to directory
alias cdmoi='cd ~/moi'
alias cddraft='cd ~/moi/.draft'
# uuid
alias please_generate_uuid4='curl "uuid4.com/?count=1"'
# random values
alias please_generate_random_string='tr -dc A-Za-z0-9_ < /dev/urandom | head -c 16 | xargs'
alias please_how_to_generate_random_string='echo "tr -dc A-Za-z0-9_ < /dev/urandom | head -c 16 | xargs"'
# .bashrc
alias please_source='source ~/.bashrc'
alias please_edit_bashrc='code ~/.bashrc'
alias please_edit_bash_aliases='code ~/.bash_aliases'
alias please_show_aliases='alias -p | sort'
# clipboard
alias please_copy='xclip -in -selection clipboard'
alias please_paste='xclip -out -selection clipboard'
alias please_paste_bash_code_in_file_and_run_it="echo '#! /bin/bash' > zog.sh; please_paste >> zog.sh && chmod +x zog.sh && ./zog.sh && rm ./zog.sh"
alias please_how_to_copy="echo 'someCommand | xclip -in -selection clipboard'"
alias please_how_to_paste="echo 'xclip -out -selection clipboard'"
alias please_create_script='create_script.sh'
alias please_create_please_script='create_please_script.sh'
# file
alias please_open_file_manager_here='xdg-open .'
alias please_chmod_x_recursive='chmod -R +x'
alias please_chmod_x_recursive_here='chmod -R +x .'
alias please_find='find_name.sh'
alias please_how_to_use_find='echo -e "find \e[33mpathHere\e[0m -name \e[33mnameHere\e[0m\n\n# find matches the whole path, so add .*/ in front of your regex:\nfind \e[33mpathHere\e[0m -regex \".*/\e[33mregexHere\"\e[0m"'
alias please_rmrf='sudo rm -rf'
alias please_copy_all='cp -r'
alias please_remove='please_rmrf'
alias please_change_folder_owner_and_its_content='sudo chown -R'
alias please_change_file_or_folder_owner='sudo chown'
alias please_change_file_or_folder_group='sudo chgrp'
alias please_how_to_create_link='echo -e "# Symbolic link:"; echo -e "ln --symbolic \e[33mfileHere\e[0m \e[33mlinkHere\e[0m"; echo -e "ln -s \e[33mfileHere\e[0m \e[33mlinkHere\e[0m"; echo -e "\n# Hard link:"; echo -e "ln \e[33mfileHere\e[0m \e[33mlinkHere\e[0m"'
alias please_how_to_count_files="echo -e 'ls -1 --file-type | grep --invert-match '/\\$' | wc -l'"
alias please_how_to_count_directories="echo -e 'ls -1 --file-type | grep '/\\$' | wc -l'"
alias please_how_to_count_files_and_directories="echo -e 'ls -1 | wc -l'"
# user and group
alias please_add_group_to_user='sudo usermod -aG'
alias please_how_to_get_current_user_id='echo "id -u"'
alias please_how_to_get_current_user_name='echo "id -un"'
alias please_how_to_get_current_group_id='echo "id -g"'
alias please_how_to_get_current_group_name='echo "id -gn"'
alias please_how_to_get_user_id='echo -e "id -u \e[33mnameOrIdHere\e[0m"'
alias please_how_to_get_user_name='echo -e "id -un \e[33mnameOrIdHere\e[0m"'
alias please_how_to_get_group_id='echo -e "id -g \e[33mnameOrIdHere\e[0m"'
alias please_how_to_get_group_name='echo -e "id -gn \e[33mnameOrIdHere\e[0m"'
# manage packages
alias please_upgrade_packages='upgrade_packages.sh'
# network
alias please_show_listening_ports='sudo lsof -i -P -n | grep LISTEN'
alias please_show_listening_ports_using_netstat='sudo netstat -ntlp | grep LISTEN'
# linux
alias please_what_is_the_current_distribution='cat /etc/os-release'
alias please_today='date "+%Y%m%d"'
alias please_change_files_owner_to_me='sudo chown --recursive $USER:$USER'
alias please_how_to_add_today_to_file_name='echo -e "mv \e[33mfileName\e[0m ${PLEASE_TODAY}_\e[33mfileName\e[0m"'
alias please_how_to_use_date_command="echo 'YYYY-MM-DD hh:mm:ss'; echo \"date '+%Y-%m-%d %H:%M:%S'\""
alias please_how_to_show_disk_space_usage='echo -e "df -h"; echo -e "du -h \e[33m/var/lib/snapd/snaps\e[0m"'
alias please_how_to_show_the_current_distribution='echo -e "cat /etc/os-release"'
alias please_how_to_list_disks='echo -e "df" && echo -e "\e[34mor\e[0m" && echo -e "sudo fdisk -l" && echo -e "\e[34mor\e[0m" && echo -e "lsblk"'
alias please_how_to_count_processor_cores='echo nproc'
alias please_how_to_show_ip='echo "ip address"'
alias please_how_to_unpack_tgz='echo -e "tar -xzf \e[33mfileName.tgz\e[0m -C \e[33mdirectoryName\e[0m\ntar --extract --ungzip --file=\e[33mfileName.tgz\e[0m --directory \e[33mdirectoryName\e[0m"'
alias please_how_to_remove_all_files_but_one='echo -e "rm -rf $(ls | grep --invert-match \e[33mfileToKeep\e0m)"'
alias please_how_to_show_disk_usage='echo "df -kh"'
alias please_how_to_search_previous_command='echo -e "ctl + r\nenter the beginning of the command\nctl + r again to cycle through results"'
alias please_how_to_change_files_owner='echo -e "sudo chown --recursive \e[33muserName:groupName pathToFiles\e[0m\nsudo chown -R \e[33muserName:groupName pathToFiles\e[0m"'
alias please_how_to_show_current_computer_name='echo "hostname
hostnamectl
cat /proc/sys/kernel/hostname"'
# help
alias please_how_to_show_help_of_a_command='echo -e "man \e[33mcommandName\e[0m
help \e[33mcommandName\e[0m"'
# apt
alias please_apt_how_to_list_installed_packages='echo "apt list --installed"'
alias please_apt_how_to_remove_repository='echo -e "rm /etc/apt/sources.list.d/\e[33mrepositoryNameHere\e[0m

sudo add-apt-repository --remove ppa:\e[33mauthor/repository\e[0m"'
alias please_apt_how_to_list_repositories='echo -e "apt policy

ls /etc/apt/sources.list.d/ | grep \e[33mrepositoryHint\e[0m"'
# snap
alias please_snap_how_to_list_installed_packages='echo "snap list"'
# commands
alias please_how_to_list_previous_commands='echo "history"'
alias please_how_to_edit_previous_command='echo "fc"'
alias please_how_to_execute_previous_command='echo -e "!!
!-1"'
alias please_how_to_list_all_commands='echo "compgen -c"'
# environment variables
alias please_how_to_list_all_environment_variables='echo "env"'
# printer
alias please_how_to_print='echo "lp"'
alias please_how_to_show_printers='echo "lpstat -t"'
# grep
alias please_grep_how_to_use_or_operator="echo -e \"
Extended grep:
grep --extended-regexp '\e[33myourFirstCriteria\e[0m|\e[33myourSecondCriteria\e[0m'
grep -E '\e[33myourFirstCriteria\e[0m|\e[33myourSecondCriteria\e[0m'
egrep '\e[33myourFirstCriteria\e[0m|\e[33myourSecondCriteria\e[0m'

Basic grep:
grep -e \e[33myourFirstCriteria\e[0m -e \e[33myourSecondCriteria\e[0m
grep '\e[33myourFirstCriteria\e[0m\\|\e[33myourSecondCriteria\e[0m'
\""
alias please_grep_how_to_match_word="echo \"
grep \"\b\e[33myourCriteriaHere\e[0m\b\"
\""
alias please_grep_how_to_use_capturing_groups_to_repeat_pattern_in_the_same_query="echo \"
Here myPatternToRepeatHere is repeated at \\1
grep 'aFirstPattern\(myPatternToRepeatHere\)someOtherPattern\\1againAnotherPattern'
\""
alias please_grep_how_to_invert_match='echo -e "grep -v \e[33mpatternHere\e[0m
grep --invert-match \e[33mpatternHere\e[0m"'
alias please_grep_how_to_use_extended_regex='echo -e "grep -E \e[33mpatternHere\e[0m
grep --extended-regexp \e[33mpatternHere\e[0m"'
alias please_grep_how_to_find_in_files='echo -e "-R or --dereference-recursive mandatory to search in files:
grep -R \e[33mcriteriaHere directoryHere\e[0m
grep --dereference-recursive \e[33mcriteriaHere directoryHere\e[0m

Look only in certain files:
grep --dereference-recursive \e[33mcriteriaHere\e[0m --include=\e[33mpatternHere directoryHere\e[0m

Exclude certain files:
grep --dereference-recursive \e[33mcriteriaHere\e[0m --exclude=\e[33mpatternHere directoryHere\e[0m

Show line numbers:
grep -R -n \e[33mcriteriaHere directoryHere\e[0m
grep --dereference-recursive --line-number \e[33mcriteriaHere directoryHere\e[0m

Case insensitive:
grep -R -i \e[33mcriteriaHere directoryHere\e[0m
grep --dereference-recursive --ignore-case \e[33mcriteriaHere directoryHere\e[0m"'
# sed
alias please_sed_browse_documentation='echo "http://www.gnu.org/software/sed/manual/sed.html"'
alias please_sed_how_to_find_in_file='echo -e "sed -nE \"s#\e[33msomeCharactersHere(yourCapturingGroup)\e[0m#\1#p\" \e[33mfileNameHere\e[0m
sed --quiet --regexp-extended \"s#\e[33msomeCharactersHere(yourCapturingGroup)\e[0m#\1#p\" \e[33mfileNameHere\e[0m"'
alias please_sed_how_to_print_lines='echo -e "One line:
sed -n \"\e[33mlineNumberHere\e[0mp\" \e[33mfileNameHere\e[0m
sed --quiet \"\e[33mlineNumberHere\e[0mp\" \e[33mfileNameHere\e[0m

Multiple lines:
sed -n \"\e[33mlineNumberHere\e[33m;\e[0manotherLineNumberHere\e[0m;\e[0manotherLineNumberHere\e[0mp\" \e[33mfileNameHere\e[0m

Consecutive lines:
sed -n \"\e[33mlineRangeStart\e[33m,\e[0mlineRangeEnd\e[0mp\" \e[33mfileNameHere\e[0m
"'
alias please_sed_how_to_capture_string='echo -e "sed --quiet \"s#\e[33mYour pattern here with escaped parenthesis \e[0m\(like that\)\e[33m to capture groups\e[0m#\e[33mHere the first capture group \e[0m\1\e[33m and the second \e[0m\2#p\" fileName" or just \"-n\"'
alias please_sed_how_to_remove_first_line='echo -e "sed -i 1d \e[33mfileNameHere\e[0m"'
alias please_sed_how_to_remove_last_line='echo -e "sed -i \$d \e[33mfileNameHere\e[0m"'
alias please_sed_how_to_append_to_last_line="echo -e \"sed -i '\\\$a\\'\e[33mcontentHere\e[0m \e[33mfileNameHere\e[0m\""
# awk
alias please_awk_how_to_print_first_fields="echo \"awk '{ print \\\$1, \\\$2, \\\$3; }'\""
alias please_awk_how_to_print_last_field='echo "awk \"{ print \$NF; }\""'
alias please_awk_how_to_set_field_separator='echo -e "awk --field-separator \e[33mfileSeparatorHere { awkCodeHere }\e[0m
awk -F \e[33mfileSeparatorHere { awkCodeHere }\e[0m"'
alias please_awk_browse_documentation='echo "https://www.gnu.org/software/gawk/manual/gawk.html"'
# tr
alias please_how_to_replace_character='echo -e "echo \e[33msomeTextHere\e[0m | tr \e[33mcharacterToReplace\e[0m \e[33mcharacterToAdd\e[0m"'
alias please_how_to_remove_character='echo -e "echo \e[33msomeTextHere\e[0m | tr -d \e[33mcharacterToRemove\e[0m
echo \e[33msomeTextHere\e[0m | tr --delete \e[33mcharacterToRemove\e[0m"'
# usb key
alias please_how_to_unmount_usb_key='echo -e "umount \e[33mcheminVers/CléUsb\e[0m"'
alias please_how_to_format_usb_key='echo -e "sudo mkfs.vfat -n \e[33mNOUVEAU_NOM_CLE_USB\e[0m -I \e[33m/dev/sdb\e[0m"'
alias please_how_to_create_bootable_usb_key='echo -e "\e[34mFirst unmount the key, format the key then\e[0m" && echo -e "sudo dd bs=4M if=\e[33mcheminVers/FichierImage.iso\e[0m of=\e[33m/dev/sdb status=progress\e[0m"'
# generate random things
alias please_generate_a_random_string='tr -dc A-Za-z0-9_ < /dev/urandom | head -c 16 | xargs'
# time
alias please_what_is_the_current_week_number='echo "Using bash: " && date +%W && echo "Using php: " && php -r "echo (new DateTime())->format(\"W\");"'
alias please_what_time_is_it='date'
alias please_what_is_this_timestamp='read_timestamp.php'
alias please_what_is_this_date_timestamp='write_timestamp.php'
alias please_how_to_measure_script_duration='echo -e "Using SECONDS:
SECONDS=0; echo \$SECONDS; \e[33myourCodeHere\e[0m; echo \$((\$SECONDS / 60)):\$((\$SECONDS % 60))"

Using time:
time \e[33myourCodeHere\e[0m'
alias please_how_to_measure_script_performance='echo -e "time --format \"%C %E\" \e[33myourCodeHere\e[0m"'
# bash
alias please_bash_how_to_ask_confirmation="echo '_askConfirmationDefaultYes() {
    echo -e \"\e[1mContinue?\e[0m [YES/no] \"
    read answer

    if [[ ${answer,,} =~ ^n ]]; then
        return 1
    fi

    return 0
}

_askConfirmationDefaultYes || exit

askConfirmationDefaultNo() {
    echo -e \"\e[1mContinue?\e[0m [yes/NO] \"
    read answer

    if [[ ${answer,,} =~ ^y ]]; then

        return 0
    fi

    return 1
}

_askConfirmationDefaultNo || exit'"
alias please_bash_how_to_get_random_number="echo 'echo \$RANDOM'"
alias please_bash_how_to_read_stdin_for_pipes="echo 'myVariable=\$(cat -)'"
alias please_bash_how_to_declare_variables="echo -e '\e[33mvariableName\e[0m=\e[33mvariableValue\e[0m
declare -i \e[33mvariableAsIntegerName\e[0m=\e[33mintegerValue\e[0m'"
alias please_bash_how_to_format_text='how_to_format_text.sh'
alias please_bash_how_to_loop="echo -e 'for \e[33mi\e[0m in {\e[33m0..10\e[0m}; do \e[33mecho \$i\e[0m; done'"
alias please_bash_how_to_loop_through_files='echo -e "for \e[33mfile\e[0m in *; do \e[33mecho "\$file"\e[0m; done"'
alias please_bash_how_to_loop_through_lines_of_a_file='echo -e "while IFS= read -r \e[33mline\e[0m; do \e[33mecho "\$line"\e[0m; done < \e[33mfile\e[0m"'
alias please_bash_how_to_regex="echo -e 'if [[ \e[33m\"stringHere\"\e[0m =~ \e[33mregexHere\e[0m ]];then \e[33mecho \"true\"\e[0m; else \e[33mecho \"false\"\e[0m; fi'"
alias please_bash_how_to_remove_newline="echo -e '\e[33mecho \$someStringWithNewLines\e[0m | sed -z \"s#\\\n# #g\"'; echo -e '\e[33mecho \$someStringWithNewLines\e[0m | awk 1 ORS=\" \"'"
alias please_bash_how_to_rerun_last_command="echo '!!'"
alias please_bash_how_to_get_last_output="echo -e 'Rerun the last command and pass the output to another command:\n\e[33mmyCommandName\e[0m \$(!!)'"
alias please_bash_how_to_get_user_number="echo 'echo \$EUID'"
alias please_bash_how_to_get_user_name="echo 'echo \$USER'"
alias please_bash_how_to_get_current_function_name='echo "\${FUNCNAME[0]}"'
alias please_bash_how_to_get_current_script_name="echo -e 'SCRIPT_NAME=\$(basename \$0)\nSCRIPT_NAME=\$(basename \$BASH_SOURCE)'"
alias please_bash_how_to_get_current_script_user='echo "user=$(whoami)"'
alias please_bash_how_to_write_variable_default_value='echo -e "\e[33mvariableName\e[0m=\${\e[33motherVariable1\e[0m:-\e[33mhardCodedDefaultValue\e[0m}
\e[33mvariableName\e[0m=\${\e[33motherVariable1\e[0m:-\${\e[33motherVariable2\e[0m:-\e[33mhardCodedDefaultValue\e[0m}}"'
alias please_bash_how_to_extract_file_name_from_full_path='echo "extractFileName() {
    echo \${@##*/}
}"'
alias please_bash_condition_variable_is_empty='echo "if [ -z $variableName ]"'
alias please_bash_condition_variable_is_not_empty='echo "if [ -n $variableName ]"'
alias please_bash_how_to_change_directory_from_a_script='echo -e "cd \e[33mdirectoryHere\e[0m\n\$SHELL"'
# bourne shell sh
alias please_sh_how_to_regex='echo -e "Use grep:
if ! echo \e[33m\$variableName\e[0m | grep --quiet \e[33m\"^2\"\e[0m
then
    \e[33mdoSomething\e[0m
fi"'
# crontab
alias please_crontab_how_to_set_or_update_cron="echo -e 'crontab -e
\e[33mminutesHere hoursHere dayHere monthHere weekDayWhere0IsSundayHere yourCommandHere\e[0m

  Day Name\t0,6\tSaturday and Sunday

  Month\t\t*/2\tEvery month that is divisible by 2 (even) months.

  Day Date\t*\tEvery Date

  Hour\t\t3-6\tBetween 3 and 6 AM

  Minutes\t*/5\tEvery 5 Minutes'"
alias please_crontab_how_to_clear_crontab="echo 'crontab -r'"
# DNS
alias please_how_to_get_server_ip_from_url='echo -e "dig \e[33murlHere\e[0m
host \e[33murlHere\e[0m
ping \e[33murlHere\e[0m"'
alias please_how_to_clear_dns_cache='echo -e "sudo systemd-resolve --flush-caches && sudo systemd-resolve --statistics
sudo systemctl restart systemd-resolved && sudo systemd-resolve --statistics"'
alias please_clear_dns_cache='sudo systemctl restart systemd-resolved && sudo systemd-resolve --statistics'
alias please_add_dns_cloudflare="sudo sed -i '\$a\nameserver 1.1.1.1 # cloudflare' /etc/resolv.conf; cat /etc/resolv.conf"
alias please_how_to_set_dns='echo -e "Edit /etc/resolv.conf

Add DNS IP:
#nameserver 8.8.8.8 # google
nameserver 1.1.1.1 # cloudflare
"'
alias please_how_to_test_dns='echo -e "nslookup

then enter domain name"'
# box
alias please_how_to_browse_box_configuration='echo "http://192.168.1.254/"'
# make
alias please_make_browse_documentation='echo "https://www.gnu.org/software/make/manual/html_node/Concept-Index.html#Concept-Index"'
alias please_make_how_to_get_filename='echo ""'
# SQL
alias please_sql_browse_tutorials='echo "https://sql.sh/"'
alias please_sql_how_to_select='echo -e "select \e[33mtableAlias.propertyName\e[0m as \e[33mpropertyAlias\e[0m from \e[33mtableName tableAlias\e[0m
where \e[33mtableAlias.otherPropertyName\e[0m = \e[33mvalue\e[0m;

SELECT \e[33mcolumnName1\e[0m, \e[33mcolumnName2\e[0m, \e[33mcolumnName3\e[0m
FROM \e[33mtableName\e[0m
ORDER BY \e[33mcolumnName1\e[0m DESC, \e[33mcolumnName2\e[0m ASC"'
alias please_sql_how_to_update='echo -e "update \e[33mtableName\e[0m set \e[33mcolumnName1\e[0m = \e[33mvalue1\e[0m, \e[33mcolumn_name2\e[0m = \e[33mvalue2\e[0m where \e[33mcolumnName\e[0m = \e[33mvalue\e[0m;"'
# postgresql
alias please_psql_browse_documentation='echo "https://www.postgresql.org/docs/9.2/app-psql.html"'
alias please_psql_how_to_execute_sql_file='echo -e "psql -f \e[33msqlFile\e[0m
psql --file=\"\e[33msqlFile\e[0m\""'
alias please_psql_how_to_execute_sql_statement='echo -e "psql -c \e[33msqlStatement\e[0m
psql --command=\"\e[33msqlStatement\e[0m\""'
# fix error
alias please_fix_error_debconf_config_locked='echo -e "Will fix \e[34mdebconf: DbDriver "config": /var/cache/debconf/config.dat is locked by another process: Resource temporarily unavailable\e[0m\n"; sudo fuser -vik /var/cache/debconf/config.dat'
# vscode
alias please_code_moi='codium ~/moi'
alias code='codium'
alias please_vscodium_what_is_the_latest_release='echo "https://github.com/VSCodium/vscodium/releases/latest"'
# docker
alias please_docker_show_container_ip='please_docker.sh showContainerIp'
alias please_docker_show_network_ip='please_docker.sh showNetworkIp'
alias please_docker_clean='docker system prune'
alias please_docker_login='docker login'
alias please_docker_logout='docker logout'
alias please_docker_exec='docker_exec.sh'
alias please_docker_exec_sh='docker_exec_sh.sh'
alias please_docker_remove_containers='docker_remove_containers.sh'
alias please_docker_remove_images='docker_remove_images.sh'
alias please_docker_push_image_to_docker_hub='docker push'
alias please_docker_run_named_container_in_background='docker run -d --name'
alias please_docker_run_named_container='docker run --name'
alias please_docker_run_unnamed_container='docker run'
alias please_docker_remove_container='docker container rm --force'
alias please_docker_how_to_remove_image='echo -e "docker image rm --force \e[33mimageIdHere [imageIdHere]\e[0m"'
alias please_docker_how_to_list_container_ids_only='echo -e "docker container ls --quiet\ndocker ps -q"'
alias please_docker_how_to_list_all_containers='echo -e "docker container ls --all\ndocker ps -a"'
alias please_docker_how_to_remove_all_containers='echo -e "docker rm --force \$(docker ps -aq)"'
alias please_docker_how_to_show_container_ip='echo -e "docker inspect -f \"{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}\" \e[33mcontainerNameOrId\e[0m"'
alias please_docker_how_to_login='echo -e "docker login -u \e[33musernameHere\e[0m -p \e[33mpasswordHere\e[0m"'
alias please_docker_how_to_logout='echo "docker logout"'
alias please_docker_how_to_push_image_to_docker_hub='echo -e "docker push \e[33mnomCompte/nomImage:nomTag\e[0m"'
alias please_docker_how_to_run_container_with_specific_port="echo -e \"docker run -d -p \e[33mnuméroPortMachine:numéroPortConteneur nomImageCréée\e[0m\""
alias please_docker_how_to_run_container_in_background="echo -e \"docker run -d --name \e[33mcontainerName imageName\e[0m\""
alias please_docker_how_to_run_container_then_remove_it='echo -e "docker run --rm \e[33mimageNameHere\e[0m"'
alias please_docker_how_to_run_container_with_a_terminal='echo -e "docker run --interactive --tty \e[33mimageNameHere\e[0m"
docker run -it \e[33mimageNameHere\e[0m"'
alias please_docker_how_to_remove_container="echo -e \"docker rm --force \e[33mcontainerName\e[0m\""
alias please_docker_how_to_build_image="echo -e \"docker build -t \e[33mnomImage\e[0m -f \e[33mnomFichierDockerfileSouhaité cheminVersLeDossierContenantLeDockerfile\e[0m\""
alias please_docker_how_to_rename_image="echo -e \"docker image tag \e[33midImageOuCoupleNomImage:nomTag nouveauNomImage:nouveauTag\e[0m\""
alias please_docker_how_to_run_php_script="echo -e 'docker run -it --rm --name \e[33mnomFichier.php\e[0m -v "\$PWD":/usr/src/myapp -w /usr/src/myapp \e[33mphp:7.4-cli\e[0m php \e[33myour-script.php\e[0m'"
alias please_docker_how_to_run_composer="echo -e 'docker run --interactive --tty composer \e[33mcommandHere\e[0m'"
alias please_docker_how_to_create_sculpin_blog="echo -e 'docker run --interactive --tty composer  create-project sculpin/blog-skeleton \e[33mprojectNameHere\e[0m'"
# Google Cloud Platform (GCP)
alias please_login_google_cloud_platform='gcloud auth login'
# jekyll static website generator
alias please_jekyll_install='bundle install'
alias please_jekyll_serve='bundle exec jekyll serve'
alias please_jekyll_serve_live_reload='bundle exec jekyll serve --livereload'
alias please_jekyll_how_to_install_jekyll='~/how_to/how_to_install_jekyll.sh'
alias please_jekyll_how_to_create_new_jekyll_project='~/how_to/how_to_create_new_jekyll_project.sh'
# website
alias please_crawl_a_website='wget -rkpE'
# wget
alias please_wget_how_to_download_files_to_file='echo -e "wget \e[33murlHere\e[0m --output-document=\e[33mfileNameHere\e[0m
wget \e[33murlHere\e[0m -O \e[33mfileNameHere\e[0m"'
# curl
alias please_curl_how_to_save_content_to_file='echo -e "curl \e[33murlHere\e[0m --output \e[33mfileNameHere\e[0m
curl \e[33murlHere\e[0m -o \e[33mfileNameHere\e[0m"'
alias please_curl_how_to_download_file='echo -e "curl --remote-name \e[33murlHere\e[0m
curl -O \e[33murlHere\e[0m"'
alias please_curl_how_to_get_http_status_code="echo -e \"Get only the code:
curl --write-out '%{http_code}' --output /dev/null --silent \e[33murlHere\e[0m
curl -w '%{http_code}' -o /dev/null -s \e[33murlHere\e[0m
\""
# yakuake
alias please_yakuake_start='yakuake'
# firefox
alias firefox_dev='/home/nicolas/firefox_developer/firefox &'
# calendar
alias please_browse_calendar='echo "https://www.calendriergratuit.fr/calendrier-2022.htm"'
# gnome
alias please_gnome_activate_night_light='gnome_night_light.sh on'
alias please_gnome_deactivate_night_light='gnome_night_light.sh off'
# QR code
alias please_how_to_encode_qr_code="echo -e \"cat \e[33minputFileName\e[0m | qrencode --type \e[33m{PNG,PNG32,EPS,SVG,XPM,ANSI,ANSI256,ASCII,ASCIIi,UTF8,ANSIUTF8}\e[0m --output=\e[33moutputFileName\e[0m\""
alias please_encode_qr_code='qrencode'
# Portainer
alias please_portainer_start=" docker run -d -p 8000:8000 -p 9090:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce"
alias please_portainer_browse="firefox http://127.0.0.1:9090"
# gif
alias please_gif_how_to_record_gif='echo "peek"'
alias please_gif_record='peek'
# SSH
alias please_ssh_how_to_generate_keys='echo -e "ssh-keygen"'