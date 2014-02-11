CommandLineKit
==============

Framework for building sane command line tools in Cocoa.

Installation
---------------
From the command line:

`git clone --recursive https://github.com/jawngee/CommandLineKit.git`

Creating a Command Line App
------------------------------------------

- Create a new Command Line Tool in Xcode
- Drag the CommandLineKit.xcodeproj to your new project
- In build phases:
  - In target dependencies add 'CommandLineKit'
  - In link phase, add 'libCommandLineKit.a'
- In build settings:
  - In other linker flags, add -ObjC
  - In header search path, add the path to CommandLineKit source

View the *HelloWorld* sample application for details on how to create your command line application.

Special Thanks
--------------
Special thanks to [NSError](https://github.com/NSError) for his awesome [ArgumentParser](https://github.com/NSError/ArgumentParser) library.

No CocoaPods?
-------------
I don't use CocoaPods for a lot of different reasons, mostly because I almost always end up forking and changing the libraries I'm using.  I'm also not afraid of git submodules.  

If someone wants to add this to CocoaPods, I will gladly accept your pull request though.  :)

