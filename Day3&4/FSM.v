// Code your design here
module FSM(input din, clk, rst,
                output dout);
  
  // Parameterized state values for ease
  parameter S0 = 0, S1 = 1, S2 = 2, S3 = 3, S4 = 4;
  
  // RState memory definition
  reg [2:0] state, next_state;
  
  // Next State Logic - combinational logic to compute the next state based on the current state and input value
  always @ (*) begin
    case (state)
      S0: next_state = din ? S1 : S0;
      S1: next_state = din ? S1 : S2;
      S2: next_state = din ? S3 : S0;
      S3: next_state = din ? S1 : S4;
     // S4: next_state = din ? S1 : S0; // This transition for non-overlaping sequence detector (If uncommented, comment the next line)
      S4: next_state = din ? S3 : S0; // This transition for overlaping sequence detector (If uncommented, comment the previous line)
      default: next_state = S0;
    endcase
  end
  
  // State Memory - Assign the computed next state to the state memory on the clock edge
  always @ (posedge clk) begin
    if (rst) state <= 3'b000;
    else state <= next_state;
  end
  
  // Output functional logic - The states for which the output should be '1'
  assign dout = (state == S4);
endmodule