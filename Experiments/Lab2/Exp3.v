module and_bl(a, b, c);
input a, b;
output c;
reg c;

always@(a or b or c)
begin
	if(a==1'b1 && b==1'b1)
		c = 1'b1;
	else
		c = 1'b0;
end
endmodule

module and1_tb;

reg a, b;
wire c;

and_bl i(a, b, c);

initial
begin
	a=1'b0;
	b=1'b0;
	$monitor("Time:%0t a=%b b=%b c=%b",$time, a, b, c);
	#5 a=1'b0; b=1'b0;
	#5 a=1'b0; b=1'b1;
	#5 a=1'b1; b=1'b0;
	#5 a=1'b1; b=1'b1;
end
endmodule