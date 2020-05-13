# One liners

## Copy a fix number of files from one directory to another

```sh
# macOS
find source_dir -type f |head -1000|xargs -J X cp X target_dir

# Linux
mkdir t1000; find /gpfs/alpine/darshan/summit/2019/1 -type f |head -n1000| xargs cp -t t1000
```

The `J` option places all the filenames into the placeholder `X`, which can be any character(s) and cp accepts multiple files to a target directory. This option doesn't seem to work on Linux though.


