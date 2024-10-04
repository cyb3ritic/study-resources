# 🎢 Path Traversal Vulnerability 🎢

- Also known as *directory traversal* or *Local File Inclusion (LFI)*, this vulnerability lets attackers explore and read files (or sometimes even write!) on a target server, like an unauthorized treasure hunt 🏴‍☠️.

## 🕵️‍♀️ Methodology: Becoming a File Detective 🕵️‍♂️

To find path traversal vulnerabilities, you need to *scavenge* the application like a detective, checking every nook and cranny that accepts user input. Here’s your checklist:

- **Check out every user input point**: All the places where users can send data to the server — this includes:
  - HTTP GET and POST requests
  - File upload forms 📂
  - HTML forms

Here are some suspicious **red flags** you might find along the way:

- Are there parameters that seem to handle files or directories?
  - Example: `http://example.com/getUserProfile.jsp?item=ikki.html`
- Are there **funky file extensions**?
- Do you notice any **odd variable names** that make you go, “Hmm...?” 🤔
  - Example: `http://example.com/index.php?file=content`
  - Example: `http://example.com/main.cgi?home=index.html`
  
- Can you identify any **cookies** used by the application for dynamic page generation?
  - Example: `Cookie: ID=d9ccd3f4f9f18cc1:TM=2166255468:LM=1162655568:S=3cFpqbJgMSSPKVMV:TEMPLATE=flower`
  - Example: `Cookie: USER=1826cc8f:PSTYLE=GreenDotRed`

## 🚪 Simple Path Traversal Case

Just like taking a shortcut, the attacker uses traversal sequences to move up directories. Classic moves:

- `/etc/passwd`
- `../../../../etc/passwd` (More dots, more folders!)

## 🛤️ Path Traversal with Absolute Path Bypass

- Sometimes the app blocks traversal sequences but treats the filename as relative to a default working directory.
- Just throw in an **absolute path** like `/etc/passwd` or `/etc/hosts` to skip the hassle!

## 🎭 Path Traversal with Stripped Sequences (Non-Recursive)

Some apps try to play it smart by stripping traversal sequences (`../`). But you can still outsmart them! 

Use **nested traversal sequences** like:

- `....//....//....//etc/passwd`

Even if the app strips out `../`, you'll still get to your target file like a sneaky ninja 🥷.

- If the app also decodes URLs before using them, try **URL encoding**:
  - `.` → `%2e`
  - `/` → `%2f`
  - `%` → `%25`

## 🧙 Path Traversal with Null Byte Bypass

- Some servers only allow files with certain extensions, like `.png`. 
- Bypass this restriction by using a **null byte** (`%00`). It tells the server: “This is the end of the file name!” But you can trick the server with:
  
  `../../../etc/passwd%00.png`

This fools the server into thinking the file ends in `.png`, while secretly you're grabbing `/etc/passwd`!

Combine techniques for even more fun, like:

`....//....//....//etc/passwd%00.png`

> **🔧 Pro Tip:** To fuzz for path traversal vulnerabilities, use the tool `dotdotpwn`.

Happy hacking! 🕵️‍♂️🎉
