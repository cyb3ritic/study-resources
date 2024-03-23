## Introduction to Cyber Security

### Introduction to Offensive Security

- process of breaking into couputer systems exploiting bugs, finding loopholes to gain unauthorized access.
- to beat hacker, behave like a hacker.

#### Hacking  my first machine in this lab:

- I'm given with a website of a bank (ofc it's fake), url: ```http://fakebank.com```

    - step 1: Used gobuster to detect the hidden webpages (wordlist.txt was given)
    
        - gobuster -u ```http://fakebank.com``` -w wordlist.txt
        - found /images (status 301), /bank-transfer (status 200)

    - step 2: ```http://fakebank.com/bank-transfer``` gives a secret admin page to do the transaction from any customer's account

        - transferred $2000 from account 2276 to min bank account (@8881)


### Introduction to defensive security

- oppisite to offensive security, connected with two main tasks:

    - preventing intrusions from occuring,
    - Detecting intrusions when they occur and responding properly.

- tesks related to defensive security:

    1) user cyber security awareness
    2) documenting and managing assets
    3) updating and patching systems
    4) Setting up preventative security devices
    5) setting up logging and monitoring devices.

#### Area of Defensive security
1) Security Operations Center(SOC)
2) Digital Forensics and Incident Response(IFDR)

<strong>SOC</strong>

- Team of cyber security professionals that monitors teh network and its systems to detect malicious events.
- Some of the main areas of interest for SOC are:

    - vulnerability
    - policy violations
    - unauthorized activity
    - network intrusions

- Threat Intelligence
    
    - gethers information about actual and potential threat(any action that would disrupt or adversely effect the system)
    - purpose is to achieve threat informed defense
    - Intelligence need data, therefore, 
        - collects data from local source such as network logs and public source such as forums.
        - further data is processed and analyzed to create list of recommendations and actionable steps.

<strong>Digital Forensics </strong>
- investigate digital crimes and establish facts.
- focus on different areas such as :
    - File system
    - System memory
    - System logs
    - Network logs

<strong>Incident Response</strong>
- specifies methodology that should be followed to handle incidents.
- 'incidents' --> data breash / cyber attack
- four major phases of Incident Response process:
    - preparation
    - Detection and analysis
    - containment, eradication and recovery
    - post-incident activity

<strong>Malware analysis</strong>
- 'malware' --> malicious software
- virus
    - piece of code that attaches itself to program
    - designed to spread from one computer to another
    - works by altering, overwriting and deleting files once it infects computer
- Trojan horse
    - program that shows one desireable function but hide a malicious function underneath
- Ransomware
    - Malicious program that encrypts the user's files
    - Attacker offers the encryption password if the user it willing to pay a 'ransom'.
