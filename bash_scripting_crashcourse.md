 [credit to Vivek Pandit, Instructor on Udemy.]: #

# <center>Bash Scripting Crash Course (learning with projects )</center>

## Course Curriculum:
| Topic ID | Topics|
|----------|-------|
| 1 | Introduction |
| 2 | Basics of Shell |
| 3 | Variables in bash |
| 4 | Strings in bash |
| 6 | Arithmatics in bash |
| 7 | i/o redirection and piping in bash|
| 8 | Arguments in bash |
| 9 | Exit status |
| 10 | If-Else conditions |
| 11 | While loops |
| 12 | For loops |
| 13 | Case statements |
| 14 | Functions |
| 15 | Colors in bash |
| 16 | Simple projects |
| 17 | Advanced projects |

## <center>[1] Introduction</center>
### [1.1] <u>What is Shell Scripting?</u>
<strong>Shell scripting</strong> is the process of writing and executing scripts in a shell (command-line interpreter) to automate tasks. It involves using scripting languages, such as Bash, to write a series of commands and instruction that can be executed sequentially. Shell scripts are commonly used in Unix-like operating systems for system administration and automation purposes.

<string>Bash shell</strong> is a powerful tool used by developers, system administrators and anyone who wants to automate tasks, streamline workflow and unlock the full potential of their computer or system.

<strong>Shell scripting is a versatile tool that can automate a wide reange of tasks.</strong>
Here are some examples of tasks commonly performed using shell scripting:
1. File and directory management
2. System administration
3. Data processing
4. Automation of repetitive tasks
5. Application and service management
6. System monitoring and reporting
7. Network-related tasks
8. Web-realated tasks
9. Task scheduling
10. Interactive user interface

### [1.2] <u>The Bourne Shell:</u> /bin/sh

The shell is one of the most important parts of a Unix System. A shell is a program that runs commands, like the ones that users enters into a terminal window. These commands can be other programs or built-in features of the shell. The shell also serves as a small programming environment. Unix programmers often break common tasks into smaller components and use the shell to manage tasks and piece things together.

Many impotant parts of the system are actually shell scripts-text files that contain a sequence of shell commands. There are many different Unix shells but all derive features from the Bourne shell (/bin/sh).

<strong>Linux uses an enhanced version of the Bourne shell called bash or the "Bourne-again" shell.</strong>

## <center>[2] Basics of Shell</center>
### [2.1] <u>Shebang Theory</u>
```bash
#!/bin/bash
```
'#' -> Sharp

'!' -> Bang

 On Linux, a shebang (#!) is a special line at the beginning of a script that tells the operating system which interpreter to use when executing the script.This line, also known as a hashbang, shabang or "sharp-exclamation", is the first line of a bash and starts with "#!" followed by the path to the interpreter.

 ### [2.2] <u>Shebang Practical</u>

 ```bash
 #!/bin/bash

 echo "Hello World!"
 ```
output: <i>Hello World!</i>


 ```bash
 #!/bin/python

 echo "Hello World!"
 ```
 output:<i> bash: ./hello_world.sh: /bin/python: bad interpreter: No such file or directory</i>

## <center>[3] Variables in bash</center>

A variable is a value that can change, depending on conditions or an information passed to the program. A variable in bash can contain a number, a character, or a string of characters.

<strong>How to define a variable?</strong>

Syntax:
- variable_name=value

Rules set for defining bash variables:
1. Prefix the variable name with dollar ($) sign while reading or printing a variable.
2. Leave off the dollar sign ($) while setting a variable with any value.
3. Alpha-numeric or may be written with underscore (_)'.
4. Case sensitive
5. No white space on either side of equal sign (=) between the variable name and its value.

Examples:
- var1=5
- var2='a'

## <center>[4] Strings in bash</center>

Bash String is a data type such as an integer of floating point unit. It is used to represent text rather numbers. It is a combination of a set of characters that may also contain numbers.

Examples:
- var3="cyb3ritic p4r4d0x"
- ```bash
    #!/bin/bash

    message="Hyy everyone! Are you enjoying this course?"
    echo $message
    ```
    output: <i>Hyy everyone! Are you enjoying this course?</i>

### [4.1] <u>Playing with strings</u>

- <strong>replace:</strong>

    syntax: echo$(<variable_name>/<initial_substring>/<final_substring>)
    - only replaces the first encountered word/letter

 ```bash 
    #!/bin/bash
    STR="WELCOME TO BASH SCRIPTING"
    echo${STR/BASH/SHELL} # This replaces the word BASH with SHELL.
 ```
output: <i>WELCOME TO SHELL SCRIPTING</i>

- <strong>Slicing:</strong> 

    syntax : echo ${variable_name:starting_index:no_of_characters}
     ```bash 
    #!/bin/bash
    STR="WELCOME TO BASH SCRIPTING"
    echo${STR::7}
    echo${STR:8:2}
    echo${STR:11:-10}
    ```
output:

<i>WELCOME</i><br>
<i>TO</i><br>
<i>BASH</i>

## <center>[3] Arrays in bash</center>

An array is a systematic arrangement of the same type of date. But in shell script Array is a variable which contains multiple values may be of same type or different type since by default everything inshell script is treated as a string. An array is zero-based i.e. indexing start with 0.

Example:
Array=(one two three four five)

```bash
   #!/bin/bash

    array=(one two three four five)
    echo ${array[0]}
    echo ${array[2]}
    array[5]="six"
    echo ${array[@]}
    echo ${!array[@]}

```
output:

<i>one</i><br>
<i>three</i><br>
<i>one two three four five six </i><br>
<i>0 1 2 3 4 5</i>


## <center>[6] Arithmatic Calculaation in bash</center>

Arithmatic calculation in bash are a very important part of shell scripting. Their will only be some basic examples of arithmatic calculations in this course.

We will discuss three different ways to perform arithmatic calculations in this lecture:

|<center>1</center>|    |<center>2</center>|    |<center>3</center>|       
|------------------|----|------------------|----|------------------|
|CAL=$((7+10+));   |    |expr 7 + 10       |    |echo "7 + 10" | bc|
|echo $CAL         |    |                  |    |                  |
