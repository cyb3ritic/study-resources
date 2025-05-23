# <center>Bash Scripting Crash Course</center>

## 📚 Table of Contents

| Topic ID | Topic                                      |
|----------|--------------------------------------------|
| 1        | [Introduction](#1-introduction)            |
| 2        | [Basics of Shell](#2-basics-of-shell)      |
| 3        | [Variables](#3-variables-in-bash)          |
| 4        | [Strings](#4-strings-in-bash)              |
| 5        | [Arrays](#5-arrays-in-bash)                |
| 6        | [Arithmetic](#6-arithmetic-in-bash)        |
| 7        | [I/O Redirection & Piping](#7-io-redirection-and-piping) |
| 8        | [Arguments](#8-arguments-in-bash)          |
| 9        | [Exit Status](#9-exit-status)              |
| 10       | [If-Else Conditions](#10-if-else-conditions)|
| 11       | [While Loops](#11-while-loops)             |
| 12       | [For Loops](#12-for-loops)                 |
| 13       | [Case Statements](#13-case-statements)     |
| 14       | [Functions](#14-functions)                 |
| 15       | [Colors](#15-colors-in-bash)               |
| 16       | [Simple Projects](#16-simple-projects)     |
| 17       | [Advanced Projects](#17-advanced-projects) |

---

## <center>1. Introduction</center>

### 1.1 What is Shell Scripting?

**Shell scripting** automates tasks by writing scripts for the shell (command-line interpreter). Bash is the most popular shell on Linux.

**Common uses:**
- File & directory management
- System administration
- Data processing
- Automation of repetitive tasks
- Application/service management
- Monitoring & reporting
- Networking tasks
- Scheduling
- Interactive user interfaces

### 1.2 The Bourne Shell and Bash

- **Shell**: Program that runs commands and scripts.
- **Bourne Shell** (`/bin/sh`): The classic Unix shell.
- **Bash**: "Bourne Again SHell" — the default on most Linux systems, with many enhancements.

---

## <center>2. Basics of Shell</center>

### 2.1 Shebang (`#!`)

The **shebang** tells the OS which interpreter to use.

```bash
#!/bin/bash
```

- Place it as the first line in your script.
- Without it, the script may not run as expected.

### 2.2 Hello World Example

```bash
#!/bin/bash
echo "Hello World!"
```
Output: *Hello World!*

---

## <center>3. Variables in Bash</center>

- Variables store data (numbers, strings, etc.).
- **Assignment:** `variable_name=value` (no spaces around `=`)
- **Access:** Use `$variable_name`

**Rules:**
- Case-sensitive
- Use only letters, numbers, and underscores
- No spaces around `=`

**Examples:**
```bash
name="cyb3ritic"
echo $name
```

---

## <center>4. Strings in Bash</center>

- Strings are sequences of characters.
- Use quotes for strings with spaces.

**Examples:**
```bash
greeting="Hello, world!"
echo "$greeting"
```

### 4.1 String Manipulation

**Replace:**
```bash
str="Bash scripting"
echo ${str/Bash/Shell}  # Output: Shell scripting
```

**Slicing:**
```bash
str="Bash scripting"
echo ${str:0:4}   # Output: Bash
echo ${str:5:9}   # Output: scripting
```

---

## <center>5. Arrays in Bash</center>

- Arrays store multiple values.
- Indexing starts at 0.

**Declare:**
```bash
array=(one two three)
echo ${array[0]}      # one
echo ${array[@]}      # one two three
echo ${!array[@]}     # 0 1 2
```

See [`examples/arrays.sh`](examples/arrays.sh) for more.

---

## <center>6. Arithmetic in Bash</center>

Bash supports integer arithmetic.

**Methods:**
1. **Double Parentheses:**
   ```bash
   result=$((7 + 10))
   echo $result
   ```
2. **`expr` Command:**
   ```bash
   expr 7 + 10
   ```
3. **`bc` for floating point:**
   ```bash
   echo "7 / 3" | bc -l
   ```

See [`examples/arithmetic.sh`](examples/arithmetic.sh).

---

## <center>7. I/O Redirection and Piping</center>

- **Redirection:** `>` (overwrite), `>>` (append), `<` (input)
- **Piping:** `|` passes output of one command to another

**Examples:**
```bash
echo "Hello" > file.txt
cat file.txt | grep "Hello"
```

See [`examples/io_redirection.sh`](examples/io_redirection.sh).

---

## <center>8. Arguments in Bash</center>

- `$0`: Script name
- `$1`, `$2`, ...: Positional arguments
- `$@`: All arguments
- `$#`: Number of arguments

**Example:**
```bash
#!/bin/bash
echo "First arg: $1"
echo "All args: $@"
```

See [`examples/arguments.sh`](examples/arguments.sh).

---

## <center>9. Exit Status</center>

- Every command returns an exit status (`0` = success, non-zero = error).
- Access with `$?`

**Example:**
```bash
ls /notfound
echo $?  # Non-zero (error)
```

---

## <center>10. If-Else Conditions</center>

**Syntax:**
```bash
if [ condition ]; then
  # commands
elif [ condition ]; then
  # commands
else
  # commands
fi
```

**Example:**
```bash
if [ $1 -gt 10 ]; then
  echo "Greater than 10"
else
  echo "10 or less"
fi
```

See [`examples/if_else.sh`](examples/if_else.sh).

---

## <center>11. While Loops</center>

**Syntax:**
```bash
while [ condition ]; do
  # commands
done
```

**Example:**
```bash
count=1
while [ $count -le 5 ]; do
  echo $count
  ((count++))
done
```

See [`examples/while_loops.sh`](examples/while_loops.sh).

---

## <center>12. For Loops</center>

**Syntax:**
```bash
for var in list; do
  # commands
done
```

**Example:**
```bash
for i in {1..5}; do
  echo $i
done
```

See [`examples/for_loops.sh`](examples/for_loops.sh).

---

## <center>13. Case Statements</center>

**Syntax:**
```bash
case $variable in
  pattern1) commands ;;
  pattern2) commands ;;
  *) default ;;
esac
```

**Example:**
```bash
read -p "Enter (y/n): " answer
case $answer in
  y|Y) echo "Yes" ;;
  n|N) echo "No" ;;
  *) echo "Invalid" ;;
esac
```

See [`examples/case_statements.sh`](examples/case_statements.sh).

---

## <center>14. Functions</center>

**Syntax:**
```bash
function_name() {
  # commands
}
```

**Example:**
```bash
greet() {
  echo "Hello, $1!"
}
greet "cyb3ritic"
```

See [`examples/functions.sh`](examples/functions.sh).

---

## <center>15. Colors in Bash</center>

Use ANSI escape codes for colored output.

**Example:**
```bash
echo -e "\e[31mRed Text\e[0m"
```

See [`examples/colors.sh`](examples/colors.sh).

---

## <center>16. Simple Projects</center>

- Calculator
- File renamer
- Backup script

See [`examples/`](examples/) for scripts.

---

## <center>17. Advanced Projects</center>

- Log analyzer
- Automated system updater
- Network scanner

---

## 🛠️ Best Practices

- Always use quotes around variables: `"$var"`
- Use `set -e` to exit on errors
- Use functions for reusable code
- Comment your scripts
- Test scripts with `bash -n script.sh` (syntax check)

---

## 📎 References

- [Bash Manual](https://www.gnu.org/software/bash/manual/bash.html)
- [ShellCheck](https://www.shellcheck.net/) (online linter)
- [Advanced Bash-Scripting Guide](https://tldp.org/LDP/abs/html/)

---

## 📂 Examples Directory

All code samples are available in the [`examples/`](examples/) folder:
- [`variables.sh`](examples/variables.sh)
- [`strings.sh`](examples/strings.sh)
- [`arrays.sh`](examples/arrays.sh)
- [`arithmetic.sh`](examples/arithmetic.sh)
- [`io_redirection.sh`](examples/io_redirection.sh)
- [`if_else.sh`](examples/if_else.sh)
- [`while_loops.sh`](examples/while_loops.sh)
- [`for_loops.sh`](examples/for_loops.sh)
- [`case_statements.sh`](examples/case_statements.sh)
- [`functions.sh`](examples/functions.sh)
- [`colors.sh`](examples/colors.sh)

---

## 🚀 Next Steps

- Practice with the example scripts
- Try building your own automation tools
- Explore more advanced Bash features (trap, subshells, associative arrays, etc.)

---

Happy scripting! 🚀