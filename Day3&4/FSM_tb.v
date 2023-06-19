module FSM_tb;
  reg clk, rst;
  reg data;
 // reg inp;
  wire outp;
  
  FSM dut (.clk(clk), .rst(rst), .din(data), .dout(outp));
  
  always #5 clk = ~clk;
  
  initial begin
    clk = 0;
    rst = 1;
    //sequence = 8'b10101001;
    data = 0;
    
    #5 rst = 0;
    
    #10 data = 1;
    #10 data = 0;
    #10 data = 1;
    #10 data = 0;
    #10 data = 1;
	 #10 data = 0;
    #10 data = 1;
    #10 data = 1;
    #10 data = 0;
    #10 data = 1;
 
    
    #5 $finish;
  end
endmodule
