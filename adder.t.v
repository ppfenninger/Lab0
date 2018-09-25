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

        $display("  A    B   | Sum  | Cout | Overflow |   ExSum  | ExCout | ExOverflow");
        a=4'b0001;b=4'b0000; #1000
        $display(" %b%b%b%b %b%b%b%b | %b%b%b%b |  %b   |     %b    |   0001   |    0   |     0", a[3], a[2], a[1], a[0] , b[3], b[2], b[1], b[0], sum[3], sum[2], sum[1], sum[0], carryout, overflow);
        a=4'b0000;b=4'b1100; #1000
        $display(" %b%b%b%b %b%b%b%b | %b%b%b%b |  %b   |     %b    |   1100   |    0   |     0", a[3], a[2], a[1], a[0] , b[3], b[2], b[1], b[0], sum[3], sum[2], sum[1], sum[0], carryout, overflow);
        a=4'b0111;b=4'b0111; #1000
        $display(" %b%b%b%b %b%b%b%b | %b%b%b%b |  %b   |     %b    |   1110   |    0   |     1", a[3], a[2], a[1], a[0] , b[3], b[2], b[1], b[0], sum[3], sum[2], sum[1], sum[0], carryout, overflow);
        a=4'b1000;b=4'b1000; #1000
        $display(" %b%b%b%b %b%b%b%b | %b%b%b%b |  %b   |     %b    |   0000   |    1   |     1", a[3], a[2], a[1], a[0] , b[3], b[2], b[1], b[0], sum[3], sum[2], sum[1], sum[0], carryout, overflow);
        a=4'b1111;b=4'b0111; #1000
        $display(" %b%b%b%b %b%b%b%b | %b%b%b%b |  %b   |     %b    |   0110   |    1   |     0", a[3], a[2], a[1], a[0] , b[3], b[2], b[1], b[0], sum[3], sum[2], sum[1], sum[0], carryout, overflow);
        a=4'b0011;b=4'b1101; #1000
        $display(" %b%b%b%b %b%b%b%b | %b%b%b%b |  %b   |     %b    |   0000   |    1   |     0", a[3], a[2], a[1], a[0] , b[3], b[2], b[1], b[0], sum[3], sum[2], sum[1], sum[0], carryout, overflow);
        a=4'b1111;b=4'b1111; #1000
        $display(" %b%b%b%b %b%b%b%b | %b%b%b%b |  %b   |     %b    |   1110   |    1   |     0", a[3], a[2], a[1], a[0] , b[3], b[2], b[1], b[0], sum[3], sum[2], sum[1], sum[0], carryout, overflow);
        a=4'b0001;b=4'b0001; #1000
        $display(" %b%b%b%b %b%b%b%b | %b%b%b%b |  %b   |     %b    |   0010   |    0   |     0", a[3], a[2], a[1], a[0] , b[3], b[2], b[1], b[0], sum[3], sum[2], sum[1], sum[0], carryout, overflow);
        a=4'b0010;b=4'b0001; #1000
        $display(" %b%b%b%b %b%b%b%b | %b%b%b%b |  %b   |     %b    |   0011   |    0   |     0", a[3], a[2], a[1], a[0] , b[3], b[2], b[1], b[0], sum[3], sum[2], sum[1], sum[0], carryout, overflow);
        a=4'b0100;b=4'b0101; #1000
        $display(" %b%b%b%b %b%b%b%b | %b%b%b%b |  %b   |     %b    |   1001   |    0   |     1", a[3], a[2], a[1], a[0] , b[3], b[2], b[1], b[0], sum[3], sum[2], sum[1], sum[0], carryout, overflow);
        a=4'b1110;b=4'b1101; #1000
        $display(" %b%b%b%b %b%b%b%b | %b%b%b%b |  %b   |     %b    |   1011   |    1   |     0", a[3], a[2], a[1], a[0] , b[3], b[2], b[1], b[0], sum[3], sum[2], sum[1], sum[0], carryout, overflow);
        a=4'b1001;b=4'b1000; #1000
        $display(" %b%b%b%b %b%b%b%b | %b%b%b%b |  %b   |     %b    |   0001   |    1   |     1", a[3], a[2], a[1], a[0] , b[3], b[2], b[1], b[0], sum[3], sum[2], sum[1], sum[0], carryout, overflow);
        a=4'b1011;b=4'b1010; #1000
        $display(" %b%b%b%b %b%b%b%b | %b%b%b%b |  %b   |     %b    |   0001   |    1   |     1", a[3], a[2], a[1], a[0] , b[3], b[2], b[1], b[0], sum[3], sum[2], sum[1], sum[0], carryout, overflow);
        a=4'b1101;b=4'b0111; #1000
        $display(" %b%b%b%b %b%b%b%b | %b%b%b%b |  %b   |     %b    |   0100   |    1   |     0", a[3], a[2], a[1], a[0] , b[3], b[2], b[1], b[0], sum[3], sum[2], sum[1], sum[0], carryout, overflow);
        a=4'b0001;b=4'b1100; #1000
        $display(" %b%b%b%b %b%b%b%b | %b%b%b%b |  %b   |     %b    |   1101   |    0   |     0", a[3], a[2], a[1], a[0] , b[3], b[2], b[1], b[0], sum[3], sum[2], sum[1], sum[0], carryout, overflow);
        a=4'b0010;b=4'b1010; #1000
        $display(" %b%b%b%b %b%b%b%b | %b%b%b%b |  %b   |     %b    |   1100   |    0   |     0", a[3], a[2], a[1], a[0] , b[3], b[2], b[1], b[0], sum[3], sum[2], sum[1], sum[0], carryout, overflow);

    end
endmodule