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

