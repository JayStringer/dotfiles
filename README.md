Noteworthy:
To load Tilix settings:
`dconf load /com/gexperts/Tilix/ < tilix.dconf`
To store Tilix settings:
`dconf dump /com/gexperts/Tilix/ > tilix.dconf`

## Vim Cheatsheet

# User Added
ctrl+s = Write file

### Colon Commands
:w = Write file
:q = Quit Vim
:wq = Write and quit

:so % = reload Vim

:noh = Get rid of highlighting

### Modes
i = Insert mode
v = Visual mode
V = Enter visual mode selecting entire lines

esc = Enter normal mode from Insert or Visual mode

### Navigation
h = Left
j = Down
k = Up
l = Right

w = Start of next word
e = End of current word
b = Begining of current word

f+{character} = Will jump to next given character on line
F+{character} = Will jump to previous given character on line

% = Jump to matching parenthesis/brackets
0 = Start of line
$ = End of line

\* = Highlight all occurences of a word, keep pressing to jump forwards between them
\# = Highlight all occurences of a word, keey pressing to jump backwards between them

gg = Start of file
G = End of file
{number}+G = Go to line number

/ = Initite search
n = Next in search
N = previous in search

ctrl+e = Scroll window down
ctrl+y = scroll window up

zz = move current line to center of screen
zt = move current line to top of screen
zb = move current line to bottom of screen

### Commands
u = Undo last action
ctrl+r = Redo last action

y = Copy to Vim buffer
p = Paste from Vim buffer

o = Make a new line below and enter insert mode
O = Make a new line above and enter insert mode

x = Delete character under cursor
X = Delete character to left of cursor

r = Replace character under cursor
R = Enter replace mode from character under cursor

d = Delete
c = Delete, then place into insert mode

. = repeat last command

### Motions (Use with commands)
a = All
i = In
t = UnTil
f = Find forwards
F = Find backwards

### Window Management
:e {filename} = Open file in a new buffer

:split (or :sp) = Split current winow with the same file
:split {filename} = Split window horizontally and load another file
:vsplit {filename} (or :vsp) = Split window vertically and load another file

:sp | b{buffernumber} = Split window horizontally and open buffer number
:vsp | b{buffernumber} = Split window vertically and open buffer number

:hide = Close current window
:only = Close all other windows

:ls = Show currently buffered files
:b{buffer number} = Open buffer number in this window

:bd = Unload Current buffer
:bd{buffer number} = Unload buffer number

#### ctrl+w
- {arrow direction} = Move cursor in direction of arrow
- _ = Maximise current window
- = = Make all windows equal size
- 10ctrl+w+ = Increase window size by 10 lines

- r = Rotate windows up/down
- R = Rotate windows left/right

- L move current window to far right
- H move current window to far left
- J move current window to far bottom
- K move current window to far top



## Tmux Cheatsheet

### Command Line
tmux new -s {session-name} = Create new session
tmux ls = List Tmux sessions
tmux attach -t {session-name} = Attach to running session
tmux kill-session -t {session-name} = Kill a running session 

### In Session
Use *ctrl+b* to initiate these commands

#### User Added
- r = Reload Tmux

#### Colon Commands
- :source-file ~/.tmux.conf = Reload Tmux

#### Window Management
- c = Create new window
- {window-number} = Move to window
- comma = Rename a window
- n = Next window
- p = Previous window
- l = Last window
- w = List windows
- & = Kill window
- - = Split window horizontally
- | = Split window vertically
- d = Detach from session

#### Pane Management
- o = Swap panes
- q = Show pane numbers, then press number to go to pane
- x = Kill pane


## NERDTree Cheatsheet
F3 = Toggle NERDTree


## FZF Cheatsheet
,e = Search for files
,g = Search for tags in current finder files
,G = Search for tags in all files
,f = General code finder in current finder mapping
,F = General code finder in all files mapping
,c = Commands finder mapping

ctrl+x = Open file under cursor as horizontal split
ctrl-v = Open file under cursor as vertical split

