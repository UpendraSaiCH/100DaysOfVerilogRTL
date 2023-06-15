module BinaryCounter_tb;
	reg clk;
	reg reset;
	reg enable;
	wire [3:0] count;
	
	
	BinaryCounter dut(.clk(clk),.reset(reset),.enable(enable),.count(count));
	
	always #5 clk = ~clk;
	
	initial begin 
		clk = 0;
		reset = 1;
		enable = 0;
		
		#10 reset = 0;
		
		#10 enable = 1;
		
		#20 ;
		$display("Counter value : %b ", count);
		
		#20 ;
		$display("Counter value : %b ", count);
		
		$finish;
		
	end
	
endmodule
		