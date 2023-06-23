module ALU_4bit_TB;

  reg [3:0] operand1;
  reg [3:0] operand2;
  reg [3:0] control;
  wire [3:0] result;
  wire zero;

  // Instantiate the ALU_4bit module
  ALU_4bit dut (
    .operand1(operand1),
    .operand2(operand2),
    .control(control),
    .result(result),
    .zero(zero)
  );

  // Stimulus
  initial begin
    operand1 = 4'b1010;
    operand2 = 4'b1100;
    control = 4'b0000; // Addition

    #10;
    
    control = 4'b0001; // Subtraction

    #10;
    
    control = 4'b0010; // Bitwise AND

    #10;
    
    control = 4'b0011; // Bitwise OR

    #10;
    
    control = 4'b0100; // Bitwise XOR

    #10;
    
    control = 4'b0101; // Left shift operand1 by 1 bit

    #10;
    
    control = 4'b0110; // Right shift operand1 by 1 bit

    #10;
    
    control = 4'b0111; // Bitwise NOT of operand1

    #10;
    
    control = 4'b1000; // Operand1 unchanged

    #10;
    
    control = 4'b1001; // Operand2 unchanged

    #10;
    
    control = 4'b1010; // Increment operand1 by 1

    #10;
    
    control = 4'b1011; // Decrement operand1 by 1

    #10;
    
    control = 4'b1100; // Addition (same as 0000)

    #10;
    
    control = 4'b1101; // Subtraction (same as 0001)

    #10;
    
    control = 4'b1110; // Operand1 unchanged (same as 1000)

    #10;
    
    control = 4'b1111; // Operand2 unchanged (same as 1001)

    #10;

    $finish; // End the simulation
  end

  // Display the results
  always @(result, zero) begin
    $display("Operand1: %b, Operand2: %b, Control: %b", operand1, operand2, control);
    $display("Result: %b, Zero: %b", result, zero);
    $display("");
  end

endmodule
