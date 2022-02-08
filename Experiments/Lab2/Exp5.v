module exp5(a,b,c,x);
input a, b, c;
output x;
wire w1, w2;

not n1(w1, a);
or o1(w2, b,c);
nand n2(x, w1, w2);

endmodule

module exp5_tb;

reg a, b, c;
wire x;

exp5 i(a, b, c, x);

initial
begin
	a = 1'b0;
	b = 1'b0;
	c = 1'b0;
	$monitor("Time:%0t a=%b b=%b, c=%b, x=%b",$time, a, b, c, x);
	#5 a= 1'b0; b=1'b0; c=1'b0;
	#5 a= 1'b0; b=1'b0; c=1'b1;
	#5 a= 1'b0; b=1'b1; c=1'b0;
	#5 a= 1'b0; b=1'b1; c=1'b1;
	#5 a= 1'b1; b=1'b0; c=1'b0;
	#5 a= 1'b1; b=1'b0; c=1'b1;
	#5 a= 1'b1; b=1'b1; c=1'b0;
	#5 a= 1'b1; b=1'b1; c=1'b1;
end
endmodule