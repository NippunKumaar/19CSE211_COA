module Not(A, B);
input A;
output B;
assign B = !A;
endmodule

module Not_tb;
reg A;
wire B;
Not n1(A,B);
initial
begin
A = 1'b0;
$monitor("Time=%0t Input A=%b, Output B=%b",$time, A, B);
#1 A=1'b1;
#1 A=1'b0;
end
endmodule