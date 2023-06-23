module ALU_4bit (
  input wire [3:0] operand1,
  input wire [3:0] operand2,
  input wire [3:0] control,
  output reg [3:0] result,
  output reg zero
);

  always @* begin
    case (control)
      4'b0000: result = operand1 + operand2; // Addition
      4'b0001: result = operand1 - operand2; // Subtraction
      4'b0010: result = operand1 & operand2; // Bitwise AND
      4'b0011: result = operand1 | operand2; // Bitwise OR
      4'b0100: result = operand1 ^ operand2; // Bitwise XOR
      4'b0101: result = operand1 << 1;       // Left shift operand1 by 1 bit
      4'b0110: result = operand1 >> 1;       // Right shift operand1 by 1 bit
      4'b0111: result = ~operand1;           // Bitwise NOT of operand1
      4'b1000: result = operand1;            // Operand1 unchanged
      4'b1001: result = operand2;            // Operand2 unchanged
      4'b1010: result = operand1 + 1;        // Increment operand1 by 1
      4'b1011: result = operand1 - 1;        // Decrement operand1 by 1
      4'b1100: result = operand1 + operand2; // Addition (same as 0000)
      4'b1101: result = operand1 - operand2; // Subtraction (same as 0001)
      4'b1110: result = operand1;            // Operand1 unchanged (same as 1000)
      4'b1111: result = operand2;            // Operand2 unchanged (same as 1001)
      default: result = 4'b0000;              // Default output (all zeros)
    endcase
    
    zero = (result == 4'b0000); // Set zero flag if result is zero
  end
  
endmodule
