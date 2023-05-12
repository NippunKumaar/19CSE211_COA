module read_reg(clk, rst, ra, rb, busa, busb);
input clk, rst;
input [3:0] ra, rb;
output reg [3:0] busa, busb;
reg [3:0] register_file [3:0];
integer i;
always @ (posedge clk)
begin
	if(rst==1)
	begin
		for (i = 0; i < 16; i = i + 1) 
		begin
			register_file[i] = 4'b0000; 	
		end
	end
end
always @ (negedge clk)
begin
	busa = register_file[ra];
	busb = register_file[rb];
end

endmodule

module read_reg_tb;
reg [3:0] ra, rb;
reg clk, rst;
wire [3:0] busa, busb;

read_reg t1(clk, rst, ra, rb, busa, busb);

always #5 clk = ~clk;

initial
begin
	clk = 1'b0; rst = 1'b1;
	$monitor("Time=%f, clk=%b, rst =%b, ra=%4b, rb=%4b busa=%4b, busb=%4b", $time, clk, rst, ra, rb, busa, busb);
	#10 rst = 1'b0; ra = 0; rb=1;
	#20 $finish;
end

endmodule
