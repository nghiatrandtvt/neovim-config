: Then arrow up or arrow down to go to previous or next old commands

:set fileformat=unix "to convert file to unix format"

SPC-tk "using telescope to display all keymaps"
SPC-tc "using telescope to display all commands"

SPC-r "source .vimrc"

C-b "show active buffer"
 
-------------------- MOVING --------------------
C-w-H "move all horizontal windows to verical windows"
C-w-K "move all vertical windows to horizontal windows"
 
SPC-Left "move current window to left"
SPC-Right "move the current window to right"
SPC-Down "move the current window down"
SPC-Up "move the current window up"
 
SPC-x "swap current window with the choosen one. Using WinShift"
 
j "from command mode to move cursor to new below line w/o swith to insert mode"

w "move to begining of next word"
b "move to begining of previous word"
------------------- END MOVING -------------------
 
------------- WINDOW CLOSING ---------------
:only "close all other windows, only keep the current window"
:qa "quick all window"
:q "quick current window"
------------- WINDOW CLOSING ---------------
 
------------ FULL SCREEN --------------
C-w-_ "fullscreen window (height)"
C-w-| "fullscreen window (width)"
C-w-= "back to original status before do fullscreen"
--------- END FULL SCREEN -------------
 
--------------- RESIZE -----------------
:resize +/-<size> "resize by height"
:vertical resize +/- "resize by width"
------------- END RESIZE CONFIGURATION ---------------
 
--------------- BUFFER -----------------
SPC-bn "next buffer"
SPC-bs "using telescope list buffer and use ENTER/C-v/C-x/C-t to open buffer to coressponding window"
SPC-bs "using telescope list buffer and use M-d to delete choosen buffer"
SPC-bd "list buffer then delete the selected ones even though it is not saved yet"

:bd "buffer delete - close current buffer"
:bd <n> "buffer delete - close buffer n-th"
:bd! <n> "buffer delete - close buffer n-th w/o saving"
:ls "list buffer"
:buffers "list buffer"

:vsplit | b <n> "open buffer n-th with new vertical window"
:split | b <n> "open buffer n-th with new horizontal window"

M-d "delete selected buffer when opening in Telescope"

:b# open previous buffer on same window
------------- END BUFFER ---------------
 
------------------ TAB -------------------
SPC-tn "go to next tab"
SPC-to "tabnew"
SPC-t1 "go to tab number 1"
SPC-t2 "go to tab number 2"
SPC-t3 "go to tab number 3"
SPC-t4 "go to tab number 4"
SPC-t5 "go to tab number 5"
SPC-t6 "go to tab number 6"
SPC-t7 "go to tab number 7"
SPC-t8 "go to tab number 8"
SPC-t9 "go to tab number 9"

Alt + -> "to next tab"
Alt + <- "to previous tab"

:tabnew "open window/buffer/file/directory into new tab, Tab is the group of windows/files"
:tabn <n> "go to tab n-th"
:tabnext "go to next tab"
:tabprev "go to previous tab"
:tabonly "close all other tabs"
:tabclose "close current tab"
:<n>tabclose "close tab nth"
:<n>,<m>tabclose "close tab nth to mth"
--------------- END TAB ACTION -------------------
 
---------------- NVIMTREE -----------------
:Dirtab <dir> "open directory (NvimTree) with new tab. This is user-defined command, must be capital letter"
:Diropen <dir> "open directory (NvimTree). This is user-defined command, must be capital letter"

SPC-df "nvimtreefind"
SPC-dt "nvimtreetoggle"
SPC-dj "nvimtree focus - jump to nvimtree dir"
SPC-dr "nvimtree refresh"
SPC-dc "nvimtree close"
SPC-dw "resize"

g? "to see all key mapping"
- "to go up parent dir. Need to stay at the directory which is wanted to go up"

E "expand all"
W "collapse all"
S "search file"
Y "copy relative path"
gy "copy absolute path"
ge "copy basename"

C-x "open file in horizontal"
C-v "open file in vertical"
C-t "open file in new tab"
--------------- END NVIMTREE ACTION --------------
 
--------------- TERMINAL -----------------------
C-c "exit editor from terminal to back to NORMAL mode. Equivalent to ESC of normal editor. Make sure you're in TERMINAL mode, not NORMAL mode"

SPC-th "open terminal in horizontal"
SPC-tv "open terminal in vertical"
SPC-tt "open terminal in new tab"
-------------- END TERMINAL --------------------

------------- GIT (USING GITSIGNS and TELESCOPE) ----------------
SPC-gl "show git commit of repo" (Using telescope)
SPC-gf "show git history of current buffer or current file" (Using telescope)
SPC-gb "show git blame of specific line/statement of current file" (Using gitsigns)
SPC-gB "git blame file, not same as SPC-gb"
SPC-gd "git diff" (Using git signs)
SPC-gO "open gerrit home page"
SPC-go "open gerrit with changeId or commit hash. Need to copy them to clipboard first"
SPC-gc "copy full gerrit url. Need to copy them to clipboard first such as using inw key when do SPC-gB"
C-g "open a commit directly from editor"
A-g "copy a commit directly from editor"

:CopyToClipboard <string_to_copy> "copy string to clipboard. It mostly use to open gerrit when we must type commit hash by hand"
C-y to copy hash commit to clipboard when only using Telescope git_commits or git_bcommits
----------- END GIT ------------------

---------------------- GIT FUGITIVE ------------------
################ Git command in command mode such as :Git :G :G diff :Git diff :Gdiffsplit
:Git <action> "to perform action and parameter such as :Git pull --rebase :Git commit --amend :Git clean"
:G or :Git "open new window to display same as doing git status"
:G diff "compare file from working directory against stage area"
:G diff --staged "compare file from stage area against local repository"
:G diff HEAD "compare file from working directory against HEAD of local repository"
:G diff <commit_hash> "compare file from working directory against specific commit of local repository"
:G diff <commit_hash_1> <commit_hash_2> "compare file of specific commit 1 against specific commit 2"
################
 
################ Key mapping on :G window (git stats)
g? "open key mapping. Same as NvimTreeOpen plugin"
s "stage the file under cursor from :Git window"
u "unstage the file under cursor from :Git window"
U "unstage every thing"
X "discard the change of file under cursor to content in working directory even though the file already staged. Like checkout"
= "toggle (turn on/off) the inline change for the file under cursor. If the file is unstaged, it will compare to staged one. If the file is staged, it will compare to local repository one"
dp ":Git diff file under cursor. If file under cursor is unstaged, it will diff to staged one. If file under cursor is staged, it will diff to local repository one"
o "open file under cursor in status window in split window"
gO "same as o but in vertical split"
O "same as o but in new tab"
1p "same as o but in preview mode (it will open directly at the status window, minimize status window)"
#################
-------------------- END GIT FUGITIVE ----------------

-------------------- LAZYGIT -------------------------
? "open key mapping"
C-x "exit sub-window. For example the window when open with ?"
q "Exit lazygit"

o "open commit on browser"
C-o "copy commit url to clipboard"
y "copy commit attributes such as commit hash, author ..."
p "pull"
r "rebase"
0 "focus on preview panel. Then C-x to back to side panels"
+ "zoom out specific panel"
_ "zoom in specific panel"
----------------- END LAZYGIT ------------------------

------------------ SEARCH -------------------
s (lower s) "Search in current file or directory (use . for current directory)"
S (capital s) "Search in all opening buffers (no need to enter location)"

Enter "override the buffer with same file name or previous focused buffer"
v "Open search file in vertical"
h "Open search file in horizontal"
t "Open search file in new tab"

:vimgrep /string_to_search/gj **/*.<file_type> "search string with <file_type> only from current directory"
:copen "open quickfix list after vimgrep"
:noh "to clear search highlight"
:cexpr [] "clear search quickfix list"

C-V "paste to search box"
---------------- END SEARCH -----------------
 
--------------- LSP -----------------
<SPC>-ca "auto import"
<SPC>-ch "hover, check function information"
<SPC>-cr "rename"
<SPC>-cd "diagnostics"

gd "go to definition"
gr "go to reference"

C-o "go backward"
C-i "go forward"

C-s "show all function parameters"
C-k "show all keyword"
------------- END LSP ---------------
 
---------------- TELESCOPE ----------
<C>-v "open file in vsplit (vertical window)"
<C>-x "open file in split (horizontal)"
<C>-t "open file in new tab"

<C-u>	"Scroll up in preview window"
<C-d>	"Scroll down in preview window"
<C-f>	"Scroll left in preview window"
<C-k>	"Scroll right in preview window"
--------------- END TELESCOPE -------

--------------- BOOLEAN REVERT --------------------
Using ! to revert any boolean value
:set nu! "to revert previous :set nu"
:set rnu! "to revert previous :set rnu"
------------- END BOOLEAN REVERT ------------------

------------ BASH ---------------
:! "Use to trigger a execution command mode"
:!bash <script_name> "run script even that script is not in execution mode"
:! <script_name> "run script if it's in execution mode"
:w !bash "run current buffer as script"
---------- END BASH -------------

--------------------- COPY -------------------
:% "means whole file content. It calls range mode (whole file)"
:%y "copy whole file content"
:1,10y "copy line 1 -> 10"
yy "copy current line"
yiw "copy current word"
y "copy current character"
y<n>w "copy <n> word from cursor. Example y6w - copy 6 words"
y<n>l "copy <n> characters from cursor. Example y6l - copy 6 characters"
y$ "copy from cursor to end of line include current character"
y0 "copy from cursor (not include current character) to begining of line"
yi{ "copy words inner {"
yi[ "copy words inner ["

<C>-y "copy whole line except space. For example "    hello abc   " will copy "hello abc" in both INSERT and NORMAL mode"
------------------- END COPY -----------------

--------------------- COPY CLIPBOARD -------------------
"+ "mean register of clipboard"
:%y+ "means whole file content (no need " because it's using range mode, not normal mode. NORMAL mode needs "+ to specify as register (clipboard))"
:1,10y+ "copy from line 1 -> 10"
"+yy "copy current line"
"+yiw "copy current word"
"+y "copy current character"
"+y<n>w "copy <n> word from cursor. Example y6w - copy 6 words"
"+y<n>l "copy <n> characters from cursor. Example y6l - copy 6 characters"
"+y$ "copy from cursor to end of line include current character"
"+y0 "copy from cursor (not include current character) to begining of line"
"+yi{ "copy words inner {"
"+yi[ "copy words inner ["
------------------- END COPY CLIPBOARD -----------------

-------------------- PASTE ----------------------------
p "to paste after cursor (line after cursor, not same line with cursor)"
P "to paste before cursor (line before cursor, not same line with cursor)"
C-r " "paste from default register in INSERT mode"
C-k "paste INSERT/NORMAL mode
----------------- END PASTE --------------------------

-------------------- PASTE CLIPBOARD ----------------------------
C-r + "paste from clipboard register in INSERT mode"
----------------- END PASTE CLIPBOARD --------------------------

----------------- DELETE ----------------------
:%d "delete whole file content"
dd "delete current line"
d$ "delete current cursor to end of line (include cursor)"
d0 "delete current cursor to begining of line (exclude cursor)"

dgg "delete current line to begining line"
dG "delete current line to last line"

d<n>w "delete <n> next words include current word"
d<n>W "delete <n> next words include current WORD"
word: only contain azAZ09_
WORD: every thing  and separate by <space>

d<n>b "delete <n> prev words include current word"
d<n>B "delete <n> prev words include current WORD"
word: only contain azAZ09_
WORD: every thing  and separate by <space>

di{ "delete words inner {"
di[ "delete words inner ["

da{ "delete words inner { and { and }"
da[ "delete words inner [ and [ and ]"

dt<char> "delete until <char>. for example: hello world, cursor is at w, dtl will delete wor, result hello ld"
dT<char> "delete until <char> include <char>. for example: hello world, cursor is at w, dTl will delete worl, result hello d"

df<char> "delete until previous <char>. for example: hello world, cursor is at w, dfl will delete w o, result hellorld"
dF<char> "delete until previous <char> include <char>. for example: hello world, cursor is at w, dFl will delete w ol, result helorld"

d<n>l "delete <n> characters from cursor to right. Example d6l - delete 6 characters"
d<n>h "delete <n> characters from cursor to left. Example d6l - delete 6 characters"

C-a "delete from cursor to beginning of line INSERT mode"
C-l "delete from cursor to end of line INSERT mode"
C-d "delete whole line INSERT mode. Actually do keybinding to <Esc>ddi"
A-d "delete word INSERT mode. Actually do keybinding to <Esc>diwi"
A-D "delete WORD INSERT mode. Actually do keybinding to <Esc>diWi"

ds{ "delete { and its closed {. Using vim surround plugin"
ds[ "delete [ and its closed ]. Using vim surround plugin"

:le "left adjustment. Means move the current line to the most left until see a character not space. Means delete spaces at the begining"
d^ "delete from current cursor until see a charater not space. ^ means a charatier not space"
0d^ "same d^ but move cursor to begining of the line. 0 mean begining of the line"
-------------- END DELETE ---------------------

--------------- OPEN BROWSER -------------------
gx "leave the cursor on the link and type gx to open URL"

SPC-jf "open file at cursor or selected file in VISUAL mode"
SPC-jF "goto file at cursor at pwd"
SPC-jp "open file at cursor with path or selected file with path in VISUAL mode"
SPC-jd "goto dir at cursor"
SPC-ju "open selected url in VISUAL mode"

------------- END OPEN BROWSER -----------------

C-G "to display file name and number of line of fine"
% "jump to close/open bracket"
:set cuc "display column under the cursor"

------------------- FILE COPY --------------------
SPC-fa "copy absolutely current file"
SPC-fr "copy relative current file"
SPC-fn "copy only filename"
---------------- END FILE COPY -------------------

---------------- FOLD/UNFOLD ---------------------
zc "fold block at the cursor"
zo "unfold block at the cursor but just for closest one, like unfold one by one"
zO "unfold block at the cursor, unfold all"
zM "fold all"
zR "unfold all"
-------------- END FOLD/UNFOLD -------------------

-------------- DIFF -------------------------
:diffthis "Diff current buffers to each other. At the current buffer, type diffthis and on another buffer type diffthis again. Can apply to multiple buffers"
:windo diffthis "diff all opening buffers"
------------ END DIFF -----------------------

---------------------- MISC -----------------------------
% "jump to close/open bracket"
C-v "select vertical from the cursor. Move the cursor down to select text"
Note: After select all vertical lines -> Press I (capital i) to enter the Insert mode  -> Type characters want to insert -> ESC to apply all selected vetical lines. 
:<start>,<end>normal I<string_to_add> "Add string as the begining of selected range."
:<start>,<end>normal A<string_to_add> "Add string as the end of selected range."
C-a "increase number by one. For example, the cursor is at 1, C-a will increase one by each C-a"
C-x "same as C-a but to decrease"
-------------------- END MISC ---------------------------