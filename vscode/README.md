
# Notes

Anything related to vscode


## Plugins

* C/C++
* Python
* Markdown All In One
* Markdown Preview Enhance (MPE)
* clang-format
* Cmake (syntax highlight)
* Cmake Tools (build stuff)
* Blackboard Theme
* [Code Runner](https://marketplace.visualstudio.com/items?itemName=formulahendry.code-runner)
* Night Owl (theme)
* Latex Workshop
* Bracket Colorizer 2
* Rewrap
* Bracket Colorizer 2


## Latex Workshop

Important short cut:

    CMD + Option + j  -> (source to PDF)
    CMD + left click  -> (PDF to source)

## Customize current line

Go to this file:

    cd ~/.vscode/extensions/gerane.theme-blackboard-0.0.2/themes
    vi Blackboard.tmTheme

Modify this key/val pair:

    <key>lineHighlight</key>
    <string>#8B0000</string>

If we diff:

    09:20:42 $ diff Blackboard.tmTheme Blackboard.tmTheme.save
    23c23
    < 				<string>#8B0000</string>
    ---
    > 				<string>#FFFFFF0F</string>
> 


## Run Code (Code Runner)


see sys/vscode/settings.json for my setup:

    "code-runner.executorMap": {
        "cpp": "cd $dir && g++ -std=c++11 $fileName -o $fileNameWithoutExt && $dir$fileNameWithoutExt"
    },
    "code-runner.clearPreviousOutput": true,


short cut:

    Control + Alt + N: Run the code
    Control + Alt + M: Stop the code
    To select language to run: Control + Alt + J



## Other Short cuts

```
Shift+Option+F          Format code
Ctrl-G                  Go to line
Cmd+P                   Go to symbol
Cmd+\                   Split window
Ctrl+~                  Open new terminal
Cmd+click               Go to definition
```


