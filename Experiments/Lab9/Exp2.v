module read_mem(clk, rst, addr, dataout);
input clk, rst;
input [5:0] addr;
output reg [3:0] dataout;
reg [3:0] memory [63:0];
integer i;
always @ (posedge clk)
begin
	if(rst==1)
	begin
		for (i = 0; i < 64; i = i + 1) 
		begin
			memory[i] = 4'b0000; 	
		end
	end
end
always @ (posedge clk)
begin
	dataout = memory[addr];
end

endmodule

module read_reg_tb;
reg [5:0] addr;
reg clk, rst;
wire [3:0] dataout;

read_mem t1(clk, rst, addr, dataout);

always #5 clk = ~clk;

initial
begin
	clk = 1'b0; rst = 1'b1;
	$monitor("Time=%f, clk=%b, rst =%b, addr=%6b, dataout=%4b", $time, clk, rst, addr, dataout);
	#10 rst = 1'b0; addr = 0;
	#20 $finish;
end

endmodule
