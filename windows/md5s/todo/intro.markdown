# 1. Tools

## Vim

**The power tool for everyone**.

Vim is a highly configurable text editor built to enable efficient text  
editing. It is an improved version of the *vi* editor distributed with  
most UNIX systems. Vim is distributed free as chairtyware.

Vim has a scripting language that allows for plugin like extendsions to  
enable IDE behavior, syntax highlighting, colorization as well as other  
advanced features.

[Download from here.](http://www.vim.org/download.php)

## Markdown

Markdown is a lightweight markup language, allowing people "to wirte  
using an esay-to-read, easy-to-write plain text format, then covert  
it to structurally valid XHTML (or HTML)". The language takes many  
cues from existing conventions for marking up plain text in email.  
In other words, Markdown is a **text-to-HTML conversion tool**.

[Download and Introduction here.](http://daringfireball.net/projects/markdown/)

## S5

**Simple Standards-based Slide Show System** is a slide show format based  
entirely on XHTML, CSS, and JavaScript. With one file, you can run a  
complete slide show and have a printer-friendly version as well.  
Anyone with even a smidgen of familiarity with HTML or XHTML can look  
at the markup and figure out how to adapt it to their particular needs.  
Anyone familiar with CSS can create their own slide show theme. It's  
totally simple, and it's totally standards-driven.

[Download and intro here.](http://meyerweb.com/eric/tools/s5/)

## Git

Git is a distributed revision control and source code management system  
with an emphasis on speed. Git was initially designed and developed by  
*Linus Torvalds* for Linux kernel development; it has since been adopted  
by many other project. Even Git working directory is a full-fledged  
repository with complete history and full revision tracking capabilites,  
not dependent on network access or a central server. Git is free software  
distributed under the terms of GPL v2.

[Git for Windows](http://msysgit.github.com)

## Batch

Batch is the name given to a type of script file, a text file containing  
a series of commands to be executed by the command interpreter. The  
filename extension `.bat` was used in DOS, and the Windows 9x family of  
operating systems. The Microsoft Windows NT-family of operating systems  
and OS/2 added `.cmd`. Batch files for other environments may have  
different extensions, e.g. `.btm` in 4DOS and 4NT related shells.

# 2. 设计模式

设计模式之所以能够让程序更加灵活，易于修改和复用，这些都取决于面向对象的  
封装、继承以及多态。但是面向对象的编程并不是类越多越好，类的存在是为了封  
装，换句话说是为了抽象，那些具有相同属性和功能的对象的集合才要合并成类。

任何需求的变更都是需要成本的，设计模式只是有可能降低这个成本而已。

## 几个原则

+ 单一职责：只有一个原因会引起某个类的变化，当多于一个动机去改变这个类  
就说明这个类就多了一个职责。

+ 开放-封闭：面向对象的核心是软件实体是可以扩展而不可修改的。在设计时，  
要将最有可能发生变化的部分通过抽象隔离出去；面对新的需求时，对程序的改动  
应该是增加新的代码而不是修改现有代码；当然，不要漫无目的的抽象程序。

+ 依赖倒转：抽象不应该依赖细节，细节必须依赖抽象。要针对接口编程，而不是  
为了实现编程，此时语言并不重要，考虑的所有依赖关系都终止于抽象或接口。  
否则都是面向过程的编程。

+ 里氏代换：一个软件实体如果使用一个父类的话，那么一定适用其子类，而且无法  
发觉其区别。即子类必须弄够替换掉他们的父类，这种替换性是被扩展的基础。

+ 迪米特法则：如果两个类不必彼此直接通信，那么这两个类就不应该发生直接相互  
作用。如果需要调用其他类的方法，可通过第三者转发调用。也就是最少知识原则，  
每个类尽量降低成员的访问权限，根本思想是为了降低耦合，利于复用减少伤害。
