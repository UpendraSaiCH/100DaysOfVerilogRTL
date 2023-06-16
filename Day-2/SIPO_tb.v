module SIPO_tb;

	reg clk;
	reg reset;
	reg serial_in;
	wire [3:0] parallel_out;
	
	SIPO dut(.clk(clk),.reset(reset),.serial_in(serial_in),.parallel_out(parallel_out));
	
	always begin
	clk =0;
	#5;
	clk =1;
	#5;
	end
	
	initial begin
		reset = 1;
		serial_in = 0;
		 
		#10;
		reset = 0;
		serial_in = 1;
		#10;
		serial_in = 0;
		#10;
		serial_in = 1;
		#10;
		serial_in = 0;
		#10;
		serial_in = 1;
		#10;
		
		$finish;
	end
	
	always @(posedge clk)begin
	 $display("Paralll Output : %b",parallel_out);
	end

endmodule	
	