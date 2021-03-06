# First of all, I really don't like C-a to be my key combination, since
# I use it a lot to get the same effect as the `Home' key. So, I choose
# C-\ as my preferred shortcut key by adding this line to my ~/.screenrc.

escape \034\034

# (If you are wondering, \034 is the key sequence C-\ in octal. Please
# read the documentation for `escape' in the screen man page to find out
# how I arrived at that).

# Prefer an audible bell to the visual one.
vbell off

# Skip the startup message
startup_message off

# Display a caption string below, appearing like tabs and
# displaying the window number and application name (by default).
caption always
caption string "%{kw}%-w%{wr}%n %t%{-}%+w"

# Special keys. C-a m will spawn Mutt, for example, on window 7 (if it
# is available), or the next available window.

#bind m screen -t 'Mutt'    7 mutt
#bind e screen -t 'Elinks'  8 elinks www.google.co.in
#bind i screen -t 'Irssi'   9 irssi

hardstatus on
#hardstatus alwayslastline
startup_message off
termcapinfo xterm ti@:te@
hardstatus string "%{= kG}%-w%{.rW}%n %t%{-}%+w %=%{..G} %H %{..Y} %m/%d %C%a"

screen -t fwang2@lgmgmt1
screen -t root@lgmgmt1-A
screen -t root@lgmgmt1-B
screen -t bigshot01
screen -t bigshot02
screen -t bigshot03
screen -t bigshot04



