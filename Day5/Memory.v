module Memory (
  input wire clk,
  input wire write_enable,
  input wire [7:0] write_data,
  input wire [3:0] address,
  output reg [7:0] read_data
);
  
  reg [7:0] mem [15:0]; // 16-byte memory
  
  always @(posedge clk) begin
    if (write_enable) // Write operation
      mem[address] <= write_data;
    else // Read operation
      read_data <= mem[address];
  end

endmodule
