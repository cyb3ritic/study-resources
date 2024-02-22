
# <center>Path Traversal Vulnerability</center>

- path traversal/directory traversal/Local File Inclusion (LFI)
- allows attacker to read or write(sometimes) on target server,
 

 ## Methodology

 - to determine vulnerability, enumerate all parts of the application that accept content from users.
 - includes HTTP GET and POST queries, file upload options and HTML forms.
    Some examples of check to be performed are:
    * Are there request parameters which could be used for file-related operations?
    * Are there unusual file extensions?
    * Are there interesting variable names?
    * http://example.com/getUserProfile.jsp?item=ikki.html
    * http://example.com/index.php?file=content
    * http://example.com/main.cgi?home=index.html
    * Is it possible to identify cookies used by the web application for the dynamic generation of pages or templates?
    * Cookie: ID=d9ccd3f4f9f18cc1:TM=2166255468:LM=1162655568:S=3cFpqbJgMSSPKVMV:TEMPLATE=flower
    * Cookie: USER=1826cc8f:PSTYLE=GreenDotRed


## Path traversal simple case:

- /etc/passwd
- /../../../../etc/passwd    ==> traversal path


## File path traversal, traversal sequences blocked with absolute path bypass

- application blocks traversal sequences but treats the supplied filename as being relative to a default working directory.
- absolute path means exact path.
- just use absolute path like /etc/passwd  or  /etc/hosts.


## File path traversal, traversal sequences stripped non-recursively

- use nested traversal sequences ....// or ....\\/, example: //....//....//....//etc/passwd or /..././..././..././etc/passwd
- validation mechanism will remove ../ and still we get sensible payload,
- nested traversal sequences revert to simple traversal sequences when the inner sequence is stripped.
    * In some cases application blocks input containing path traversal sequences and performs url decode of the input before using it. So you might need to url encode the traversal sequence.
    * . ==> %2e<br>
      / ==> %2f<br>
      % ==> %25


## File path traversal, validation of file extension with null byte bypass

- Null character %00
- In some cases server validates the extension of the file.
- to bypass this validation we use null byte. example: ../../../etc/passwd%00.png (when server allows only .png file).
    * In some cases you may need to combine all payload example: ....//....//....//etc/passwd%00.png


<i> <strong> Note: </strong> tool for fuzzing path traversal vulnerability: dotdotpwn</i>