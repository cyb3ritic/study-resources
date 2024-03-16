# <center>Subdomain Enumeration</center>

<b>three main methods of subdomain enumeration</b>
- Brute Force
- OSINT (Open-Source Intelligence)
- Virtual Host

### OSINT - SSL/TLS
- check Certificate Transparency (CT) logs
- https://crt.sh
- https://ui.ctsearch.entrust.com/ui/ctsearchui

### OSINT - SSL/TLS
- use google dorking/hacking
- example: "-site:www.domain.com site:*.domain.com"

### DNS Bruteforce
- using tool like <b>dnsrecon</b>

### OSINT - Sublist3r
- can automate above methods with the tools like Sublist3r,
- [Click me](https://github.com/aboul3la/Sublist3r) to get the github repository of Sublist3r tool.

### Virtual Hosts
- Some subdomains may not be hosted in publically accessible DNs result.
- Since web servers host multiple websites from one server, we can utilise <b>Host</b> header by making changes to it and monitoring the response.
- can automate this process using wordlist of commonly used subdomains.
- example:
```bash
ffuf -w /usr/share/wordlist/namelist.txt -H "Host: FUZZ.website.com" -u http://website_ipaddress
```

