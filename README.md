# Single-Cycle RISC-V-Style Processor

A 32-bit single-cycle processor implemented in Verilog as an digital-design project. The design integrates the processor datapath and control path required to execute a custom 13-instruction RISC-V-style subset.

## Highlights

- 32-bit datapath and arithmetic logic
- 8-bit program counter with sequential `PC + 4` instruction flow
- 32 x 32-bit register file
- 64 x 32-bit instruction memory
- 128 x 32-bit data memory
- Main controller and derived ALU-control logic
- R-type, I-type, load, and store execution paths
- Automated end-to-end verification of a 20-instruction program
- 20/20 expected-result checks passed in Xilinx Vivado simulation

## Supported operations

| Category | Operations |
| --- | --- |
| Register-register | `ADD`, `SUB`, `AND`, `OR`, `NOR`, `SLT` |
| Immediate | `ADDI`, `ANDI`, `ORI`, `NORI`, `SLTI` |
| Memory | `LW`, `SW` |

## Architecture

The main controller decodes the instruction opcode into register-write, memory, operand-selection, and ALU-operation signals. The ALU controller combines the main controller's `ALUOp` with `funct3` and `funct7` to choose the final ALU operation.

## Repository structure

```text
rtl/                 Processor RTL modules
sim/tb_processor.v   Automated course-provided verification testbench
docs/CONTRIBUTIONS.md
                      Authorship and supplied-component disclosure
```

## Simulation

The original project was verified in Xilinx Vivado. To run the included testbench in Vivado:

1. Create an RTL project and add every file in `rtl/` as a design source.
2. Add `sim/tb_processor.v` as a simulation source.
3. Set `tb_processor` as the simulation top.
4. Run behavioral simulation for at least 430 ns.
5. Confirm the console reports `The number of correct test cases is: 20`.

An open-source simulator can also be used when Icarus Verilog is installed:

```sh
mkdir -p build
iverilog -g2012 -o build/processor_sim rtl/*.v sim/tb_processor.v
vvp build/processor_sim
```

## Verification result

The final integrated simulation executed 20 instructions and passed all 20 automated expected-result checks. The sequence exercises the supported arithmetic, logical, immediate, load, and store paths.

## Academic and attribution note

This repository presents a completed Spring 2025 course project. Some starter components were supplied by the course and are identified in [docs/CONTRIBUTIONS.md](docs/CONTRIBUTIONS.md). The original report, assignment handouts, grading metadata, and personal submission information are intentionally excluded.

Before making this repository public, confirm that public sharing is permitted by the course's academic-integrity policy.

