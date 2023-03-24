module full_adder(a, b, cin, sum, cout);
input a, b, cin ;
output sum, cout;
wire w1, w2, w3;
xor g1(w1, a, b);
xor g2(sum, w1, cin);
and g3(w2, a, b);
and g4(w3, w1, cin);
or g5(cout, w2, w3);
endmodule


module add_sub_4bit(a, b, sum, cout, ctrl);
input [3:0] a, b;
input ctrl;
output [3:0] sum;
output cout;
wire [3:0] wb;
wire [2:0] carryw;

xor g1(wb[0], ctrl, b[0]);
xor g2(wb[1], ctrl, b[1]);
xor g3(wb[2], ctrl, b[2]);
xor g4(wb[3], ctrl, b[3]);

full_adder a0(a[0], wb[0], ctrl, sum[0], carryw[0]);
full_adder a1(a[1], wb[1], carryw[0], sum[1], carryw[1]);
full_adder a2(a[2], wb[2], carryw[1], sum[2], carryw[2]);
full_adder a3(a[3], wb[3], carryw[2], sum[3], cout);

endmodule

module add_sub_4bit_tb;
reg [3:0] a, b;
reg ctrl;
wire [3:0] sum;
wire cout;

add_sub_4bit i1(a, b, sum, cout, ctrl);

initial
begin
	a = 4'b0000;
	b = 4'b0000;
	ctrl = 1'b0;
	$monitor("Time:%0t ctrl=%b a=%4b b=%4b sum=%4b cout=%b", $time, ctrl, a, b, sum, cout);
	#5 a = 4'b0001; b=4'b0010; ctrl = 1'b1;
	#5 a = 4'b0111; b=4'b0001; ctrl = 1'b0;
	#5 a = 4'b1111; b=4'b0001; ctrl = 1'b1;
	#5 a = 4'b1001; b=4'b0001; ctrl = 1'b0;
end
endmodule