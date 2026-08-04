# Contributions and Attribution

This document distinguishes the student's implementation work from components supplied by the EECS 31L course materials.

## Implemented or integrated by Kyle Tsai

- Main controller combinational logic and opcode decoding (`Controller.v`)
- ALU-controller Boolean equations derived from the supplied truth table (`ALUController.v`)
- Complete datapath module integration and signal routing (`Datapath.v`)
- Top-level processor integration (`processor.v`)
- 32-bit two-input multiplexer (`Mux.v`)
- Data-memory module (`DataMem.v`)
- Instruction-memory program updates used for integrated verification (`InstMem.v`)
- Integration, debugging, waveform inspection, and result validation in Xilinx Vivado

## Reused from the student's earlier course labs

- Program-counter flip-flop (`FlipFlop.v`)
- Register file (`RegFile.v`)
- Base instruction-memory module (`InstMem.v`)

## Supplied by course materials

- 32-bit ALU implementation (`ALU.v`)
- Immediate generator (`ImmGen.v`)
- Final automated processor testbench (`sim/tb_processor.v`)

The supplied components are retained here only to make the integrated design understandable and reproducible. Their inclusion does not imply original authorship.

