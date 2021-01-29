# list
alias llg="filter_list.sh --full"
alias lg='filter_list.sh'
alias lh='ls -alFh'
# cd
alias cdDownloads='cd ~/Downloads'
alias cdschool='cd ~/moi/project/school'
# Nano
alias nano='nano -miA'
# Todo
alias please_todo='vim ~/Desktop/todo.md'
# image
alias please_show_image_dimensions='file'
# markdown
alias please_show_file_as_markdown='mdless'
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
alias gitforcepoc='date; gitpoc --force'
alias gitCurrentPull='git_pull_current_branch.sh'
alias gitDevelopPull='git pull origin develop'
alias gitMasterPull='git pull origin master'
alias git_reset_to_commit='git_reset_to_commit.sh'
alias git_remove_last_commit='git reset --hard HEAD~1'
alias git_reset_from_origin='git reset --hard origin'
alias git_branch_create_and_select='git checkout -b'
alias git_branch_delete='git branch -D'
alias git_branch_rename='git branch -m'
# service
alias please_how_to_stop_a_service='echo -e "sudo service \e[33mserviceNameHere actionHere\e[0m'
alias please_stop_apache='sudo service apache2 stop'
# php
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
# Go to directory
alias cdmoi='cd ~/moi'
alias cddraft='cd ~/moi/.draft'
# Please
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
alias please_how_to_show_disk_space_usage='echo -e "df -h"; echo -e "du -h \e[33m/var/lib/snapd/snaps\e[0m"'
alias please_how_to_show_the_current_distribution='echo -e "cat /etc/os-release"'
alias please_how_to_list_disks='echo -e "df" && echo -e "\e[34mor\e[0m" && echo -e "sudo fdisk -l" && echo -e "\e[34mor\e[0m" && echo -e "lsblk"'
alias please_how_to_count_processor_cores='echo nproc'
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
# fix error
alias please_fix_error_debconf_config_locked='echo -e "Will fix \e[34mdebconf: DbDriver "config": /var/cache/debconf/config.dat is locked by another process: Resource temporarily unavailable\e[0m\n"; sudo fuser -vik /var/cache/debconf/config.dat'
# vscode
alias please_code_moi='code ~/moi'
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