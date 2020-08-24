# Mapfile Migration

Initially we had planned to use the secure copy `scp` command in order to migrate the mapfiles from the old to new server The ssh key that is used to verify the <user> account is on a Windows machine. This key is required to ssh to any remote server. We are communicating with the <newserver> using the Windows application PuTTy. Once can provide the `-i` flag when executing the `ssh` or `scp` command to provide a file containing their public key. 

That would result in a command like the following:

```bash
$scp -i <user>@<oldserver>:/path/to/source ./path/to/destination
```

However, due to the security policy surrounding the ssh on this remote server, an ssh key is considered _too_ public if its is stored in a file there. Thus the `ssh` or `scp` request is denied by the servers own security policy. There was no way to pass the ssh key safely using PuTTy to perform the `scp` while we are `ssh`'d to the _wellmapsrvdev02_. This also rules out other solutions such as FileZilla, since the `woodj` account could only be verified by the credentials stored on the local machine.

PuTTy Secure Copy `pscp` provided a solution to this. This command relies on the public keys stored in the PuTTy Authentication Agent (Pageant). This was the key that was used to verify the <user> account on both the <oldserver> and the new <newserver>. Since `pscp` cannot transfer files from remote to remote we have to introduce and intermediary step.

The final solution involved the following:

```bash
# From: old server --> local machine
$pscp <user>@<oldserver>:/path/to/source \path\to\local\destination

# From: local machine --> new server
$pscp \path\to\local\destination <user>@<oldserver>:/path/to/destination
```

Note: The local machine runs windows hence the trailing backslashes (`\`), whereas both servers are Linux machines running Apache2 clients (`/`).

