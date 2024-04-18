
---
# ALU Module in Verilog

This project implements an Arithmetic Logic Unit (ALU) module in Verilog. The ALU can perform various arithmetic and logical operations based on the given opcode.

## Overview

The ALU module supports the following operations:
- Addition
- Subtraction
- Multiplication
- Division
- Shift Left
- Shift Right
- XOR
- XNOR
- NOT
- AND
- OR
- Booth Multiplication
- Non-Restoring Division

Each operation is implemented as a separate module within the project.

## Modules

The project consists of the following Verilog modules:

- `FullAdder`: Implements a full adder module used for addition operations.
- `ADD`: Performs addition of two signed 16-bit numbers.
- `SUB`: Performs subtraction of two signed 16-bit numbers.
- `MUL`: Performs multiplication of two signed 16-bit numbers.
- `BOOTH_4`: Implements Booth's algorithm for multiplication.
- `DIV`: Performs division of two signed 16-bit numbers.
- `non_rest_div`: Implements non-restoring division algorithm.
- `SHIFT_LEFT`: Shifts a signed 16-bit number to the left by a specified number of bits.
- `SHIFT_RIGHT`: Shifts a signed 16-bit number to the right by a specified number of bits.
- `XOR`: Performs bitwise XOR operation on two signed 16-bit numbers.
- `XNOR`: Performs bitwise XNOR operation on two signed 16-bit numbers.
- `NOT`: Performs bitwise NOT operation on a signed 16-bit number.
- `AND`: Performs bitwise AND operation on two signed 16-bit numbers.
- `OR`: Performs bitwise OR operation on two signed 16-bit numbers.
- `ALU16`: The main ALU module that integrates all the operations based on the opcode.

## Usage

To use the ALU module in your Verilog project, follow these steps:
1. Instantiate the `ALU16` module in your Verilog code.
2. Connect the inputs (`A`, `B`, `op`, `clk`, `reset`) and outputs (`out`, `overflow`, `zero`) as required.
3. Set the `op` input to specify the desired operation (opcode).

Example instantiation:
```verilog
ALU16 alu_inst (
  .A(A),
  .B(B),
  .op(opcode),
  .out(result),
  .overflow(overflow_flag),
  .zero(zero_flag),
  .clk(clk),
  .reset(reset)
);
```

## Contributors

- Bizoi Fabian-Mario
- Blaga Cristian-Marian
- Ioana..


---
