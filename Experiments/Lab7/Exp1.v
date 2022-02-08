
module tff(T, clk, Q, reset);

input T, clk, reset;
output Q;
reg Q;

always @(posedge clk)
begin
	if (reset)
		Q = 0;
	else begin
		if(T)
			Q = ~Q;
		else
			Q = Q;	
	end
	
end

endmodule

module a_counter_3(T, Q, clk, reset);

input [2:0] T;
input clk, reset;
output [2:0] Q;


tff i1(T[0], clk, Q[0], reset);
tff i2(T[1], ~Q[0], Q[1], reset);
tff i3(T[2], ~Q[1], Q[2], reset);

endmodule

module a_counter_3_tb;

reg [2:0] T;
reg clk, reset;
wire [2:0] Q;

a_counter_3 i1(T, Q, clk, reset);

always #5 clk = ~clk;

initial
begin
	T = 3'b000; reset = 1; clk = 1'b0;
	$monitor("Time=%f, T=%3b, clk=%b, Q=%3b reset=%b", $time, T, clk, Q, reset);
	#10 reset =0;
	#10 T=3'b111;
	#80 $finish;
end

endmodule