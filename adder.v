// Adder circuit

`define AND and #50
`define OR or #50
`define XOR xor #50
`define NOT not #50

module didOverflow
(
    output overflow,
    input a, 
    input b, 
    input s
);
	wire notA;
	wire notB;
	wire notS;
    wire aAndB;
    wire notaAndNotb;
    wire negToPos;
    wire posToNeg;

    `NOT aNot(notA, a);
    `NOT bNot(notB, b);
    `NOT sNot(notS, s);

    `AND andab(aAndB, a, b);
    `AND andabNot(notaAndNotb, notA, notB);

    `AND andSwitch1(negToPos, aAndB, notS);
    `AND andSwitch2(posToNeg, notaAndNotb, s);

    `OR orGate(overflow, negToPos, posToNeg);

endmodule

module structuralFullAdder
(
    output sum, 
    output carryout,
    input a, 
    input b, 
    input carryin
);
    wire andab, andbIn, andaIn;
    wire orab, orbIn;
    wire orOut;

    `AND andAB(andab, a, b);
    `AND andBIN(andbIn, b, carryin);
    `AND andAIN(andaIn, a, carryin);

    `OR or1(orOut, andab, andbIn);
    `OR or2(carryout, orOut, andaIn);


    `XOR xor1(orab, a, b);
    `XOR xor2(sum, orab, carryin); 
endmodule

module FullAdder4bit
(
  output[3:0] sum,  // 2's complement sum of a and b
  output carryout,  // Carry out of the summation of a and b
  output overflow,  // True if the calculation resulted in an overflow
  input[3:0] a,     // First operand in 2's complement format
  input[3:0] b      // Second operand in 2's complement format
);
	wire carry01;
	wire carry12;
	wire carry23;

	structuralFullAdder add0 (
	  .sum (sum[0]),
	  .carryout (carry01),
	  .a (a[0]),
	  .b (b[0]),
	  .carryin (1'b0)
	);
	structuralFullAdder add1 (
	  .sum (sum[1]),
	  .carryout (carry12),
	  .a (a[1]),
	  .b (b[1]),
	  .carryin (carry01)
	);
	structuralFullAdder add2 (
	  .sum (sum[2]),
	  .carryout (carry23),
	  .a (a[2]),
	  .b (b[2]),
	  .carryin (carry12)
	);
	structuralFullAdder add3 (
	  .sum (sum[3]),
	  .carryout (carryout),
	  .a (a[3]),
	  .b (b[3]),
	  .carryin (carry23)
	);
	didOverflow over1 (
	  .overflow (overflow),
	  .a (a[3]),
	  .b (b[3]),
	  .s (sum[3])
	);
endmodule
