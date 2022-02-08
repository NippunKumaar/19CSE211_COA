module dff(D, clk, Q);

input D, clk;
output Q;
reg Q;

always @(posedge clk)
begin
	Q = D;
end

endmodule

module sipo(in, out, clk);
input in, clk;
output [3:0] out;

dff i1(in, clk, out[0]);
dff i2(out[0], clk, out[1]);
dff i3(out[1], clk, out[2]);
dff i4(out[2], clk, out[3]);

endmodule

module sipo_tb;
reg in, clk;
wire [3:0] out;

sipo i(in, out, clk);

always #5 clk = ~clk;

initial
begin
	in = 1'b0; clk = 1'b0;
	$monitor("Time:%f, in:%b, clk:%b, out:%4b",$time, in, clk, out);
	#10 in = 1'b1;
	#10 in = 1'b0;
	#10 in = 1'b1;
	#10 in = 1'b0;
	#60 $finish;
end

endmodule