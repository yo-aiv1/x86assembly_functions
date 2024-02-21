# x64 Assembly String Functions

## Description

This repository contains my implementation of various string manipulation functions from the `string.h` library, such as `strlen` for now and more coming soon, written in x64 assembly language. This repository aims to offer a resource for developers working on x64 assembly projects who require robust and optimized string manipulation functionality.

## Getting Started
First, clone the repository.

```bash
git clone https://github.com/yo-aiv1/x64assembly_functions
```

## Compilation
First, assemble the `*.asm` file.
```bash
nasm -f win64 <filename> -o <outputname>.o
```
Next, compile the `.c` file. Don't forget to pass the object file you obtained after assembling the `.asm` file.
```bash
gcc <testfilename>.c <objectfile>.o -o <outputname>.exe
```
After that, you will have your executable.
```bash
PS C:\test> ./<outputname>.exe
Test N1 passed     
        _strlen: 0 
        strlen: 0  
    ....
Test N7 passed
        _strlen: 46
        strlen: 46
```

## Project Ideas & Contributions

Pull requests are welcome. For any changes.

Please make sure to update tests as appropriate.

### Current Ideas

- [ ] Enhance the existing test suite to improve code coverage and test effectiveness without relying on any third-party libraries.
