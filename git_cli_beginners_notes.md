# Git command line 

## Configure Git user account

Run
- ```git config --global user.email "You@example.com"```
- ```git config --global user.name "Your Name"```

to set your account's default identity.
Omit --global to set the identity only in this repository.


## Create a new repository
Create with these steps:
- Create a new project directory
- open it
- type the command ```git init```

You created a new git repository.

## Add files to your project
Adding files to your project is not just drag and drop.

Besides moving files into your directory, you need to type some commands.

You can add files using the commands:

- ```git add <filename>```
- ```git add *```

This is the first step when working with git. To commit these changes use the command:
- ```git commit -m "Commit message"```


Now the file is committed, but it is not your remote repository yet.

Note:<i> You can always use ```git status``` command to check the current status of your project files.</i>

## Remote repository

### Online Git services
You can put your project online in a so called <strong>remote repository</strong>. By doing this, multiple people can work on the same project.

There are several free services available for this including [Github](https://github.com), [Gitlab](https://gitlab.com), and [Bitbucket](https://bitbucket.org). You may also choose to setup your own Git service using [Gogs](https://gogs.io)

### Putting your Project online

By typing the ```git commit``` command your changes are in your local working copy.

To connect to a remote repository:
- ```git remote add origin <server>```

To send to remote repository:
- ```git push origin master```

## Checkout online repository
### Work on online Git project
If you want to work on an existing Git project, you need to download it to your computer.

To download, you can use this command:
- ```git clone username@host:/past/to repository```

Popular Git services will give you the link of your Git repository.

### Work on Local Network Git project
If it's on a network drive, you can use the command:
- ```git clone /path/to/repository```

### check project history
You can check the complete project history and logs using the command 
- ```git log``` 

## Undo things
Sometimes people make mistakes. If you made a mistake but did't push it to the online git repository yet, you can undo with:
1) ```git commit --amend```

This may be like this:
1) ```git commit -m "Initial commit"```
2) ```git add forgotten_file```
3) ```git commit --amend```

If you already put your mistakes online in the remote git repository, you can roll back switching the project version bt you will loose all the changes. The command to switch project version is:
- ```git reset --hard <commitID>```

## What is branching?

Branches let you work on features isolated from each other. You can think of a branch as a copy of the entire project, but changes don't affect what the other programmers are doing.

The master branch is the default branch. Git lets you switch between branches and you can mix branches together (called merging).

Consider the scenario, where:
- <strong>master</strong> branch is the <strong>default branch</strong>
- a branch named "your work" is created
- a branch named "someone else's work" is created

The two people work on the branches individually and changes are <strong>merged</strong> into the master project.

### Commands
To see existing branches
- ```git branch```

To create a branch named feature_x
- ```git checkout -b feature_x```

To switch branch to the master branch
- ```git checkout master```

To delete a branch
- ```git branch -d feature_x```

To put your branch online
- ```git push origin <branch>```

To merge branch
- ```git merge <branch>```

## Sync project and Merge
If you use an online git repository, other people can make changes at the same time. To turn your git project into the latest version, run the command ```git pull```

If you work in a branch, you merge your changes with ```git merge <branch>```

## Git Tag

You can also add tag to your commits to make is easily identifiable by using the command ```git tag <tag> <commitID>```