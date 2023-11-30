# LISP-ls

Lisp ls is an infamous and useless minimal ls clone in lisp

## How to use :

the ls symlink is intended to be used as a binary (it's not) 

be sure that ls has executable permissions `chmod +x ls`

Then you can do `./ls` to let the magic begin (because it has a shebang, it will use sbcl to run)

You can add it to the path if you want to use Lisp-ls as you default ls command (please don't do this)

## FLAGS :

Of course you can use -h argument to get the argument list

Also because i felt bored, i added -rev argument, it simply reverse all the files names likes  `./ls | rev`

## Requirements :

You need sbcl to run the script `sudo apt-get install sbcl`

