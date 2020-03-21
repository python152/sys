# ssh notes


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

