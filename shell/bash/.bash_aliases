# list
alias llg="filter_list.sh --full"
alias lg='filter_list.sh'
alias lh='ls -alFh'
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
# Git
alias gitl='git log --oneline --graph'
alias gits='git status'
alias gitb='git branch'
alias gitba='git branch -a'
alias gita='git add'
alias gitsel='git_select_branch.sh'
alias gitc='git checkout'
alias gitcd='git checkout develop'
alias gitcm='git checkout master'
alias gitcommit='git commit -m'
alias gitcamend='git commit --amend'
alias gitpoc='date; git push origin HEAD'
alias gitpoc-no-ci='date; git push -o ci.skip origin HEAD'
alias gitforcepoc='date; gitpoc --force'
alias gitforcepoc-no-ci='date; gitpoc-no-ci --force'
alias gitCurrentPull='git_pull_current_branch.sh'
alias gitDevelopPull='git pull origin develop'
alias gitMasterPull='git pull origin master'
alias gitRebaseDevelop='git stash && git rebase develop && git stash pop'
alias gitPullDevelopRebaseDevelop='MY_GIT_BRANCH=$(git branch --show-current) && git stash && git checkout develop && git pull origin develop && git checkout $MY_GIT_BRANCH && git rebase develop && git stash pop'
alias git_reset_to_commit='git_reset_to_commit.sh'
alias git_remove_last_commit='git reset --hard HEAD~1'
alias git_reset_from_origin='git reset --hard origin'
alias git_branch_create_and_select='git checkout -b'
alias git_branch_delete='git branch -D'
alias git_branch_rename='git branch -m'
alias please_git_how_to_show_stash_modifications='echo -e "git stash show -p stash@{0}"'
alias please_git_how_to_remove_untracked_files='echo "git clean -fd"'
alias please_git_how_to_modify_last_commit_without_editing_commit_message='echo "git commit --amend --no-edit"'
alias please_git_how_to_push_with_options='echo -e "git push -o ci.variable=\"\e[33mvariableName=variableValue\"\e[0m -o ci.variable=\"\e[33mvariableName=variableValue\"\e[0m origin HEAD"'
alias please_git_how_to_show_staged_changes='echo "git diff --staged"'
alias please_git_how_to_show_unstaged_changes='echo "git diff HEAD"'
# service
alias please_how_to_stop_a_service='echo -e "sudo service \e[33mserviceNameHere actionHere\e[0m'
alias please_stop_apache='sudo service apache2 stop'
# composer
alias please_composer_how_to_show_packages='echo "composer info"'
# php
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
alias please_run_phpstan_analyse='please_php_run_quality_tools phpstan analyse'
alias please_run_infection='please_php_run_quality_tools infection'
# php cs fixer
alias please_run_phpcsfixer='php php-cs-fixer.phar fix --config "./.php_cs.dist"'
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
# .bashrc
alias please_source='source ~/.bashrc'
alias please_edit_bashrc='vim ~/.bashrc'
alias please_edit_bash_aliases='vim ~/.bash_aliases'
alias please_show_aliases='alias -p | sort'
# clipboard
alias please_copy='xclip -in -selection clipboard'
alias please_paste='xclip -out -selection clipboard'
alias please_how_to_copy="echo 'someCommand | xclip -in -selection clipboard'"
alias please_how_to_paste="echo 'xclip -out -selection clipboard'"
alias please_create_script='create_script.sh'
alias please_create_please_script='create_please_script.sh'
# file
alias please_open_file_manager_here='xdg-open .'
alias please_chmod_x_recursive='chmod -R +x'
alias please_chmod_x_recursive_here='chmod -R +x .'
alias please_find='find_name.sh'
alias please_rmrf='sudo rm -rf'
alias please_copy_all='cp -r'
alias please_remove='please_rmrf'
alias please_change_folder_owner_and_its_content='sudo chown -R'
alias please_change_file_or_folder_owner='sudo chown'
alias please_change_file_or_folder_group='sudo chgrp'
# user and group
alias please_add_group_to_user='sudo usermod -aG'
# manage packages
alias please_upgrade_packages='upgrade_packages.sh'
# network
alias please_show_listening_ports='sudo lsof -i -P -n | grep LISTEN'
alias please_show_listening_ports_using_netstat='sudo netstat -ntlp | grep LISTEN'
# linux
alias please_what_is_the_current_distribution='cat /etc/os-release'
alias please_show_date_concatenated='date "+%Y%m%d"'
alias please_how_to_show_date_concatenated='echo "date \"+%Y%m%d\""'
alias please_how_to_show_disk_space_usage='echo -e "df -h"; echo -e "du -h \e[33m/var/lib/snapd/snaps\e[0m"'
alias please_how_to_show_the_current_distribution='echo -e "cat /etc/os-release"'
alias please_how_to_list_disks='echo -e "df" && echo -e "\e[34mor\e[0m" && echo -e "sudo fdisk -l" && echo -e "\e[34mor\e[0m" && echo -e "lsblk"'
alias please_how_to_count_processor_cores='echo nproc'
alias please_how_to_show_ip='echo "ip address"'
alias please_how_to_unpack_tgz='echo -e "tar -xzf \e[33mfileName.tgz\e[0m\ntar --extract --ungzip --file=\e[33mfileName.tgz\e[0m"'
alias please_how_to_remove_all_files_but_one='echo -e "rm -rf $(ls | grep --invert-match \e[33mfileToKeep\e0m)"'
alias please_how_to_show_disk_usage='echo "df -kh"'
alias please_how_to_search_previous_command='echo -e "ctl + r\nenter the beginning of the command\nctl + r again to cycle through results"'
alias please_how_to_change_files_owner='echo -e "sudo chown --recursive \e[33muserName:groupName pathToFiles\e[0m\nsudo chown -R \e[33muserName:groupName pathToFiles\e[0m"'
alias please_change_files_owner_to_me='sudo chown --recursive $USER:$USER'
# sed
alias please_sed_how_to_capture_string='echo -e "sed --quiet \"s#\e[33mYour pattern here with escaped parenthesis \e[0m\(like that\)\e[33m to capture groups\e[0m#\e[33mHere the first capture group \e[0m\1\e[33m and the second \e[0m\2#p\" fileName" or just \"-n\"'
alias please_sed_how_to_remove_first_line='echo -e "sed -i 1d \e[33mfileNameHere\e[0m"'
alias please_sed_how_to_remove_last_line='echo -e "sed -i $d \e[33mfileNameHere\e[0m"'
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
# bash
alias please_bash_how_to_read_stdin_for_pipes="echo 'myVariable=\$(cat -)'"
alias please_bash_how_to_format_text='how_to_format_text.sh'
alias please_bash_how_to_loop="echo -e 'for \e[33mi\e[0m in {\e[33m0..10\e[0m}; do \e[33mecho \$i\e[0m; done'"
alias please_bash_how_to_remove_newline="echo -e '\e[33mecho \$someStringWithNewLines\e[0m | sed -z \"s#\\\n# #g\"'; echo -e '\e[33mecho \$someStringWithNewLines\e[0m | awk 1 ORS=\" \"'"
alias please_bash_how_to_rerun_last_command="echo '!!'"
alias please_bash_how_to_get_last_output="echo -e 'Rerun the last command and pass the output to another command:\n\e[33mmyCommandName\e[0m \$(!!)'"
alias please_bash_how_to_get_user_number="echo 'echo \$EUID'"
alias please_bash_how_to_get_user_name="echo 'echo \$USER'"
alias please_bash_how_to_get_current_function_name='echo "\${FUNCNAME[0]}"'
alias please_bash_how_to_get_current_script_name='echo "SCRIPT_NAME=$(basename $0)"'
alias please_bash_how_to_get_current_script_user='echo "user=$(whoami)"'
# fix error
alias please_fix_error_debconf_config_locked='echo -e "Will fix \e[34mdebconf: DbDriver "config": /var/cache/debconf/config.dat is locked by another process: Resource temporarily unavailable\e[0m\n"; sudo fuser -vik /var/cache/debconf/config.dat'
# vscode
alias please_code_moi='codium ~/moi'
alias code='codium'
# docker
alias please_docker_show_container_ip='please_docker.sh showContainerIp'
alias please_docker_show_network_ip='please_docker.sh showNetworkIp'
alias please_docker_clean='docker system prune'
alias please_docker_login='docker login'
alias please_docker_logout='docker logout'
alias please_docker_exec='docker_exec.sh'
alias please_docker_exec_sh='docker_exec_sh.sh'
alias please_docker_how_to_list_container_ids_only='echo -e "docker container ls --quiet\ndocker ps -q"'
alias please_docker_how_to_list_all_containers='echo -e "docker container ls --all\ndocker ps -a"'
alias please_docker_how_to_remove_all_containers='echo -e "docker rm -f \$(docker ps -aq)"'
alias please_docker_how_to_show_container_ip='echo -e "docker inspect -f \"{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}\" \e[33mcontainerNameOrId\e[0m"'
alias please_docker_remove_containers='docker_remove_containers.sh'
alias please_docker_remove_images='docker_remove_images.sh'
alias please_docker_push_image_to_docker_hub='docker push'
alias please_docker_run_named_container_in_background='docker run -d --name'
alias please_docker_run_named_container='docker run --name'
alias please_docker_run_unnamed_container='docker run'
alias please_docker_remove_container='docker container rm --force'
alias please_docker_how_to_login='echo -e "docker login -u \e[33musernameHere\e[0m -p \e[33mpasswordHere\e[0m"'
alias please_docker_how_to_logout='echo "docker logout"'
alias please_docker_how_to_push_image_to_docker_hub='echo -e "docker push \e[33mnomCompte/nomImage:nomTag\e[0m"'
alias please_docker_how_to_run_container_with_specific_port="echo -e \"docker run -d -p \e[33mnuméroPortMachine:numéroPortConteneur nomImageCréée\e[0m\""
alias please_docker_how_to_run_container_in_background="echo -e \"docker run -d --name \e[33mcontainerName imageName\e[0m\""
alias please_docker_how_to_remove_container="echo -e \"docker rm --force \e[33mcontainerName\e[0m\""
alias please_docker_how_to_build_image="echo -e \"docker build -t \e[33mnomImage\e[0m -f \e[33mnomFichierDockerfileSouhaité cheminVersLeDossierContenantLeDockerfile\e[0m\""
alias please_docker_how_to_rename_image="echo -e \"docker image tag \e[33midImageOuCoupleNomImage:nomTag nouveauNomImage:nouveauTag\e[0m\""
alias please_docker_how_to_run_php_script="echo -e 'docker run -it --rm --name \e[33mnomFichier.php\e[0m -v "\$PWD":/usr/src/myapp -w /usr/src/myapp \e[33mphp:7.4-cli\e[0m php \e[33myour-script.php\e[0m'"
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
# yakuake
alias please_yakuake_start='yakuake'
# firefox
alias firefox_dev='/home/nicolas/firefox_developer/firefox &'
# gnome
alias please_gnome_activate_night_light='gnome_night_light.sh on'
alias please_gnome_deactivate_night_light='gnome_night_light.sh off'
# QR code
alias please_how_to_encode_qr_code="echo -e \"cat \e[33minputFileName\e[0m | qrencode --type \e[33m{PNG,PNG32,EPS,SVG,XPM,ANSI,ANSI256,ASCII,ASCIIi,UTF8,ANSIUTF8}\e[0m --output=\e[33moutputFileName\e[0m\""
alias please_encode_qr_code='qrencode'
# Portainer
alias please_portainer_start=" docker run -d -p 8000:8000 -p 9090:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce"
alias please_portainer_browse="firefox http://127.0.0.1:9090"

# Autocompletion
please_docker_options=$(please_docker)
complete -W "${please_docker_options}" -o bashdefault -o default 'please_docker'

please_git_options=$(please_git)
complete -W "${please_git_options}" -o bashdefault -o default 'please_git'