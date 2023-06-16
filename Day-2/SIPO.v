module DFlipFlop(
	input clk,reset,d,
	output reg q);
	
	always @(posedge clk or posedge reset)
	begin
	if(reset)
		q <= 	1'b0;
	else
		q <=  d;
	end
endmodule

module SIPO(input clk,reset,serial_in,output wire [3:0] parallel_out);
	wire [3:0] q;
	
	DFlipFlop ff0(.clk(clk),.reset(reset),.d(serial_in),.q(q[0]));
	DFlipFlop ff1(.clk(clk),.reset(reset),.d(q[0]),.q(q[1]));
	DFlipFlop ff2(.clk(clk),.reset(reset),.d(q[1]),.q(q[2]));
	DFlipFlop ff3(.clk(clk),.reset(reset),.d(q[2]),.q(q[3]));
	
	assign parallel_out = q ;

endmodule
	
	