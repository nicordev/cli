# CLI script

Some useful homemade CLI scripts.

> If you're a Windows user, now is a good time to switch to Linux and claim your freedom!

## Installation

* `git clone https://github/com/nicordev/cli_script.git` clone the repository.
* `sudo ln /pathTo/requestedScript /usr/local/bin` create a link to `/usr/local/bin` folder, thus allowing the script to be called anywhere in the terminal and be updated after a `git pull origin master`.
    * If you don't need the script to be updated, just copy it: `sudo cp /pathTo/requestedScript /usr/local/bin`
* *Bonus:* create an alias of the script in your `~/.bashrc` file to make awesome combinations:

    ```bash
    alias please_do_something="scriptFileNameOrWhateverYouNeedToRun"
    ```
