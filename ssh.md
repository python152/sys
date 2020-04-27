# SSH 

## Multiple host jump 

OpenSSH 7.3 above project `-J` option:

    ssh -J jumpuser1@jumphost1,jumpuser2@jumphost2,...,jumpuserN@jumphostN user@target_host
    
As an example, I can jump to my `pie.ornl.gov`:

    ssh -J login1.ornl.gov pie


If preferred, the following configuration can be used `.ssh/config`:

```
Host pie
    HostName pie.ornl.gov
    ProxyJump login1.ornl.gov
```

With this configuration, I can just run `ssh pie`.


## Trouble Shoot

### ssh to vm local (created by vmfusion) takes a long time using hostname

It is fine though if using IP address directly. There are various other fixes, particulary change server's 
`/etc/ssh/ssd_config` and set `GSSAPIAuthentication no`. That doesn't work in my case.

My fix is to use ipv4 explicitly. Edit client's ssh configuration file: `$HOME/.ssh/config`:

```
Host x2.local
   HostName x2.local
   User f7b
   IdentityFile ~/.ssh/fwang2.id_rsa
   AddressFamily inet
```

## References

* https://wiki.gentoo.org/wiki/SSH_jump_host
* https://superuser.com/questions/96489/an-ssh-tunnel-via-multiple-hops
