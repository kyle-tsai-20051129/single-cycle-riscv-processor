`timescale 1ns / 1ps

//Module definition
module Mux(
    input S,
    input [31:0] D0,
    input [31:0] D1,
    output [31:0] Y);

    //Defining the MUX2:1 module behaviour
    assign Y = (S == 1'b0) ? D0 : D1;


endmodule//mux21
