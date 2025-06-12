## installs & updates


### configure ssh
add public key(s) to user

```bash
mkdir -p .ssh
vi .ssh/authorized_keys
```
now find lines and change the following

```bash
sudo nano /etc/ssh/sshd_config
```
the settings should be like this:
```conf
PubkeyAuthentication yes
PasswordAuthentication no
ChallengeResponseAuthentication no
PermitRootLogin no 
```

now restart ssh service
```bash
sudo systemctl restart sshd
```

### configure sudoers
Need to make the initial user into a sudo user

```bash
# enter root
su -

# add user to sudoers
usermod -aG sudo USERNAME

# might need to re-ssh into user for changes to take effect
```


### configure packages
```bash
sudo apt install open-iscsi curl -y
```