module and_5in(in1, in2, in3, in4, in5, out);
input in1, in2, in3, in4, in5;
output out;

and a1(out, in1, in2, in3, in4, in5);

endmodule

module and1_tb;

reg in1, in2, in3, in4, in5;
wire out;

and_5in i(in1, in2, in3, in4, in5, out);

initial
begin
	in1=1'b0; in2=1'b0; in3=1'b0; in4=1'b0; in5=1'b0;
	$monitor("Time:%0t in=%b%b%b%b%b out=%b",$time, in1, in2, in3, in4, in5, out);
	#5 	in1=1'b0; in2=1'b0; in3=1'b0; in4=1'b0; in5=1'b0;
	#5 	in1=1'b0; in2=1'b0; in3=1'b1; in4=1'b0; in5=1'b1;
	#5	in1=1'b1; in2=1'b1; in3=1'b1; in4=1'b1; in5=1'b1;


end
endmodule