Most developers do the majority of their work via a text editor and the **command-line interface**. The command-line interface, command prompt, or terminal, allows access to all aspects of the operating system. It initially feels like a dated interface. However, knowing your way around the command-line is a necessary skill for efficient and rapid development.

This guide will provide a quick intro to the command-line. It is also a reference for common commands you will need to execute. Come back to this reference frequently for help.

## Open a Prompt

Launch the `Terminal` app (or `iTerm` if you have it installed) from your Applications folder. You can also launch applications OS X by pressing `Command + Space` and then typing the application name.

## Background

The command prompt allows the user to manage files and directories, perform queries, and launch applications. In graphical operating systems, like Windows or Mac OS X, you interact with the machine mainly using the mouse. With a command prompt, you type commands and hit the return key.

## Users and Paths

In this guide, we talk about users and paths. A user is you. To the command prompt, a user is an someone that logs in and enters commands.

To find out what your username is, type `whoami` in your terminal.

A path is an address within a file system. **Absolute paths** point to a definite place in a file system, regardless of the present working directory. **Relative paths** are shorter, based on the present working directory. Like homes have street addresses, a file system path provides us with a specific location for a given file.

## Manpages

We will start this guide by providing you with a tool to help you learn your *own* way around the command prompt. At Launch Academy, we frown (constructively) upon questions asked of an instructor before resources are consulted.

As in so many contexts, the documentation of a technology helps to answer most questions. The challenge is learning how to navigate those documents, when they have tough technical terms and symbols. The `man` (short for manual) command  is a source of documentation for many of the commands we will define here. You can use `man` by typing the following:

```no-highlight
man <name of command>
```

It will not always have the easiest information to understand, so work with it and see. Run `man` on `man` itself. Enter the following in your command prompt.

```no-highlight
man man
```

The result will be the following:

```no-highlight
NAME

man - format and display the on-line manual pages

SYNOPSIS

man [-acdfFhkKtwW] [--path] [-m system] [-p string] [-C config_file] [-M
pathlist] [-P pager] [-B browser] [-H htmlpager] [-S section_list] [section]
name ...

DESCRIPTION

man formats and displays the on-line manual pages.  If you specify section, man
only looks in that section of the manual.  name is normally  the  name  of the
manual  page,  which  is  typically the name of a command, function, or file.

[Continued...]
```

As you can see, using the `man` command can provide you with instant access to valuable information. The most important information for our purposes can be found in `SYNOPSIS` and `DESCRIPTION`, where we can find syntax and explanation, respectively.

To quit and return to the command-line, type `q`, which stands for *q*uit.

## Google

Google is another great place to enter a query and find the command you need, or else to take a command and see what it does, or how to use it. This is another important part of independently trying to find answers.

Search for:

```no-highlight
command-line how to move a file
```

You can prepend your search with the name of your shell interpreter or operating system convention:

```no-highlight
unix command-line how to move a file
```

The same thinking can be used to learn about a command you already know:

```no-highlight
unix command-line mv command
```

## Commonly Used Commands

The following list includes commonly used commands that a user types into the command prompt. We will (1) introduce you to the command, (2) provide the basic syntax in an example, and (3) describe the purpose.

### Basics

<table>
  <tr>
    <th>Command</th>
    <th>Syntax Example</th>
    <th>Description</th>
  </tr>
  <tr>
    <td><pre>ls</pre></td>
    <td><pre>ls</pre></td>
    <td>List directory contents.</td>
  </tr>
  <tr>
    <td><pre>mv</pre></td>
    <td>
      <pre>mv source target</pre>
      <pre>mv original_filename desired_filename</pre>
    </td>
    <td>Moves one or more files or directories from one place to another. Since
it can "move" files from one filename to another, it is also used to rename
files.</td>
  </tr>
  <tr>
    <td><pre>cp</pre></td>
    <td>
      <pre>cp source_file target_file</pre><br>
      <pre>cp source_file target_directory</pre>
      <pre>cp source_file_1 source_file_2 target_directory</pre>
      <pre>cp source_directory target_directory</pre>
    </td>
    <td>
      <ul>
        <li>When the program has two arguments of path names to files, the
program copies the contents of the first file to the second file, creating the
second file if necessary.</li>
        <li>When the program has one or more arguments of path names of files
and following those an argument of a path to a directory, then the program
copies each source file to the destination directory, creating any files not
already existing.</li>
        <li>When the program's arguments are the path names to two directories,
cp copies all files in the source directory to the destination directory,
creating any files or directories needed. This mode of operation requires an
additional option flag, typically r, to indicate the recursive copying of
directories. If the destination directory already exists, the source is copied
into the destination, while a new directory is created if the destination does
not exist.</li>
      </ul>
    </td>
  </tr>
  <tr>
    <td><pre>mkdir</pre></td>
    <td><pre>mkdir new_directory</pre></td>
    <td>Creates a new directory in the current directory.</td>
  </tr>
  <tr>
    <td><pre>cd</pre></td>
    <td><pre>cd directory_name</pre></td>
    <td>Changes the user's current directory location.</td>
  </tr>
  <tr>
    <td><pre>pwd</pre></td>
    <td><pre>pwd</pre></td>
    <td>Displays the absolute pathname of the current working directory.</td>
  </tr>
  <tr>
    <td><pre>rm</pre></td>
    <td><pre>rm filename</pre></td>
    <td>Removes file. Recommend to use 'rm -i' because it asks the user to
confirm.</td>
  </tr>
  <tr>
    <td><pre>.</pre></td>
    <td>
      <pre>mv directory/filename .</pre>
    </td>
    <td>Refers to the current working directory.</td>
  </tr>
  <tr>
    <td><pre>..</pre></td>
    <td>
      <pre>cd ..</pre><br>
      <pre>mv directory/filename ..</pre><br>
      <pre>ls ..</pre>
    </td>
    <td>Refers to the immediate parent directory</td>
  </tr>
  <tr>
    <td><pre>~</pre></td>
    <td>
      <pre>cd ~</pre><br>
      <pre>mkdir ~/Desktop/new-directory</pre>
    </td>
    <td>Refers to the user's root directory</td>
  </tr>
  <tr>
    <td><pre>/</pre></td>
    <td>
      <pre>cd /</pre>
    </td>
    <td>Refers to the system's root directory.</td>
  </tr>
  <tr>
    <td><pre>path/child_path</pre></td>
    <td>
      <pre>cd path/child_path</pre><br>
      <pre>mv smells/fragrances/roses .</pre><br>
    </td>
    <td><strong>Relative Path</strong> When you are targeting a directory
somewhere in your current working directory, you can assume the command prompt
interpreter knows your current location and refer to the path inside your
directory</td>
  </tr>
  <tr>
    <td><pre>/root/path</pre></td>
    <td>
      <pre>cd /root/path</pre><br>
      <pre>mv /root/path .</pre><br>
    </td>
    <td><strong>Absolute Path</strong> When you are targeting a directory
without reference to your current working directory, start your path with /.
That will find the root directory, so that you can find a precise path without
reference to your current working directory.</td>
  </tr>
  <tr>
    <td><pre>cat</pre></td>
    <td><pre>cat filename</pre></td>
    <td>The cat command will display the text in a file.</td>
  </tr>
  <tr>
    <td><pre>diff</pre></td>
    <td><pre>diff file_one file_two</pre></td>
    <td>The diff command will display the difference between two files.</td>
  </tr>
  <tr>
    <td><pre>date</pre></td>
    <td><pre>date</pre></td>
    <td>Prints the current date and time.</td>
  </tr>
  <tr>
    <td><pre>cal</pre></td>
    <td><pre>cal</pre></td>
    <td>Prints a calendar.</td>
  </tr>
  <tr>
    <td><pre>say</pre></td>
    <td><pre>say hello.txt</pre></td>
    <td>Uses text-to-speech to read a .txt file.</td>
  </tr>
  <tr>
    <td>↑ key</td>
    <td></td>
    <td>Finds the last command entered. If initial characters are typed and then ↑ is pressed, the last command starting with the initial characters will be
found.</td>
  </tr>
</table>

### Handy Tricks

* **Completion with `tab`** - When you start to type a directory name, you can hit
the `tab` key to let your command prompt to finish the name. Try using the `tab`
button in other contexts, as it can complete other names, too.
* **Change directory in ohmyzsh** - You do not always have to use `cd` when you are
trying to change directories in the command prompt. Rather than going to `cd
directory_name`, try typing `directory_name` directly and hitting return. This
will perform the same action.
* **iTerm session tabs** - You can have mutiple command prompt sessions open, tabbed
conveniently like browser tabs. Just use CMD + T to open a new tab. To have the
new tab reuse your current working directory, follow these steps in iTerm:

`Preferences > Profiles > Working Directory > Reuse previous session's
directory`

### Advanced

For the following commands, use `man` and Google to determine how they work and
how they can support your work on the command-line.

+ `|`
+ `telnet`
+ `curl`
+ `grep`
+ `echo`
+ `la | grep .txt`
+ `tar`
+ `head`
+ `tail`
+ `nano`

Check out one EE's notes on the [OS X Command Line](http://radavis.github.io/2014/11/25/using-the-osx-command-line.html)
