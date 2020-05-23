
## Copy buffer to file

<kbd>prefix</kbd> + <kbd>:</kbd>, then type in `capture-pane -S -3000` + <kbd>return</kbd> (Replace `3000` with however many lines you'd like to save.) This copies those lines into a buffer.

Then, to save the buffer to a file, just use <kbd>prefix</kbd> + <kbd>:</kbd> again, and type in `save-buffer filename.txt`, replacing `filename` with whatever you'd like. 

(By default <kbd>prefix</kbd> is <kbd>ctrl + b</kbd>.)
