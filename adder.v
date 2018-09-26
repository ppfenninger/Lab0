// Adder circuit
// sets gate delays
`define AND and #50
`define XOR xor #50
`define NOT not #50
`define OR or #50

module didOverflow
(
    output overflow,
    input a, 
    input b, 
    input s
); 
//this module determines if a signal overflows
// it requires the most significant bit of the two things being added together as well as the most significant bit of the sum
// this is only relevant when you are doing signed addition
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

    `AND andSwitch1(negToPos, aAndB, notS); //if the most significant bit of a and b were both 0 and the most significant big of the sum was 1, the inputs were both positive and the outpus was negative
    `AND andSwitch2(posToNeg, notaAndNotb, s); // this is the same as the above line but from positive to negative

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
// this is our full adder unit that can add two one bit numbers together
    wire xAorB;
    wire AandB;
    wire xAorBandCin;

    `XOR  xorgate(xAorB, a, b);  // OR gate produces AorB from A and B
    `XOR  xorgate1(sum, xAorB, carryin);
    `AND  andgate(AandB, a, b);
    `AND  andgate1(xAorBandCin, xAorB, carryin);
    `OR   orgate(carryout, AandB, xAorBandCin);
    
endmodule

module FullAdder4bit
(
  output[3:0] sum,  // 2's complement sum of a and b
  output carryout,  // Carry out of the summation of a and b
  output overflow,  // True if the calculation resulted in an overflow
  input[3:0] a,     // First operand in 2's complement format
  input[3:0] b      // Second operand in 2's complement format
);
	wire carry01; //these are the connecting carries between the full adders
	wire carry12; // ex: carry01 is the cary out from the 0th full adder and the carry in to the 1st full adder
	wire carry23;

	// we can just connect 4 full adders together to get a four bit adder

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
	// this part calculates the overflow seperately
	didOverflow over1 ( 
	  .overflow (overflow),
	  .a (a[3]),
	  .b (b[3]),
	  .s (sum[3])
	);
endmodule
