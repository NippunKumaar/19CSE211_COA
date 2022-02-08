module test1(A, B);
input A;
output B;

assign B = !A;

endmodule

module test1_tb;
reg A;
wire B;

test1 T1(A, B);
initial
begin
	A=1'b0;
	$monitor("Time=%0t, A=%b, B=%b",$time, A, B);
	#5 A=1'b1;
	#10 A=1'b0;
	#15 $finish;

end
endmodule