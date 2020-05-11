# One liners

## cp N files from one directory to another

```sh
find source_dir -type f |head -1000|xargs -J X cp X target_dir
```
