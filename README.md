# compression_test
The small script in the scripts directory can be moved and altered to test out
how different compression methods could work out for you. Top of the file has
the settings that can be changed, like the directory that is being compressed.
Best to run in the parent directory for ease of use, but if you know what you
are doing, you can make it work anywhere. Runs in Bash, and might require some
additional software.

# Setup
It is expected that a few programs are installed. You could run it and just
address each one as they error out, but the software being used are:

 - time
 - du
 - zip
 - rar
 - tar
 - 7za

For my Debian based Linux distro, I got everything I needed with:

```
sudo apt install zip rar p7zip-full
```

At the top of the script, there are two variables worth reviewing:
  directory_name - the name of the directory that will be archived
  verbose_output - true gives more output, but false is recommended

# Execute
The default directory_name is set to "data". If this is correct, or if you
go into the script and change the default name to the correct name, then the
program just runs.

```
./compare_compressions.sh
```

In case it would help, you can provide the name of the directory you want to
compress and it will overwrite the default option.

```
./compare_compressions.sh my_data
```

This will test out the compression on a directory labeled "my_data"

# Notes
First, test this on a small or even empty directory, to make sure all software
is available and the script runs correctly. On larger data, it might seem to
stall due to suppressing output to make a cleaner result. On an empty
directory, it should run in under a second.

This does create actual files for each of the compression types. If you are
rather new to Linux and Bash, you can easily remove these files with:

```
rm data.\*
```

where data is the name of the directory. By adding in the . character, you
won't risk deleting your directory, which is also guarded by the fact that
the approriate flag was not provided to rm to delete a directory. You can
add additional layers of caution with

```
rm -i data.\*
```

This will prompt you before each deletion. I would include this step into the
script, but I am cautious when it comes to public code. Also, someone might
want to do further comparisons on the archived data.
