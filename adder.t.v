// Adder testbench
`timescale 1 ns / 1 ps
`include "adder.v"

module testFullAdder();
    reg[3:0] a;
    reg[3:0] b;
    wire[3:0] sum;
    wire carryout;
    wire overflow;

    //behavioralFullAdder adder (sum, carryout, a, b, carryin);
    FullAdder4bit adder (sum, carryout, overflow, a, b);

    initial begin

    	$dumpfile("adder.vcd");
    	$dumpvars(0,adder);

        $display("  A    B   | Sum  | Cout | Overflow | ExSum | ExCout | ExOverflow");
        a=4'b0111;b=4'b0001; #1000
        $display(" %b%b%b%b %b%b%b%b | %b%b%b%b |  %b   |     %b    |   0   |    0   |     0", a[3], a[2], a[1], a[0] , b[3], b[2], b[1], b[0], sum[3], sum[2], sum[1], sum[0], carryout, overflow);
    end
endmodule
