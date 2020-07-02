## Basics: 
`pwd` outputs the name of the current working directory.
`ls` lists all files and directories in the working directory.
`cd` switches you into the directory you specify.
`mkdir` creates a new directory in the working directory.
`touch` creates a new file inside the working directory.
`echo` like `console.log(<input>)` in jS, we can use it to call things like...
    - $HOME
    - $USER
`whoami`

## Options modify the behavior of commands:
`ls -a` lists all contents of a directory, including hidden files and directories
`ls -l` lists all contents in long format
`ls -t` orders files and directories by the time they were last modified
Multiple options can be used together, like `ls -alt`

## From the command line, you can also copy, move, and remove files and directories:
`cp` copies files, e.g. `cp biopic/ray.txt biopic/notorious.txt historical/ ` copies ray.txt & notorious.txt to historical, to copy all use  `*`, copy only txt files that start with letter m `m*.txt`
`mv` moves and renames files, e.g. `mv superman.txt superhero/ ` moves superman.txt to superhero folder, can do multiple files like cp. Can also rename files, `mv batman.txt spiderman.txt`, renames to spiderman.txt
`rm` removes files
`rm -r` removes directories
 
## nano (text editor)
`nano <filename>` to open nano with file name <filename> e.g. `nano hello.txt`
`Ctrl + O `saves a file. ‘O’ stands for output.
`Ctrl + X` exits the nano program. ‘X’ stands for exit.
`Ctrl + G` opens a help menu.
`clear` clears the terminal window, moving the command prompt to the top of the screen.

## ~/.bash_profile or ~/.bashrc on linux
to edit `nano ~/.bash_profile `
to execute `source ~/.bash_profile` <= makes bash profile commands available in current session
    - Things we can execute
    - `echo` before a link, will log the line
    - `alias <macro>=<actual>` will create a macro, e.g. `alias pd='pwd'` , `alias hy="history"`, `alias ll="ls -la"`
    - `export VARIABLE="Value"` sets and exports an environment variable.
    - `export USER="Jane Doe"` will print `Jane Doe` if we type `echo $USER` after executing `source ~/.bash_profile`
    - `export PS1=">> "` changes  prompt to `>> `instead of the standard `$`
    - `PATH` returns a colon separated list of file paths. It is customized in advanced cases.
    - `env` returns a list of environment variables.

## stdin stdout and stderr
`echo "Hello" > hello.txt ` creates hello.txt file, `cat hello.txt` prints `Hello`
`cat oceans.txt > continents.txt` replaces continents.txt content with oceans.txt content
`cat glaciers.txt >> rivers.txt ` adds (appends) glaciers.txt into rivers.txt
`cat < lakes.txt` prints lakes.txt content into the program/terminal
`|` pipe, redirect the output to somthing else.
`cat volcanoes.txt | wc | cat > islands.txt ` 1. redirects output to wordcount, then to replaces the content ofl island.txt file
`sort lakes.txt` returns lakes.txt sorted, we can do `cat lakes.txt | sort > sorted-lakes.txt` or `sort lakes.txt | cat > sorted-lakes.txt` to achieve the same result
`grep Mount mountains.txt` displays all with `Mount` in string, `grep -i Mount mountains.txt` makes it non case-sensitive


## REPLACING
`sed 's/snow/rain/' forests.txt ` searches forests.txt for FIRST instances of snow & replcaes with rain
`sed 's/snow/rain/g' forests.txt ` searches forests.txt for ALL instances of snow & replcaes with rain

## BASH SCRIPTING
execute permission for .sh files   `chmod +x <filename>` e.g `chmod +x script.sh`
on linux it runs `~/.bashrc`
run `.sh` files in director by calling path, e.g `./script.sh`
