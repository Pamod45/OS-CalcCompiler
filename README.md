# OS-CalcCompiler

**OS-CalcCompiler** is a compiler project designed for a basic calculator that performs arithmetic expressions with BODMAS rules and variable assignments. Built using Lex and YACC, this project demonstrates core principles of compiler design, including lexical analysis and syntax parsing, within an operating system context.

---

## 📝 Project Overview

**OS-CalcCompiler** provides a command-line calculator that:
- Follows the **BODMAS** rule (Brackets, Order, Division/Multiplication, Addition/Subtraction) to handle operation precedence.
- Supports essential arithmetic operations: `+`, `-`, `*`, `/`, `%`, and `^` (exponentiation).
- Allows **variable assignments** with single-character identifiers (up to 52 variables).
- Implements basic commands like `print` and `exit` for user convenience.
- Handles **errors** gracefully, displaying messages for invalid tokens or syntax errors.

---

## 🚀 Features

- **BODMAS Compliance**: Operations follow the correct precedence, including support for bracketed expressions.
- **Variable Support**: Up to 52 variables are supported, identified by single letters (`a-z` and `A-Z`).
- **User Commands**: 
  - `print` - Outputs the result of an expression.
  - `exit` - Ends the program.
- **Error Handling**: Detects and reports errors for:
  - Invalid tokens
  - Syntax mistakes, such as missing operators or incorrect expressions

---

## 🔧 Technology Stack

- **Tools**: Lex (Lexical Analyzer) and YACC (Yet Another Compiler Compiler)
- **Programming Language**: C (for integrating Lex and YACC functionality)


## 🖥️ Installation Guide

### 📋 Prerequisites

Before you begin, ensure you have met the following requirements:

- **Operating System**: Linux or macOS (Lex and YACC are typically available by default on these systems)
- **Lex and YACC**: Ensure Lex (or Flex) and YACC (or Bison) are installed.
  - **Install Flex and Bison on Ubuntu/Debian**:
    ```bash
    sudo apt-get update
    sudo apt-get install flex bison
    ```
  - **Install Flex and Bison on macOS** (using Homebrew):
    ```bash
    brew install flex bison
    ```
- **C Compiler**: GCC is recommended.
  - **Install GCC on Ubuntu/Debian**:
    ```bash
    sudo apt-get install build-essential
    ```
  - **Install GCC on macOS**:
    ```bash
    brew install gcc
    ```

### 📥 Download and Setup

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/yourusername/OS-CalcCompiler.git
   cd OS-CalcCompiler
2. **Run the following commands to generate lex.yy.c, y.tab.c, and y.tab.h from the source files:**:
   ```bash
   yacc -d src/cal.y         # Generates y.tab.c and y.tab.h
   lex src/cal.l             # Generates lex.yy.c
3. **Compile the Program**:
   ```bash
   gcc y.tab.c lex.yy.c -o calc -lm
4. **Run the program**
   ```bash
   ./calc

# 🙏 Thank You

Thank you for taking the time to read through the documentation! Your interest and feedback are greatly appreciated.
