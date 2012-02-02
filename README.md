# rgrep.vim #

Inspired by ack.vim, but works with grep instead of ack.


## Setup ##

It is intended to be used with this:

    set grepprg=grep\ -nrI\ --exclude-dir=target\ --exclude-dir=tmp\ --exclude-dir=log\ --exclude="*.min.js"\ --exclude="*.log"\ $*\ /dev/null

You can choose whatever arguments you like for grep.

## Usage ##

    :RGrep [options] [{pattern} {directory}]

Search recursively in {directory} for the {pattern}. If {pattern} is not given,
it will look for the word under cursor for all files, recursively.

Files containing the search term will be listed in the split window, along with
the line number of the occurrence, once for each occurrence.  [Enter] on a line
in this window will open the file, and place the cursor on the matching line.

Just like where you use :grep, :grepadd, :lgrep, and :lgrepadd, you can use `:RGrep`, `:RGrepAdd`, `:LRGrep`, and `:LRGrepAdd` respectively. (See `doc/rgrep.txt`, or install and `:h RGrep` for more information.)

### Keyboard Shortcuts ###

In the quickfix window, you can use:

    o    to open (same as enter)
    go   to preview file (open but maintain focus on rgrep.vim results)
    t    to open in new tab
    T    to open in new tab silently
    v    to open in vertical split
    gv   to open in vertical split silently
    q    to close the quickfix window

This Vim plugin is derived from ack.vim.
