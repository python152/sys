# One liners

## cp N files from one directory to another

```sh
# macOS
find source_dir -type f |head -1000|xargs -J X cp X target_dir

# Linux
mkdir t1000; find /gpfs/alpine/darshan/summit/2019/1 -type f |head -n1000|xargs cp -t t1000
```
