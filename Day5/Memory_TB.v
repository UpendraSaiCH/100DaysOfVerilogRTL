module Memory_TB;
  
  reg clk;
  reg write_enable;
  reg [7:0] write_data;
  reg [3:0] address;
  wire [7:0] read_data;
  
  // Instantiate the Memory module
  Memory dut (
    .clk(clk),
    .write_enable(write_enable),
    .write_data(write_data),
    .address(address),
    .read_data(read_data)
  );
  
  // Clock generation
  always begin
    #5 clk = ~clk; // Toggle the clock every 5 time units
  end
  
  // Stimulus
  initial begin
    clk = 0;
    write_enable = 1;
    write_data = 8'b10101010;
    address = 4'b0000;
    
    #10;
    
    write_enable = 0;
    address = 4'b0001;
    
    #10;
    
    write_enable = 1;
    write_data = 8'b11001100;
    address = 4'b0001;
    
    #10;
    
    write_enable = 0;
    address = 4'b0000;
    
    #10;
    
    $finish; // End the simulation
  end

  // Display read data
  always @(read_data) begin
    $display("Read Data: %b", read_data);
  end

endmodule
