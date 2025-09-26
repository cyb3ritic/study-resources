

## What is Reconnaissance?
Recon in the context of a bug bounty is the process of gathering information about a target. It is the most important step in the bug bounty hunting process and can help to identify vulnerabilities that may not be apparent

Two types of Reconnaissance:
- Active
- Passive

## Active and Passive Reconnaisance
Active | Passive
-------|--------
Interacting directly with the target to gather information. | Gathering information about a target without directly interacting with it.
**Examples:** Port Scanning, Vulnerability Scanning, Probing subdomains. | **Examples:** WHOIS lookups, DNS records, publicly available data, social media.

## Enumerating ASN and IP Blocks
An Autonomous System Number(ASN) is a unique identifier assigned to an organization or company.
For instance, in case of PayPal, we can use [bgp.he.net](https://bgp.he.net) to identify the ASNs associated with the company.

Alternatively, we can also use the publicly available **bgpview** API to query for ASN.
- `curl -s https://api.bgpview.io/search?query_term=paypal | jq`

Alternatively, Nmap script **target-asn** can aslo be utilized for extracting IP ranges based upon an ASN.
- `nmap --script targets-asn --script-args target-asn.asn=<asn>`

## Reverse IP Lookup
Reverse IP lookup involves querying an IP address to identify domains hosted on the same IP address. There are various online tools available providing the ability to perform a reverse IP lookup, such as [yougetsignal.com](https://www.yougetsignal.com/), [ViewDNS.info](https://viewdns.info/), [rapiddns.io](https://rapiddns.io/)

Alternatively, we can use curl command to extract domain information from **RapidDns** for a specific IP range associated with PayPal.
- `curl -s 'https://rapiddns.io/sameip/64.4.250.0/24?full=1#result' | grep 'target="' -B1 | egrep -v '(--|)' | rev | curl -c 6- | rev | cur -c 5- | sort -u`

## Reverse IP lookup with Multi-Threading
To expedite the process of Reverse IP Lookups, especially when querying multiple IP addresses simultaneously, multi-threading can be used.

**Github tool:** [https://github.com/codingo/Interlace](https://github.com/codingo/Interlace)

- `interlace -tL ip.txt -c "curl -s 'https://rapiddns.io/sameip/<target>?full=1#result' | grep 'target="' -B1 | egrep -v '(--|)' | rev | cut -c 6- | rev | cut -c 5- | sort -u >> output.txt" -threads 2 --silent --no-color --no-bar`

## Scanning for Open Ports/Services

After conducting reverse IP lookups, the next logical step is to query for open ports. Open ports can reveal HTTP servers operating on non-standard ports, which might be overlooked in standard scans.

### 1. Scanning open ports with masscan
- `sudo masscan --open-only 64.4.240.0/21 -p1-65535,U:1-65535 --rate=10000 --http-user-agent "Mozilla/5.0 (Windows NT 10,0; Win64;x64;rv:67.0) Gecko/20100201 Firefox/67.0" -oL "output.txt"`
