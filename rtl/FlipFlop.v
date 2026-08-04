` timescale 1 ns / 1 ps
// Module definition
module FlipFlop (clk, reset, d, q );
// Define input and output signals
input clk;
input reset;
input [7:0] d;
output reg [7:0] q;

// Define the D Flip flop module 's behaviour
//change output when rising edge of clk
always @(posedge clk)
begin
    //if reset is 1 set output to 0
    if(reset == 1'b1)
        q <= 8'b0;
    //else output is equal the value of input d
    else
        q <= d;
end

endmodule // FlipFlop