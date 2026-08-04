`timescale 1ns / 1ps
// Module definition
module DataMem ( MemRead , MemWrite , addr , write_data , read_data );
// Define I / O ports
input MemRead;
input MemWrite;
input [8:0] addr;
input [31:0] write_data;
output reg [31:0] read_data;

reg [31:0] memory [0:127];
// Describe data_mem behavior

always @(*)
begin
    if (MemRead)
        read_data = memory[addr[8:2]];
    else
        read_data = 32'b0;
    if (MemWrite)
        memory[addr[8:2]] = write_data;
end

endmodule // data_mem