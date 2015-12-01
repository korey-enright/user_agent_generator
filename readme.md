# User Agent Generator

## Description

The User Agent Generator is a Command Line tool which will generate working user agent strings for use in the [User Agent Overrider by muzuiget](https://github.com/muzuiget/user_agent_overrider) extension in Firefox.
It will create user agent strings for Windows, Android, and iOS devices on Firefox, Chrome, and Safari

## Installation

Just unzip the file to any directory.

Make sure that Ruby is installed to your system.

Alternately, if ruby is installed, type 'gem install user_agent_generator'

## Usage

If you are using a Windows machine, you will need to open a Ruby command prompt in the same folder as the one you unzipped this tool into.

E.g., /Path_to_folder/user_agent_generator

Then, you can type ruby bin/user_agent_generator into the command line followed by several options

-w --windows This will generate a string assuming a Windows, 64-bit OS
-a --android This will generate a string assuming an Android operating system
-i --iOS     This will generate a string assuming an iPad is being used
-c --chrome  This will generate a string using Chrome
-f --firefox This will generate a string using Firefox
-s --safari  This will generate a string using Safari
-v --version This allows you to specify what version you are using
-h --help    This will print out a help prompt

Do not use more than one browser option, or more than one OS option.
The Version option is necessary.

