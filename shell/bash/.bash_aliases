# Variables
PLEASE_TODAY=$(date +%Y%m%d)
PLEASE_FRUITS="apple
cherry
banana
pear
orange"

# Dummy file
alias please_create_dummy_file_containing_fruits="echo \"$PLEASE_FRUITS\" > fruits"
# printf
alias please_printf_how_to_use='printf "
printf \"\e[33msomeStringHere\e[0m%%s\e[33msomeStringHere\e[0m\" \e[33mstringThatWillReplace%%sHere\e[0m
printf \"\e[33msomeStringHere\e[0m%%i\e[33msomeStringHere\e[0m\" \e[33mintegerThatWillReplace%%iHere\e[0m
printf \"\e[33msomeStringHere\e[0m%%d\e[33msomeStringHere\e[0m\" \e[33mintegerThatWillReplace%%dHere\e[0m
printf \"\e[33msomeStringHere\e[0m%%x\e[33msomeStringHere\e[0m\" \e[33mhexadecimalValueThatWillReplace%%xHere\e[0m
LC_NUMERIC=\"en_US.UTF-8\" printf \"\e[33msomeStringHere\e[0m%%0.\e[33mprecision\e[0mf\e[33msomeStringHere\e[0m\" \e[33mfloatThatWillReplace%%fHere\e[0m
"'
# list
alias llg="filter_list.sh --full"
alias lg='filter_list.sh'
alias lh='ls -alFh'
alias l='ls -1'
# cd
alias cdDownloads='cd ~/Downloads'
alias please_night_mode='sct 1850'
alias please_day_mode='sct 6500'
# Nano
alias nano='nano -miA'
# Todo
alias please_todo='vim ~/Desktop/todo.md'
# image
alias please_show_image_dimensions='file'
alias please_how_to_show_image_dimensions='echo "file"'
# favicon
alias please_how_to_generate_favicon='printf "sudo apt install imagemagick
convert -background transparent -define icon:auto-resize=192 \e[33mimageFileToConvert\e[0m favicon.ico
"'
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
alias please_js_how_to_get_parent_element='printf "
document.querySelector(\".message-header\").parentElement.parentElement.parentElement.parentElement
"'
alias please_js_how_to_refresh_page='printf "
window.location.reload();
"'
alias please_js_how_to_generate_uuid_v4="printf \"
function uuidv4() {
  return ([1e7]+-1e3+-4e3+-8e3+-1e11).replace(/[018]/g, c =>
    (c ^ crypto.getRandomValues(new Uint8Array(1))[0] & 15 >> c / 4).toString(16)
  );
}

in browsers:
crypto.randomUUID()
\""
alias please_js_show_script_template="echo -e \"
(function () {
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
})();
\""
alias please_js_copy_script_template="please_js_show_script_template | please_copy"
alias please_js_copy_scratch_pad="echo '
(function () {
    function setElementStyle(element, css) {
        element.setAttribute('style', css);
    }

    function removePads() {
        const padElements = document.body.querySelectorAll('.scratch-pad');

        for (let element of padElements) {
            element.remove();
        }
    }

    function createPad() {
        const padElement = document.createElement('textarea');

        padElement.classList.add('scratch-pad');

        setElementStyle(
            padElement,
            \`
            position: absolute;
            background-color: white;
            left: O;
            top: 0;
            z-index: 9999999;
            padding: 3em;
            \`
        );

        // TODO: add input to set css selector and fill the pad
        // TODO: add a close button
        // TODO: move the pad with the mouse

        return padElement;
    }

    function fillPadFromElementContents(elements, padElement) {
        for (let element of elements) {
            padElement.textContent += \`\${element.textContent}\n\`;
        }
    }

    function main() {
        removePads();

        const rawElements = document.querySelectorAll('ngb-highlight');
        const padElement = createPad();

        fillPadFromElementContents(rawElements, padElement);
        document.body.appendChild(padElement);
    }

    console.clear();
    main();
})();
' | please_copy"
alias please_js_how_to_add_css='printf "
function createStyleElement(css) {
    const styleElement = document.createElement(\"style\");

    if (styleElement.styleSheet) {
        styleElement.styleSheet.cssText = css;
    } else {
        styleElement.appendChild(document.createTextNode(css));
    }

    return styleElement;
}

function addCss(css, element = document.head) {
    element.appendChild(createStyleElement(css));
}

async function addCssLibrary(url) {
    const library = await fetch(url).then(response => response.text());
    addCss(library);
}

function setElementStyle(element, css) {
    element.setAttribute(\"style\", css);
}

function appendElementStyle(element, css) {
    const elementStyle = element.getAttribute(\"style\");

    setElementStyle(element, elementStyle + css);
}

"'
alias please_js_how_to_use_match="printf \"
case insensitive:
'myString'.match(/april/i)

match all:
'myString'.matchAll(/april/i)
\""
# vue.js
alias please_vue_hello_world="printf \"
<!DOCTYPE html>
<html lang=\\\"en\\\">

<head>
    <meta charset=\\\"UTF-8\\\">
    <meta http-equiv=\\\"X-UA-Compatible\\\" content=\\\"IE=edge\\\">
    <meta name=\\\"viewport\\\" content=\\\"width=device-width, initial-scale=1.0\\\">
    <title>hello world</title>
    <script src=\\\"https://unpkg.com/vue@next\\\"></script>
</head>

<body>
    <div id=\\\"hello-world\\\" class=\\\"demo\\\">
        {{ message }}
    </div>
    <script>
        const HelloWorldApp = {
            data() {
                return {
                    message: 'Hello World!'
                }
            }
        }

        Vue.createApp(HelloWorldApp).mount('#hello-world')
    </script>
</body>

</html>
\""
alias please_js_is_element_visible='echo "
function isElementVisible(element) {
  return element.offsetWidth > 0 || element.offsetHeight > 0;
}
"'
alias please_js_how_to_notify='echo "
function showNotification(title, options, onCloseCallback, onClickCallback) {
    const notification = new Notification(title, options);

    if (onCloseCallback) {
        notification.onclose = onCloseCallback;
    }

    if (onClickCallback) {
        notification.onclick = onClickCallback;
    }

    return notification;
}

function removeNotification(notification) {
    notification.close();
}
"'
# node.js
alias please_node_how_to_use_lts='echo "
nvm use --lts
"'
# html
alias please_html_show_responsive_tag='printf "
<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">
"'
# css
alias please_css_how_to_use_variables="printf \"
https://developer.mozilla.org/en-US/docs/Web/CSS/Using_CSS_custom_properties

Initialisation:

ourSelectorHere {
  --ourVariableNameHere: brown;
}

Usage:

ourSelectorHere {
  background-color: var(--ourVariableNameHere);
}
\""
alias please_css_how_to_select_attributes='echo -e "
has attribute, no matter the value:
\e[33mtagHere\e[0m[\e[33mattributeHere\e[0m]

has NOT attribute, no matter the value:
\e[33mtagHere\e[0m:not([\e[33mattributeHere\e[0m])

multiple attributes:
\e[33mtagHere\e[0m[\e[33mattribute1Here\e[0m][\e[33mattribute2Here\e[0m]

any tag:
*[\e[33mattributeHere\e[0m=\"\e[33mvalueHere\e[0m\"]

begin with, end with:
\e[33mtagHere\e[0m[\e[33mattributeHere\e[0m^=\"\e[33mstartValueHere\e[0m\"][\e[33mattributeHere\e[0m\$=\"\e[33mendValueHere\e[0m\"]

case insensitive:
\e[33mtagHere\e[0m[\e[33mattributeHere\e[0m=\"\e[33mvalueHere\e[0m\" i]

contains:
\e[33mtagHere\e[0m[\e[33mattributeHere\e[0m*=\"\e[33mvalueHere\e[0m\"]
"'
# bulma css
alias please_bulma_how_to_use_cdn='printf "
<link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/bulma@0.9.3/css/bulma.min.css\">
"'
alias please_bulma_show_template='printf "
<!DOCTYPE html>
<html>
  <head>
    <meta charset=\"utf-8\">
    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">
    <title>Hello Bulma!</title>
    <link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/bulma@0.9.3/css/bulma.min.css\">
  </head>
  <body>
  <section class=\"section\">
    <div class=\"container\">
      <h1 class=\"title\">
        Hello World
      </h1>
      <p class=\"subtitle\">
        My first website with <strong>Bulma</strong>!
      </p>
    </div>
  </section>
  </body>
</html>
"'
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
alias gitresetorigin='git fetch origin && git reset --hard "origin/$(git branch --show-current)"'
alias git_branch_create_and_select='git checkout -b'
alias git_branch_delete='git branch -D'
alias git_branch_rename='git branch -m'
alias please_git_what_was_my_previous_branch='echo "$MY_GIT_BRANCH"'
alias please_git_how_to_switch_to_previous_branch='echo "git checkout -"'
alias please_git_how_to_squash_commits="printf \"
To squash commits in the current branch:

git rebase -i \e[33mcommitShaHere\e[0m
git rebase --interactive \e[33mcommitShaHere\e[0m

in the text editor, replace \e[1mpick\e[0m by \e[1msquash\e[0m for the wanted commits
save then exit
enter a commit message
save then exit
\""
alias please_git_how_to_show_next_commits="printf \"
git log \e[33mcommitShaHere\e[0m~1..HEAD
\""
alias please_git_how_to_use_git_log="printf \"
show some commits in one line with graph:
git log  --oneline --graph --max-count=\e[33mcommitsCountToShowHere\e[0m

show commits in a range:
git log \e[33mstartCommitShaHere\e[0m~1..\e[33mendCommitShaHere\e[0m

show commits after a specific one:
git log \e[33mcommitShaHere\e[0m~1..HEAD
\""
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
alias please_git_how_to_show_changes='echo "
git diff HEAD
git status -vv
"'
alias please_git_how_to_show_unstaged_changes='echo "git diff HEAD"'
alias please_git_how_to_clone_from_github='echo -e "git clone https://github.com/\e[33muserName\e[0m/\e[33mrepositoryName\e[0m.git"'
alias please_git_how_to_push_repository_to_github='echo -e "git remote add origin  https://github.com/\e[33muserName\e[0m/\e[33mrepositoryName\e[0m.git\ngit push --set-upstream \e[33morigin master\e[0m"'
alias please_git_how_to_create_remote="printf \"
- in the remote server directory:

git init --bare

- in our local project directory:

git remote add remoteNameHere remoteInfoHere

where remoteInfo can be:
- remote server url
- userNameHere@remoteServerHostHere:remoteServerDirectory
\""
alias please_git_how_to_show_a_graphic_interface='echo "gitg"'
alias please_git_how_to_cherry_pick='echo -e "
# Bring commits of a branch to the active branch from a specific commit:
git cherry-pick \e[33mcommitSha\e[0m^..\e[33mbranchName\e[0m

# Bring last commits of a branch to the active branch:
git cherry-pick ..\e[33mbranchName\e[0m

# Bring only the last commit of a branch to the active branch:
git cherry-pick \e[33mbranchName\e[0m

# Bring commit changes without creating a commit:
git cherry-pick --no-commit \e[33mcommitShaHere\e[0m
"'
alias please_git_how_to_hook="printf \"
git documentation:
https://git-scm.com/book/en/v2/Customizing-Git-Git-Hooks
https://www.git-scm.com/docs/githooks

create an executable file in your project's .git/hooks directory named like this:

.git/hooks/\e[33mhookNameHere\e[0m

where \e[33mhookNameHere\e[0m can be:

pre-commit
prepare-commit-msg
commit-msg
post-commit
pre-rebase
post-rewrite
post-checkout
post-merge
pre-push
pre-auto-gc
\""
alias please_github_how_to_clone='echo -e "git clone https://github.com/\e[33muserName\e[0m/\e[33mrepo\e[0m.git"'
# Gitlab
alias please_gitlab_how_to_create_static_website="printf \"
create from template:
New project > Create from template > Plain HTML

deploy:
CI/CD > Pipelines > Run pipeline

set domain name:
Settings > Pages > New Domain
\""
alias please_gitlab_how_to_skip_ci="echo -e '
https://docs.gitlab.com/ee/ci/pipelines/#skip-a-pipeline

git push -o ci.skip \e[33mremoteName branchName\e[0m

or add [skip ci] in the commit message
'"
# service
alias please_how_to_stop_a_service='echo -e "sudo service \e[33mserviceNameHere actionHere\e[0m'
alias please_apache_stop='sudo service apache2 stop'
# mathematics
alias please_how_to_get_range='echo -e "
from 1 to:
seq \e[33mendValueHere\e[0m

from start to end:
seq \e[33mstartValueHere\e[0m \e[33mendValueHere\e[0m

from start to end with a given step:
seq \e[33mstartValueHere\e[0m \e[33mstepHere\e[0m \e[33mendValueHere\e[0m

set separator:
seq --separator=\"\e[33mseparatorHere\e[0m\" \e[33mendValueHere\e[0m
seq -s \e[33mseparatorHere\e[0m \e[33mendValueHere\e[0m

pad with leading zeroes:
seq --equal-width \e[33mendValueHere\e[0m
seq -w \e[33mendValueHere\e[0m
"'
alias please_how_to_get_pi_value='echo -e "echo \"scale=10; 4*a(1)\" | bc -l"'
alias please_how_to_convert_hexadecimal_to_decimal='echo -e "echo \$((16#\e[33mvalueHere\e[0m))
echo \"obase=10; ibase=16; \e[33mvalueHere\e[0m\" | bc"'
alias please_how_to_convert_decimal_to_hexadecimal="echo -e \"printf '%x' \e[33mdecimalValueHere\e[0m\""
alias please_how_to_convert_watt_to_joule=" printf\"
Energy (J) = Power (W) * Duration (s)
E = P * dt

J: joule
W: watt
s: second
\""
alias please_how_to_convert_joule_to_watt=" printf\"
Power (W) = Energy (J) / Duration (s)
P = E / dt

W: watt
J: joule
s: second
\""
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
alias please_composer_how_to_set_version='printf "
"require": {
    "vendor/package": "1.3.2", // exactly 1.3.2

    // >, <, >=, <= | specify upper / lower bounds
    "vendor/package": ">=1.3.2", // anything above or equal to 1.3.2
    "vendor/package": "<1.3.2", // anything below 1.3.2

    // * | wildcard
    "vendor/package": "1.3.*", // >=1.3.0 <1.4.0

    // ~ | allows last digit specified to go up
    "vendor/package": "~1.3.2", // >=1.3.2 <1.4.0
    "vendor/package": "~1.3", // >=1.3.0 <2.0.0

    // ^ | does not allow breaking changes (major version fixed - following semver)
    "vendor/package": "^1.3.2", // >=1.3.2 <2.0.0
    "vendor/package": "^0.3.2", // >=0.3.2 <0.4.0 // except if major version is 0
}
"'
# php
alias please_php_how_to_set_php_version="printf \"
sudo ln -sf /usr/bin/php\e[33m7.4\e[0m /etc/alternatives/php
sudo ln --symbolic --force /usr/bin/php\e[33m7.4\e[0m /etc/alternatives/php
\""
alias please_php_how_to_set_memory_limit="printf \"
ini_set('memory_limit', '512M');
ini_set('memory_limit', '1G');
\""
alias please_php_how_to_debug_array_loop="printf \"
echo \\\"\\\\\n'{\e[33m\\\$myVariableHere['keyHere']\e[0m}',\\\";continue;
\""
alias please_php_how_to_ask_user_input='printf "
\e[33m\$someVariableHere\e[0m = readline(\"Enter a string: \");

more efficient:
fscanf(STDIN, \"%%s\", \e[33m\$someVariableHere\e[0m);
"'
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
alias please_php_how_to_find_ini_file_used='echo "
php --info | grep php.ini
php -i | grep php.ini
"'
# php quality analysis
alias please_php_run_quality_tools='docker run --init -it --rm -v "$(pwd):/project" -v "$(pwd)/tmp-php-quality-analysis:/tmp" -w /project nicordev/php-tools-analysis:latest'
alias please_php_run_phpstan_analyse='please_php_run_quality_tools phpstan analyse'
alias please_php_run_infection='please_php_run_quality_tools infection'
# php infection
alias please_infection_remove_log_files='rm $(ls | grep infection.log)'
alias please_infection_how_to_remove_log_files='echo "rm $(ls | grep infection.log)"'
# php cs fixer
alias please_php_run_phpcsfixer='php php-cs-fixer.phar fix --config "./.php_cs.dist"'
# xdebug
alias please_php_how_to_activate_xdebug='echo -e "
in /etc/php/\e[33mphpVersionHereLike8.1\e[0m/cli/conf.d/20-xdebug.ini

zend_extension=xdebug.so
xdebug.mode=debug
xdebug.start_with_request=1
"'
# symfony
alias pbc='php bin/console'
alias please_symfony_console='php bin/console'
alias please_symfony_server_start='symfony server:start -d'
alias please_symfony_how_to_reset_database_and_create_migration='echo "php bin/console doctrine:database:drop --force && php bin/console doctrine:database:create && php bin/console make:migration"'
alias please_symfony_how_to_load_alice_fixtures='echo "
php bin/console hautelook:fixtures:load
php bin/console hautelook:fixtures:load --no-interaction
php bin/console hautelook:fixtures:load --env=dev --no-interaction
"'
alias please_symfony_how_to_debug_security='echo "
Breakpoints in:
\ApiPlatform\Core\Security\EventListener\DenyAccessListener::checkSecurity
"'
alias please_phpunit_how_to_extract_failed_test_cases_from_terminal_output="grep '[[:digit:]])'"
# laravel
alias please_laravel_how_to_create_new_project="printf \"
composer create-project laravel/laravel:^8.0 \e[33mmy-awesome-app\e[0m
cd \e[33mmy-awesome-app\e[0m
php artisan serve

use docker through sail:
php artisan sail:install

\""
alias please_laravel_how_to_run_tests="printf \"
php artisan test --parallel --processes=4
\""
alias please_laravel_how_to_create_route="echo '
# using callback function
Route::get('/hello/{name?}', function (\$name = \"World\") {
    return view(\"hello\", [\"name\" => \$name]);
})->name(\"hello\");

# for an API, in routes/api.php will match /api/pluralResourceNameHere
Route::httpVerbHere(\"pluralResourceNameHere\", \"ControllerNameHere@controllerMethodNameHere\");
'"
# phpstorm
alias please_phpstorm_how_to_use_regex_to_replace_date_time_by_date='printf "
look for:
([\d-]+) [\d]{2}:[\d]{2}:[\d]{2}

replace by:
\$1
"'
# Go to directory
alias cdmoi='cd ~/moi'
alias cddraft='cd ~/moi/.draft'
# uuid
alias please_generate_uuid4='uuidgen | tr -d "\n"'
alias please_how_to_generate_uuid4='printf "
uuidgen
"'
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
alias please_how_to_copy_directory_with_its_content='printf "
cp -r \e[33mdirectoryHere\e[0m
"'
alias please_remove='please_rmrf'
alias please_change_folder_owner_and_its_content='sudo chown -R'
alias please_change_file_or_folder_owner='sudo chown'
alias please_change_file_or_folder_group='sudo chgrp'
alias please_how_to_set_root_files_to_me="printf \"
sudo chown --recursive \\\$(id -un):\\\$(id -gn) \\\$(ls -al | grep root | awk '{ print \\\$9 }' | tr \\\"\\\\\n\\\" ' ')
\""
alias please_how_to_create_link='echo -e "# Symbolic link:"; echo -e "ln --symbolic \e[33mfileHere\e[0m \e[33mlinkHere\e[0m"; echo -e "ln -s \e[33mfileHere\e[0m \e[33mlinkHere\e[0m"; echo -e "\n# Hard link:"; echo -e "ln \e[33mfileHere\e[0m \e[33mlinkHere\e[0m"'
alias please_how_to_count_files="echo -e 'ls -1 --file-type | grep --invert-match '/\\$' | wc -l'"
alias please_how_to_count_directories="echo -e 'ls -1 --file-type | grep '/\\$' | wc -l'"
alias please_how_to_count_files_and_directories="echo -e 'ls -1 | wc -l'"
# directory
alias please_how_to_list_directories_only='echo -e "ls -d \e[33mpathHere/commonStringHere\e[0m*/"'
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
# rsync
alias please_how_to_synchronize_directories="printf \"
--delete will delete any files that are not in the source directory
-a, --archive can be used instead or -r --recursive to also sync permissions...

rsync --recursive --delete \e[33msourceDirectoryHere\e[0m/\e[33m destinationDirectoryHere\e[0m
rsync -r --delete \e[33msourceDirectoryHere\e[0m/\e[33m destinationDirectoryHere\e[0m
\""
alias please_rsync_how_to_synchronize_directories='please_how_to_synchronize_directories'
alias please_how_to_synchronize_remote_directories="printf \"
rsync --recursive --delete \e[33msourceDirectoryHere\e[0m/\e[33m usernameHere\e[0m@\e[33mremoteHostHere\e[0m:\e[33mdestinationDirectoryHere\e[0m
rsync -r --delete \e[33msourceDirectoryHere\e[0m/\e[33m usernameHere\e[0m@\e[33mremoteHostHere\e[0m:\e[33mdestinationDirectoryHere\e[0m
\""
alias please_rsync_how_to_synchronize_remote_directories='please_how_to_synchronize_remote_directories'
# network
alias please_show_listening_ports='sudo lsof -i -P -n | grep LISTEN'
alias please_show_listening_ports_using_netstat='sudo netstat -ntlp | grep LISTEN'
# jq
alias please_jq_how_to_extract_values="printf \"
\e[33mcat myFileHere\e[0m | jq '\e[33m.rootElementHere[]\e[0m | {\e[33mpropertyNameHere, anotherPropertyNameHere\e[0m}'
\""
alias please_jq_how_to_list_keys="printf \"
\e[33mcat myFileHere\e[0m | jq '\e[33m.rootElementHere[]\e[0m | to_entries[] | .key'
\""
# pdf
alias please_pdf_how_to_read_from_terminal='echo "
less \e[33mpdfFileHere\e[0m
"'
# base64
alias please_base64_how_to_encode='echo -e "
base64 \e[33mstringToEncodeHere\e[0m
"'
alias please_base64_how_to_decode='echo -e "
# decode all characters
base64 --decode \e[33mstringToEncodeHere\e[0m
base64 -d \e[33mstringToEncodeHere\e[0m

# decode only meaningful characters
base64 --decode --ignore-garbage \e[33mstringToEncodeHere\e[0m
base64 -di \e[33mstringToEncodeHere\e[0m
"'
# cut
alias please_how_to_extract_string_from_another_string='echo -e "
echo \e[33mstringToSplitHere\e[0m | cut -d \"\e[33mdelimiterHere\e[0m\" -f\e[33mfieldNumberHere\e[0m
echo \e[33mstringToSplitHere\e[0m | cut --delimiter=\"\e[33mdelimiterHere\e[0m\" --fields=\e[33mfieldNumberHere\e[0m,\e[33manotherFieldNumberHere\e[0m
"'
# keyboard
alias please_keyboard_how_to_write_accented_characters="printf '
# use the compose key

é = compose key + %s then e
è = compose key + \` then e
ê = compose key + shift + ^ then e
ï = compose key + shift + \" then e

https://userbase.kde.org/Tutorials/ComposeKey
' \"'\""
# linux
alias please_how_to_get_string_length="echo -e \"
printf \e[33mmyStringHere\e[0m | wc --chars
printf \e[33mmyStringHere\e[0m | wc -m
\""
alias please_how_to_rename_file_to_lower_snake_case="echo -e '
echo \"\e[33mfileNameHere\e[0m\" | tr \" \" \"_\" | tr [A-Z] [a-z] | tr -d \"\\\n\"
'"
alias please_how_to_find_hard_links_of_a_file="echo -e \"
get file inode number:
ls -i \e[33mfileHere\e[0m | awk '{ print \$1; }'

find hard links using inode number:
find \e[33mdirectoryHere\e[0m -inum \e[33mfileInodeNumberHere\e[0m 2> /dev/null

one line:
find \e[33mdirectoryHere\e[0m -inum \\\$(ls -i \e[33mfileHere\e[0m | awk '{ print \\\$1; }') 2> /dev/null
\""
alias please_how_to_compare_2_strings='echo -e "
diff <( printf \"\e[33mmyStringHere\e[0m\" ) <( printf \"\e[33mmyOtherStringHere\e[0m\" )
"'
alias please_clear_screen='printf "\033[H\033[J"'
alias please_how_to_clear_screen='printf "
clear

# clear screen without changing caret place
printf \"\\\033[2J\"

# \\\033[H bring the caret to the top left corner of the screen
# \\\033[J clear screen after the caret
printf \"\\\033[H\\\033[J\"
"'
alias please_explain_characters='echo "
\r bring the caret to the left
\b remove one character on the left (backspace)
\n new line
\t tab

# bring the caret to the top left corner of the screen
\033[H

# clear screen after the caret
\033[J

# clear screen without changing caret place
\033[2J

# clear screen and go to the screen top left corner
\033[H\033[J

# move up
\033[lineCountHereA

# move down
\033[lineCountHereB

# move right
\033[columnCountHereC

# move left
\033[columnCountHereD

# move to specific position
\033[lineHere;columnHereH

# example: write hello world on line 7 column 10
printf \"\033[7;10Hhello world\"
"'
alias please_what_is_the_battery_capacity='cat /sys/class/power_supply/BAT0/capacity'
alias please_how_to_read_battery_capacity_in_percent='echo "
cat /sys/class/power_supply/BAT0/capacity
"'
alias please_how_to_read_screen_brightness='echo "
xrandr --query --verbose | grep --after-context=5 --word-regexp connected | grep --ignore-case --only-matching --perl-regexp "(?<=Brightness:[\s]).+"
"'
alias please_how_to_set_screen_brightness='echo -e "
get the active screen:
xrandr --query | grep --word-regexp connected | awk \"{ print \$1; }\"
xrandr -q | grep -q connected | awk \"{ print \$1; }\"

set the brightness
xrandr --output \e[33mactiveScreenHere\e[0m --brightness \e[33mbrightnessValueBetween0And1\e[0m

man page: https://www.commandlinux.com/man-page/man1/xrandr.1.html
"'
alias please_what_is_the_current_distribution='cat /etc/os-release'
alias please_today='date "+%Y%m%d"'
alias please_change_files_owner_to_me='sudo chown --recursive $USER:$USER'
alias please_how_to_redirect_output_error='printf "
To redirect output and error in the same file:
\e[1;33mcommandHere\e[0m 2>&1 \e[1;33mfileHere\e[0m

To redirect output and error in dedicated files:
\e[1;33mcommandHere\e[0m > \e[1;33moutputFileHere\e[0m 2> \e[1;33merrorFileHere\e[0m

To silence errors:
\e[1;33mcommandHere\e[0m > \e[1;33moutputFileHere\e[0m 2> /dev/null
"'
alias please_how_to_add_today_to_file_name='echo -e "mv \e[33mfileName\e[0m ${PLEASE_TODAY}_\e[33mfileName\e[0m"'
alias please_how_to_use_date="printf \"
get today with format YYYY-MM-DD hh:mm:ss
date '+%%Y-%%m-%%d %%H:%%M:%%S'

use specific date:
date '+%%Y-%%m-%%d %%H:%%M:%%S' --date='2022-02-02'

get week number:
date '+%%W' --date='2022-02-02'
\""
alias please_how_to_show_disk_space_usage='echo -e "df -h"; echo -e "du -h \e[33m/var/lib/snapd/snaps\e[0m"'
alias please_how_to_show_the_current_distribution='echo -e "cat /etc/os-release"'
alias please_how_to_list_disks='echo -e "df" && echo -e "\e[34mor\e[0m" && echo -e "sudo fdisk -l" && echo -e "\e[34mor\e[0m" && echo -e "lsblk"'
alias please_how_to_count_processor_cores='echo nproc'
alias please_how_to_show_ip='echo "
ip address
ip a
ifconfig
"'
alias please_how_to_remove_all_files_but_one='echo -e "rm -rf $(ls | grep --invert-match \e[33mfileToKeep\e0m)"'
alias please_how_to_show_disk_usage='echo "df -kh"'
alias please_how_to_search_previous_command='echo -e "ctl + r\nenter the beginning of the command\nctl + r again to cycle through results"'
alias please_how_to_change_files_owner='echo -e "sudo chown --recursive \e[33muserName:groupName pathToFiles\e[0m\nsudo chown -R \e[33muserName:groupName pathToFiles\e[0m"'
alias please_how_to_show_current_computer_name='echo "hostname
hostnamectl
cat /proc/sys/kernel/hostname"'
# less
alias please_less_how_to_use_pattern='printf "
less --pattern=\"\e[33myourPatternHere\e[0m\" \e[33mfileNameHere\e[0m
less -p \"\e[33myourPatternHere\e[0m\" \e[33mfileNameHere\e[0m
"'
# tgz
alias please_how_to_extract_tgz='echo -e "tar -xzf \e[33mfileName.tgz\e[0m -C \e[33mdirectoryName\e[0m\ntar --extract --ungzip --file=\e[33mfileName.tgz\e[0m --directory \e[33mdirectoryName\e[0m"'
# gzip
alias please_how_to_extract_gzip='echo -e "
tar --extract --gzip --verbose --file=\e[33marchiveNameHere\e[0m.tar.gz
tar -xzvf \e[33marchiveNameHere\e[0m.tar.gz
"'
alias please_how_to_gzip_files='echo -e "
tar --create --gzip --verbose --file=\e[33marchiveNameHere\e[0m.tar.gz \e[33mdirectoryHere\e[0m
tar -czvf \e[33marchiveNameHere\e[0m.tar.gz \e[33mdirectoryHere\e[0m
"'
# zip
alias please_how_to_zip_files_and_directories='printf "
zip \e[33marchiveNameHere.zip fileOrDirectoryNameHere anotherFileOrDirectoryNameHere\e[0m
"'
alias please_how_to_unzip_files_and_directories='printf "
unzip \e[33marchiveNameHere.zip\e[0m -d \e[33mdestinationDirectoryHere\e[0m
"'
# help
alias please_how_to_show_help_of_a_command='echo -e "man \e[33mcommandName\e[0m
help \e[33mcommandName\e[0m"'
# apt
alias please_apt_how_to_list_installed_packages='echo "apt list --installed"'
alias please_apt_how_to_remove_repository='echo -e "rm /etc/apt/sources.list.d/\e[33mrepositoryNameHere\e[0m

sudo add-apt-repository --remove ppa:\e[33mauthor/repository\e[0m"'
alias please_apt_how_to_list_repositories='echo -e "apt policy

ls /etc/apt/sources.list.d/ | grep \e[33mrepositoryHint\e[0m"'
# history
alias please_how_to_avoid_history_command_to_remember_my_command='printf "
add a space before entering your command:
 \e[33mmyCommandToRunHere\e[0m
"'
alias please_history_how_to_forget_commands="printf \"
forget a command:
history -d \e[33mhistoryIndexHere\e[0m

forget multiple commands:
for i in {1..\e[33mcommandsToForgetCount\e[0m}; do history -d firstCommandIndexHere; done
\""
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
alias please_grep_how_to_show_lines_around_matches="echo -e '
See lines after a match
grep -A \e[33mlinesCount\e[0m \e[33motherParameters\e[0m
grep --after-context=\e[33mlinesCount\e[0m \e[33motherParameters\e[0m

See lines before a match
grep -B \e[33mlinesCount\e[0m \e[33motherParameters\e[0m
grep --before-context=\e[33mlinesCount\e[0m \e[33motherParameters\e[0m

See lines after and before a match
grep -C \e[33mlinesCount\e[0m \e[33motherParameters\e[0m
grep --context=\e[33mlinesCount\e[0m \e[33motherParameters\e[0m
'"
alias please_grep_how_to_use_or_operator="echo -e \"
Extended grep:
grep --extended-regexp '\e[33myourFirstCriteria\e[0m|\e[33myourSecondCriteria\e[0m'
grep -E '\e[33myourFirstCriteria\e[0m|\e[33myourSecondCriteria\e[0m'
egrep '\e[33myourFirstCriteria\e[0m|\e[33myourSecondCriteria\e[0m'

Basic grep:
grep -e \e[33myourFirstCriteria\e[0m -e \e[33myourSecondCriteria\e[0m
grep '\e[33myourFirstCriteria\e[0m\\|\e[33myourSecondCriteria\e[0m'
\""
alias please_grep_how_to_match_word='printf "
grep -w \e[33myourWordHere\e[0m
grep --word-regexp \e[33myourWordHere\e[0m
grep \"\\\b\e[33myourCriteriaHere\e[0m\\\b\"
"'
alias please_grep_how_to_get_only_matching='printf "
grep --only-matching \e[33myourCriteriaHere\e[0m
grep -o \e[33myourCriteriaHere\e[0m
"'
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

Show line numbers:
grep -nR \e[33mcriteriaHere directoryHere\e[0m
grep --dereference-recursive --line-number \e[33mcriteriaHere directoryHere\e[0m

Look only in certain files:
grep --dereference-recursive \e[33mcriteriaHere\e[0m --include=\e[33mpatternHere directoryHere\e[0m

Exclude certain files:
grep --dereference-recursive \e[33mcriteriaHere\e[0m --exclude=\e[33mpatternHere directoryHere\e[0m

Exclude certain directories:
grep --dereference-recursive \e[33mcriteriaHere\e[0m --exclude-dir=\e[33m{directoryToExclude1,directoryToExclude2} directoryHere\e[0m

Show line numbers:
grep -R -n \e[33mcriteriaHere directoryHere\e[0m
grep --dereference-recursive --line-number \e[33mcriteriaHere directoryHere\e[0m

Case insensitive:
grep -R -i \e[33mcriteriaHere directoryHere\e[0m
grep --dereference-recursive --ignore-case \e[33mcriteriaHere directoryHere\e[0m"'
alias please_grep_how_to_find_files_that_contains="printf \"
grep --dereference-recursive --files-with-matches \e[33mcriteriaHere directoryHere\e[0m
grep -Rl \e[33mcriteriaHere directoryHere\e[0m
\""
alias please_grep_how_to_find_files_that_does_not_contains="printf \"
grep --dereference-recursive --files-without-match \e[33mcriteriaHere directoryHere\e[0m
grep -RL \e[33mcriteriaHere directoryHere\e[0m
\""
alias please_grep_how_to_extract_xml_value='printf "
grep --only-matching --perl-regexp --max-count=1 \"(?<=<\e[33mXmlTagNameHere\e[0m>)[^<]+\" \e[33mfileNameHere\e[0m
grep -oPm 1 \"(?<=<\e[33mXmlTagNameHere\e[0m>)[^<]+\" \e[33mfileNameHere\e[0m

where (?<=\e[33mpatternToHide\e[0m>) uses a positive look behind to avoid showing the xml tag (thanks to --perl-regexp).
"'
alias please_grep_how_to_extract_value='printf "
multiple values:
grep --only-matching --perl-regexp \"(?<=\e[33mpatternForKey\e[0m).+\" \e[33mfileNameHere\e[0m
grep -oP \"(?<=\e[33mpatternForKey\e[0m).+\" \e[33mfileNameHere\e[0m

one value:
grep --only-matching --perl-regexp --max-count=1 \"(?<=\e[33mpatternForKey\e[0m).+\" \e[33mfileNameHere\e[0m
grep -oPm 1 \"(?<=\e[33mpatternForKey\e[0m).+\" \e[33mfileNameHere\e[0m

where (?<=\e[33mpatternForKey\e[0m>) uses a positive look behind to avoid showing the key (thanks to --perl-regexp).
"'
# regex
alias please_regex_help="echo \"
https://regex101.com/

positive look behind:
(?<=myPatternHere)

classes:
\\d == [0-9]
\\s == [\\r\\n\\t\\f\\v ]
\\S == [^\\r\\n\\t\\f\\v ]
\\w == [a-zA-Z0-9_]
\""
# sed
alias please_sed_browse_documentation='echo "http://www.gnu.org/software/sed/manual/sed.html"'
alias please_sed_how_to_replace_line="printf \"
sed \e[33mlineNumberHere\e[0m'c%s\e[33mreplacementStringHere\e[0m' fruits
\" '\'"
alias please_sed_how_to_target_lines='echo -e "
target one line
sed \"\e[33mlineNumberHere\e[0ms/hello/world/\" input.txt > output.txt

target a range of lines (boundaries included)
sed \"\e[33mstartLineNumberHere\e[0m,\e[33mendLineNumberHere\e[0ms/hello/world/\" input.txt > output.txt

target a range of lines between 2 patterns:
sed \"/\e[33mstartPatternHere\e[0m/,/\e[33mendPatternHere\e[0m/s/hello/world/\" input.txt > output.txt

invert the range by adding !
sed \"\e[33mstartLineNumberHere\e[0m,\e[33mendLineNumberHere\e[0m!s/hello/world/\" input.txt > output.txt

target multiple lines that matches a pattern
sed \"/\e[33mpatternHere\e[0m/s/hello/world/\" input.txt > output.txt
"'
alias please_sed_how_to_find_in_file='echo -e "
sed -nE "/\e[33mourPatternHere\e[0m/p" \e[33mfileNameHere\e[0m
sed --quiet --regexp-extended "/\e[33mourPatternHere\e[0m/p" \e[33mfileNameHere\e[0m

Using capturing groups:
sed -nE \"s#\e[33msomeCharactersHere(yourCapturingGroup)\e[0m#\1#p\" \e[33mfileNameHere\e[0m
sed --quiet --regexp-extended \"s#\e[33msomeCharactersHere(yourCapturingGroup)\e[0m#\1#p\" \e[33mfileNameHere\e[0m

In a line range:
sed -nE \"\e[33mstartLineHere\e[0m,\e[33mendLineHereOr\$\e[0m s#\e[33msomeCharactersHere(yourCapturingGroup)\e[0m#\1#p\" \e[33mfileNameHere\e[0m
sed --quiet --regexp-extended \"\e[33mstartLineHereOr\$\e[0m,\e[33mendLineHere\e[0m s#\e[33msomeCharactersHere(yourCapturingGroup)\e[0m#\1#p\" \e[33mfileNameHere\e[0m

In a range by patterns:
sed -nE \"/\e[33mpatternHere\e[0m/,/\e[33mpatternHere\e[0m/ s#\e[33msomeCharactersHere(yourCapturingGroup)\e[0m#\1#p\" \e[33mfileNameHere\e[0m
sed --quiet --regexp-extended \"/\e[33mpatternHere\e[0m/,/\e[33mpatternHere\e[0m/ s#\e[33msomeCharactersHere(yourCapturingGroup)\e[0m#\1#p\" \e[33mfileNameHere\e[0m
"'
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
alias please_sed_how_to_remove_lines_containing_string="printf \"
sed --in-place\e[33m=optionalSuffixIfWeWantABackupHere\e[0m --expression='/\e[33mstringToLookForHere\e[0m/d' --expression='/\e[33manotherStringToLookForHere\e[0m/d' \e[33mfileNameHere\e[0m
sed -i\e[33moptionalSuffixIfWeWantABackupHere\e[0m -e '/\e[33mstringToLookForHere\e[0m/d' -e '/\e[33manotherStringToLookForHere\e[0m/d' \e[33mfileNameHere\e[0m
\""
alias please_sed_how_to_backup_file="printf \"
sed --in-place\e[33m=optionalSuffixForBackupFile\e[0m \e[33mmyLogicHere\e[0m \e[33mfileNameHere\e[0m
sed -i\e[33moptionalSuffixForBackupFile\e[0m \e[33mmyLogicHere\e[0m \e[33mfileNameHere\e[0m
\""
alias please_sed_how_to_append_to_last_line="echo -e \"sed -i '\\\$a\\'\e[33mcontentHere\e[0m \e[33mfileNameHere\e[0m\""
alias please_sed_how_to_insert_in_file='echo -e "
at line:
sed -i \"\e[33mlineNumber\e[0m i \e[33mtextToInsert\e[0m\" \e[33mfileNameHere\e[0m

before pattern:
sed -i \"/\e[33mpattern\e[0m/i \e[33mtextToInsert\e[0m\" \e[33mfileNameHere\e[0m

after pattern:
sed -i \"/\e[33mpattern\e[0m/a \e[33mtextToInsert\e[0m\" \e[33mfileNameHere\e[0m
"'
# awk
alias please_awk_how_to_get_string_length='echo -e "echo \"\e[33mmyStringHere\e[0m\" | awk \"{ print length }\""'
alias please_awk_how_to_print_first_fields="echo \"awk '{ print \\\$1, \\\$2, \\\$3; }'\""
alias please_awk_how_to_print_last_field='echo "awk \"{ print \$NF; }\""'
alias please_awk_how_to_print_fields='printf "
echo \"a b c\" | awk \"{ print \$1, \$2, \$3; }\"

awk \"{ print \$1, \$2, \$3; }\" \$(cat << EOF
a b c
EOF)
"'
alias please_awk_how_to_set_field_separator='echo -e "awk --field-separator \e[33mfileSeparatorHere { awkCodeHere }\e[0m
awk -F \e[33mfileSeparatorHere { awkCodeHere }\e[0m"'
alias please_awk_browse_documentation='echo "https://www.gnu.org/software/gawk/manual/gawk.html"'
# tr
alias please_how_to_replace_character='echo -e "echo \e[33msomeTextHere\e[0m | tr \e[33mcharacterToReplace\e[0m \e[33mcharacterToAdd\e[0m"'
alias please_how_to_remove_character='echo -e "echo \e[33msomeTextHere\e[0m | tr -d \e[33mcharacterToRemove\e[0m
echo \e[33msomeTextHere\e[0m | tr --delete \e[33mcharacterToRemove\e[0m"'
alias please_how_to_remove_spaces_from_file_names='echo "
for file in ./*; do echo mv \"\$file\" \$( echo \$file | tr \" \" \"_\" ); done
"'
alias please_how_to_transform_to_upper_case='echo hello | tr [:lower:] [:upper:]'
alias please_how_to_transform_to_lower_case='echo HELLO | tr [:upper:] [:lower:]'
# usb key
alias please_how_to_unmount_usb_key='echo -e "umount \e[33mcheminVers/CléUsb\e[0m"'
alias please_how_to_format_usb_key='echo -e "sudo mkfs.vfat -n \e[33mNOUVEAU_NOM_CLE_USB\e[0m -I \e[33m/dev/sdb\e[0m"'
alias please_how_to_create_bootable_usb_key='echo -e "\e[34mFirst unmount the key, format the key then\e[0m" && echo -e "sudo dd bs=4M if=\e[33mcheminVers/FichierImage.iso\e[0m of=\e[33m/dev/sdb status=progress\e[0m"'
# generate random things
alias please_generate_a_random_string='tr -dc A-Za-z0-9_ < /dev/urandom | head -c 16 | xargs'
# time
alias please_what_is_the_current_week_number='echo "Using bash: " && date +%W && echo "Using php: " && php -r "echo (new DateTime())->format(\"W\");"'
alias please_what_time_is_it='date'
alias please_what_timestamp_is_it='date "+%s"'
alias please_what_is_this_timestamp='read_timestamp.php'
alias please_what_is_this_date_timestamp='write_timestamp.php'
alias please_how_to_get_timestamp_from_date="printf \"
date '+%%s --date='\e[33mourDateHere\e[0m'
\"" # I had to double % in order to escape it and properly print '%s'
alias please_how_to_get_date_from_timestamp="printf \"
date --date='@\e[33mourTimestampHere\e[0m'
\""
alias please_how_to_change_file_modified_date="printf \"
touch --date='\e[33m2 days ago\e[0m' \e[33mourFileHere\e[0m
\""
alias please_how_to_measure_script_duration='echo -e "Using SECONDS:
SECONDS=0; echo \$SECONDS; \e[33myourCodeHere\e[0m; echo \$((\$SECONDS / 60)):\$((\$SECONDS % 60))""

Using time:
time \e[33myourCodeHere\e[0m
"'
alias please_how_to_measure_script_performance='echo -e "time --format \"%C %E\" \e[33myourCodeHere\e[0m"'
# bash
alias please_bash_how_to_split_string='echo -e "

firstWord=\${\e[33mvariableHere\e[0m%\e[33mdelimiterHere\e[0m*}
lastWord=\${\e[33mvariableHere\e[0m##*\e[33mdelimiterHere\e[0m}

# be careful if the string does not have the separator: lastWord == firstWord
myString="hello:world"
firstWord=\${myString%:*}
lastWord=\${myString##*:}

echo \$firstWord \$lastWord
"'
alias please_bash_template='echo -e "
#! /bin/bash

functionName() {
    if [ \$# -lt 1 ]
    then
        echo -e \"\$(basename \$0) \${FUNCNAME[0]} \\\e[33mparameterName\\\e[0m\"

        return 1
    fi
}
"'
alias please_bash_how_to_replace_characters_in_string="echo -e \"
\e[33mresultingVariable\e[0m=\\\${\e[33mmyInitialVariableHere\e[0m//[\e[33mcharactersToReplace\e[0m]/\e[33mstringWanted\e[0m}
\""
alias please_bash_how_to_replace_space_by_html_code="echo -e \"
\e[33mhtmlCompatible\e[0m=\\\${\e[33mmyInitialVariableHere\e[0m//[ ]/'%20'}
\""
alias please_bash_how_to_loop_through_parameters='echo "
analyseParameters() {
    for parameter in \"\$@\"
    do
        case \"\$parameter\" in
            \"-f\"|\"--force\")
                echo \"force!\"
                continue
            ;;
            *)
                echo \"default behaviour for: \$parameter\"
            ;;
        esac

        echo \"next\"
    done
}
"'
alias please_bash_how_to_transform_to_upper_case='echo -e "
echo \${\e[33mmyVariableHere\e[0m^^}
"'
alias please_bash_how_to_transform_to_lower_case='echo -e "
echo \${\e[33mmyVariableHere\e[0m,,}
"'
alias please_bash_how_to_get_file_name_parts='echo -e "
    local file=\$(basename \"\$fullPath\")
    local name=\"\${file%.*}\"
    local extension=\"\${file##*.}\"
"'
alias please_bash_how_to_loop_array_using_modulo='printf "
# principle
for (( i=0; i < \e[33m60\e[0m; i++ )); do echo \$(( \$i %% \e[33m18\e[0m )); done

# array
\e[33mourArrayName\e[0m=(\e[33mapple banana peach pear orange\e[0m); \e[33mourArrayNameLength\e[0m=\${#\e[33mourArrayName\e[0m[@]}; for (( i=0; i < \e[33manyInteger\e[0m; i++ )); do echo \${\e[33mourArrayName\e[0m[\$i %% \$\e[33mourArrayNameLength\e[0m]}; done
"'
alias please_bash_how_to_use_heredoc='printf "cat << EOF | sort > fruits.txt
cherry
orange
apple
pear
EOF

# Variable assignement
fruits=\$(cat <<EOF
apple
orange
banana
EOF
) # this ) has to be on a dedicated line
"'
alias please_bash_what_is_set="printf \"
set -eu
-e exit if any command return > 0
-u exit if any variable is accessed without being initialized first
-x output any command executed
-v display script content
\""
alias please_bash_what_are_here_string='echo "
pass the string on the right to the stdin of the command on the left of <<< generating a single string from a multiline string
myCommandHere <<< myStringHere

while using a pipe will create a subshell:
echo $myStringHere | sed "s/hello/world/"

sed "s/hello/world/" <<< $myStringHere
is executed in the current shell

here string <<< are different than heredoc <<EOF
"'
alias please_bash_how_to_ask_confirmation="echo '_askConfirmationDefaultYes() {
    echo -e \"\e[1mContinue?\e[0m [YES/no] \"
    read answer

    if [[ \${answer,,} =~ ^n ]]; then
        return 1
    fi

    return 0
}

_askConfirmationDefaultYes || exit

askConfirmationDefaultNo() {
    echo -e \"\e[1mContinue?\e[0m [yes/NO] \"
    read answer

    if [[ \${answer,,} =~ ^y ]]; then

        return 0
    fi

    return 1
}

_askConfirmationDefaultNo || exit'"
alias please_bash_how_to_check_is_integer="printf \"
if [ \"\e[33m\$myVariable\e[0m\" -eq \"\e[33m\$myVariable\e[0m\" ]; then echo 'is integer'; fi 2> /dev/null;
\""
alias please_bash_how_to_get_random_number="echo 'echo \$RANDOM'"
alias please_bash_how_to_reverse_string='echo -e "
echo \e[33mstringHere\e[0m | rev
"'
alias please_bash_how_to_read_file_from_start_to_end='echo -e "
cat \e[33mfileHere\e[0m
"'
alias please_bash_how_to_read_file_from_end_to_start='echo -e "
tac \e[33mfileHere\e[0m
"'
alias please_bash_how_to_read_stdin_for_pipes="echo 'myVariable=\$(cat -)'"
alias please_bash_how_to_declare_variables="echo -e '
# global variable
\e[33mvariableName\e[0m=\e[33mvariableValue\e[0m

# local variable
local \e[33mvariableName\e[0m=\e[33mvariableValue\e[0m

# force type to integer
declare -i \e[33mvariableAsIntegerName\e[0m=\e[33mintegerValue\e[0m

# force type to lower case string
declare -l \e[33mvariableAsIntegerName\e[0m=\e[33mstringWithUpperCaseCharacters\e[0m

# force type to upper case string
declare -u \e[33mvariableAsIntegerName\e[0m=\e[33mstringWithLowerCaseCharacters\e[0m

# constant
readonly \e[33mCONSTANT_NAME\e[0m=\e[33mconstantValue\e[0m

# indexed array
\e[33mvariableName\e[0m=(\e[33mitem1 item2 \"item with spaces\"\e[0m)
declare -a \e[33mvariableName\e[0m=(\e[33mitem1 item2 \"item with spaces\"\e[0m)

# associative array
declare -A \e[33marrayName\e[0m
\e[33marrayName\e[0m[\e[33mkey\e[0m]=\e[33mvalue\e[0m
declare -A \e[33marrayName\e[0m=([\e[33mkey1\e[0m]=\e[33mvalue1\e[0m [\e[33mkey2\e[0m]=\e[33mvalue2\e[0m)
'"
alias please_bash_how_to_format_text='how_to_format_text.sh'
alias please_bash_how_to_loop="printf '
# for
for \e[33mi\e[0m in {\e[33m0..10\e[0m}; do \e[33mecho \$i\e[0m; done

for (( \e[33mi\e[0m=\e[33m0\e[0m; i < \e[33m10\e[0m; i++ )); do \e[33mecho \$i\e[0m; done

# while
i=0
while true
do
    echo \$i
    ((i++))

    if (( i > 10 ))
    then
        break
    fi
done
'"
alias please_bash_how_to_loop_through_files='echo -e "for \e[33mfile\e[0m in *; do \e[33mecho "\$file"\e[0m; done"'
alias please_bash_how_to_loop_through_lines_of_a_file='echo -e "while IFS= read -r \e[33mline\e[0m; do \e[33mecho "\$line"\e[0m; done < \e[33mfile\e[0m"'
alias please_bash_how_to_count_directories='printf "
for file in \e[33myourPathHere\e[0m/*; do if [ -f \$file ]; then continue; fi; echo \$file; done | wc --lines
"'
alias please_bash_how_to_count_files='printf "
for file in \e[33myourPathHere\e[0m/*; do if [ -d \$file ]; then continue; fi; echo \$file; done | wc --lines
"'
alias please_bash_how_to_use_regex="echo -e 'if [[ \e[33m\"stringHere\"\e[0m =~ \e[33mregexHere\e[0m ]];then \e[33mecho \"true\"\e[0m; else \e[33mecho \"false\"\e[0m; fi'"
alias please_bash_how_to_use_regex_capture_group='printf "
if [[ \"\$Email\" =~ [a-z]+@[a-z]{2,}\.(com|net|org) ]]
then
    echo \"Here is the first capturing group: \${BASH_REMATCH[1]}\"
fi
"'
alias please_bash_how_to_remove_newline="echo -e '\e[33mecho \$someStringWithNewLines\e[0m | sed -z \"s#\\\n# #g\"'; echo -e '\e[33mecho \$someStringWithNewLines\e[0m | awk 1 ORS=\" \"'"
alias please_bash_how_to_rerun_last_command="echo '!!'"
alias please_bash_how_to_get_string_length='echo -e "
echo \${#\e[33mmyStringHere\e[0m}
"'
alias please_bash_how_to_get_last_output="echo -e 'Rerun the last command and pass the output to another command:\n\e[33mmyCommandName\e[0m \$(!!)'"
alias please_bash_how_to_get_user_number="echo 'echo \$EUID'"
alias please_bash_how_to_get_user_name="echo 'echo \$USER'"
alias please_bash_how_to_get_current_function_name='echo "\${FUNCNAME[0]}"'
alias please_bash_how_to_get_current_script_name="echo -e 'SCRIPT_NAME=\$(basename \$0)\nSCRIPT_NAME=\$(basename \$BASH_SOURCE)'"
alias please_bash_how_to_get_current_script_user='echo "user=$(whoami)"'
alias please_bash_how_to_create_constant='echo -e "readonly \e[33mMY_CONSTANT_NAME\e[0m=\e[33mmyConstantValueHere\e[0m"'
alias please_bash_how_to_get_absolute_path='echo "realpath myFileHere"'
alias please_bash_how_to_write_variable_default_value='echo -e "\e[33mvariableName\e[0m=\${\e[33motherVariable1\e[0m:-\e[33mhardCodedDefaultValue\e[0m}
\e[33mvariableName\e[0m=\${\e[33motherVariable1\e[0m:-\${\e[33motherVariable2\e[0m:-\e[33mhardCodedDefaultValue\e[0m}}"'
alias please_bash_how_to_extract_file_name_from_full_path='echo -e "
echo \$(basename \e[33myourFileNameHere .yourExtension\e[0m)

echo \${\e[33myourFileNameHere\e[0m##*/}
"'
alias please_bash_condition_variable_is_empty='echo "if [ -z $variableName ]"'
alias please_bash_condition_variable_is_not_empty='echo "if [ -n $variableName ]"'
alias please_bash_how_to_change_directory_from_a_script='echo -e "cd \e[33mdirectoryHere\e[0m\n\$SHELL"'
alias please_bash_how_to_change_file_owner_to_current_user='echo -e "
# change file
sudo chown $(id -u):$(id -g) \e[33mfileHere\e[0m

# change all files into directories
sudo chown --recursive $(id -u):$(id -g) \e[33mdirectoryHere\e[0m
"'
alias please_bash_how_to_handle_parameters="printf \"
\e[33mfunctionNameHere\e[0m() {

    while [ ! -z \\\"\\\$1\\\" ]; do
        case \\\"\\\$1\\\" in
            \e[33mvalue1Here\e[0m)
                \e[33manotherFunctionNameHere\e[0m \\\"\\\$1\\\"
                shift
            ;;
            \e[33mvalue2Here\e[0m|\e[33mvalue3Here\e[0m)
                \e[33manotherFunctionNameHere\e[0m \\\"\\\$1\\\"
                shift
            ;;
            *)
                \e[33manotherFunctionNameHereHandlingOtherValues\e[0m \\\"\\\$1\\\"
                shift
            ;;
        esac

    done

}
\""
alias please_bash_how_to_loop_through_array='printf "
for \e[33mmyArrayItem\e[0m in \${\e[33mmyArray\e[0m[@]}; do \e[33mecho \$myArrayItem\e[0m; done
"'
alias please_bash_how_to_use_array='echo -e "
variable assignement:
declare -a \e[33mmyArray\e[0m
myArray[0]=\e[33m\"myFirstValue\"\e[0m

bash specific:
fruits=(apple banana pear)
fruits+=(orange)

loop:
for fruit in ${fruits[*]}; do echo $fruit; done
"'
alias please_bash_how_to_get_array_length='printf "
\${#\e[33mmyArray\e[0m[@]}
"'
alias please_bash_how_to_get_random_array_item='printf "
echo \${\e[33mmyArray\e[0m[$RANDOM % ${#\e[33mmyArray\e[0m[@]}]}
"'
alias please_bash_how_to_get_random_value_from_0='printf "echo $(( $RANDOM % \e[33manyPositiveNumberHere\e[0m ))"'
alias please_how_to_sort_randomly="printf \"
sort --random-sort << EOF
1
2
3
4
5
6
7
EOF

echo 'apple banana orange peach cherry pear lemon' | tr ' ' \\\"\\\\\n\\\" | sort --random-sort
\""
alias please_how_to_replace_space_in_file_names='echo "
for file in *\" \"*; do mv \"\$file\" \$(echo \$file | tr \" \" \"_\"); done
"'
# bourne shell sh
alias please_sh_how_to_regex='echo -e "Use grep:
if ! echo \e[33m\$variableName\e[0m | grep --quiet \e[33m\"^2\"\e[0m
then
    \e[33mdoSomething\e[0m
fi"'
alias please_sh_how_to_source='echo "you can not use source in sh, use . instead:
.
"'
# swagger
alias please_swagger_browse_documentation='echo "https://swagger.io/docs/specification/describing-parameters/#query-parameters"'
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
# sql
alias please_sql_browse_tutorials='echo "https://sql.sh/"'
alias please_sql_how_to_select='echo -e "select \e[33mtableAlias.propertyName\e[0m as \e[33mpropertyAlias\e[0m from \e[33mtableName tableAlias\e[0m
where \e[33mtableAlias.otherPropertyName\e[0m = \e[33mvalue\e[0m;

select \e[33mcolumnName1\e[0m, \e[33mcolumnName2\e[0m, \e[33mcolumnName3\e[0m
from \e[33mtableName\e[0m
order by \e[33mcolumnName1\e[0m desc, \e[33mcolumnName2\e[0m asc"'
alias please_sql_how_to_update='echo -e "update \e[33mtableName\e[0m set \e[33mcolumnName1\e[0m = \e[33mvalue1\e[0m, \e[33mcolumn_name2\e[0m = \e[33mvalue2\e[0m where \e[33mcolumnName\e[0m = \e[33mvalue\e[0m;"'
alias please_sql_how_to_insert='printf "
insert into \e[33mtableName\e[0m(\e[33mcolumnName1\e[0m, \e[33mcolumnName2\e[0m)
values
    (\e[33mcolumn1Value1\e[0m, \e[33mcolumn2Value1\e[0m),
    (\e[33mcolumn1Value2\e[0m, \e[33mcolumn2Value2\e[0m),
    (\e[33mcolumn1Value3\e[0m, \e[33mcolumn2Value3\e[0m)
;
"'
# postgresql
alias please_postgresql_how_to_list_table_columns="echo -e '
select
    column_name,
    data_type
from
    information_schema.columns
zhere
    table_name = '\e[33mtableNameHere\e[0m';
'"
alias please_postgresql_how_to_get_current_database='echo "
select current_database();
"'
alias please_postgresql_how_to_get_current_user='echo "
select user();
"'
alias please_psql_browse_documentation='echo "https://www.postgresql.org/docs/9.2/app-psql.html"'
alias please_psql_how_to_execute_sql_file='echo -e "psql -f \e[33msqlFile\e[0m
psql --file=\"\e[33msqlFile\e[0m\"
"'
alias please_psql_how_to_execute_sql_statement='echo -e "psql -c \e[33msqlStatement\e[0m
psql --command=\"\e[33msqlStatement\e[0m\"
"'
alias please_psql_how_to_get_only_values='echo -e "psql -t -c \e[33msqlStatement\e[0m
psql --tuples-only  --command=\"\e[33msqlStatement\e[0m\"
"'
alias please_postgresql_how_to_convert_hexadecimal_to_decimal="printf \"
select ('x' || lpad(\e[33mmyHexadecimalValueHere\e[0m, 16, '0'))::bit(64)::bigint
\""
alias please_postgresql_how_to_convert_decimal_to_hexadecimal="printf \"
select to_hex(\e[33mmyDecimalValueHere\e[0m);
\""
alias please_postgresql_how_to_concatenate="printf \"
select 'Hello ' || 'World! ' || 1987;
select concat('Hello ', 'World! ', 1987);

Careful with null values:
select 'Hello ' || null || 'World! ' || 1987; -- return null
select concat('Hello ', null, 'World! ', 1987); -- works
\""
alias please_postgresql_how_to_regex="printf \"
where substring(\e[33mmyColumnHere\e[0m from '^[0-9a-fA-F]+\$') is not null
\""
alias please_postgresql_how_to_pad="printf \"
Left pad:
select lpad(\e[33mourValue\e[0m, \e[33mfinal~/moi/.draft/id/LengthHere\e[0m, \e[33mcharacterToAddHere\e[0m)

Right pad:
select rpad(\e[33mourValue\e[0m, \e[33mfinalLengthHere\e[0m, \e[33mcharacterToAddHere\e[0m)
\""
alias please_postgresql_how_to_list_constraint_names="echo -e \"
select conname
from pg_constraint
where
  conrelid = '\e[33mtableNameHere\e[0m'::regclass
  and contype = 'c'
;
\""
alias please_postgresql_how_to_list_custom_functions="echo '
select
    n.nspname as function_schema,
    p.proname as function_name,
    l.lanname as function_language,
    case when l.lanname = 'internal' then p.prosrc
        else pg_get_functiondef(p.oid)
        end as definition,
    pg_get_function_arguments(p.oid) as function_arguments,
    t.typname as return_type
from pg_proc p
left join pg_namespace n on p.pronamespace = n.oid
left join pg_language l on p.prolang = l.oid
left join pg_type t on t.oid = p.prorettype
where
    n.nspname not in ('pg_catalog', 'information_schema')
order by
    function_schema,
    function_name
;
'"
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
alias please_docker_how_to_run_php_script="echo -e 'docker run -it --rm --name \e[33mnomFichier.php\e[0m -v \"\$PWD\":/usr/src/myapp -w /usr/src/myapp \e[33mphp:7.4-cli\e[0m php \e[33myour-script.php\e[0m'"
alias please_docker_how_to_run_composer="echo -e 'docker run --interactive --tty composer \e[33mcommandHere\e[0m'"
alias please_docker_how_to_create_sculpin_blog="echo -e 'docker run --interactive --tty composer  create-project sculpin/blog-skeleton \e[33mprojectNameHere\e[0m'"
alias please_docker_how_to_use_stages="printf \"TO IMPROVE:
FROM imageNameHere as yourStageNameHere
# some commands

FROM yourStageNameHere as anotherStageHere
# some commands

FROM yourStageNameHere as yetAnotherStageHere

docker build --target anotherStageHere
\""
alias please_docker_how_to_build_args="printf \"TO IMPROVE: docker --build-args yourArg\""
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
alias please_curl_how_to_send_form="echo -e \"
curl --location --request \e[33mhttpVerbPostOrPutHere\e[0m '\e[33murlHere\e[0m' \\\\
--header '\e[33mheaderNameHere\e[0m: \e[33mheaderValueHere\e[0m' \\\\
--form '\e[33mfieldNameHere\e[0m=\\\"\e[33mvalueHere\e[0m\\\"' \\\\
--form '\e[33mfieldNameHere\e[0m=@\\\"\e[33mpath/to/myFile.here\e[0m\\\"'
\""
# yakuake
alias please_yakuake_start='yakuake'
# firefox
alias please_firefox_browse_cookie_management='echo "about:preferences#privacy"'
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
alias please_ssh_how_to_generate_keys='echo -e "
# follow steps of
ssh-keygen

# start the ssh agent in the background
eval \"\$(ssh-agent -s)\"

# add the key
ssh-add ~/.ssh/\e[33mkeyFileNameHere\e[0m
"'
alias please_ssh_how_to_connect_using_credentials='echo "
1. get the ip address I want to reach under
ifconfig # look for inet

2. use the username and ip address
ssh \e[33musernameHere\e[0m@\e[33mipAddressHere\e[0m

3. fill the password
"'
# slack
alias please_slack_how_to_clear_unread_messages='printf "
shift + echap
"'
# media
alias please_browse_zen_music='printf "
https://www.youtube.com/playlist?list=PLi3HredJD6T8YHb-LdD2WTF2dAElAPRD1
"'
# vue.js
alias please_vue_how_to_use_cdn='printf "
<script src=\"https://unpkg.com/vue@3\"></script>
"'
# nuxtjs
alias please_nuxt_how_to_create_new_app="printf \"
# Will create the project directory, git and dependancies at once

yarn create nuxt-app \e[33mprojectName\e[0m

# Manual creation:

1. \e[33mprojectName\e[0m/package.json:

{
  \\\"name\\\": \\\"\e[33mprojectName\e[0m\\\",
  \\\"scripts\\\": {
    \\\"dev\\\": \\\"nuxt\\\",
    \\\"build\\\": \\\"nuxt build\\\",
    \\\"generate\\\": \\\"nuxt generate\\\",
    \\\"start\\\": \\\"nuxt start\\\"
  }
}

yarn add nuxt

2. \e[33mprojectName\e[0m/pages/index.vue:

<template>
  \e[33m<h1>Hello world!</h1>\e[0m
</template>

3. start the project in dev

yarn dev
\""
alias please_nuxt_how_to_start_app_as_dev="printf \"
yarn dev
\""
# postman
alias please_postman_how_to_write_test_scripts="printf \"
pm.response.json().map((item) => console.log(item.id))
\""
alias please_postman_how_to_visualize_response="echo '
# in test tab
const handleBarsTemplate = \`
<ol>
    {{#each resource}}
        <li>{{name}}</li>
    {{/each}}
</ol>
\`;
pm.visualizer.set(handleBarsTemplate, {
    resource: pm.response.json()
});
'"
alias please_postman_how_to_make_post_request_in_prerequest_scripts="echo -e '
pm.sendRequest({
    url: myUrl,
    method: \"POST\",
    header: { \"Content-Type\": \"application/x-www-form-urlencoded\" },
    body: {
        mode: \"raw\",
        raw: \"hello=world&fruit=apple\"
    }
}, function (error, response) {
    const content = response.json();
    const fruit = content.fruit;

    pm.variables.set(postmanVariableName, fruit);
});
'"
alias please_postman_how_to_set_variables="echo -e '
define a global variable
pm.globals.set(\"\e[33mvariable_key\e[0m\", \"\e[33mvariable_value\e[0m\");

define a collection variable
pm.collectionVariables.set(\"\e[33mvariable_key\e[0m\", \"\e[33mvariable_value\e[0m\");

define an environment variable in the currently selected environment
pm.environment.set(\"\e[33mvariable_key\e[0m\", \"\e[33mvariable_value\e[0m\");

define a local variable
pm.variables.set(\"\e[33mvariable_key\e[0m\", \"\e[33mvariable_value\e[0m\");

remove a variable
pm.environment.unset(\"\e[33mvariable_key\e[0m\");
'"
# sct screen color temperature
alias please_how_to_set_screen_color_temperature='printf "
sct \e[33mtemperatureInKelvinHere\e[0m

Screen default, daylight overcast:
sct 6500

Incandescent lamp:
sct 2400

Candle flame:
sct 1850
"'
# scrum
alias please_scrum_create_poker_room='echo "https://www.scrumpoker-online.org/en/"'