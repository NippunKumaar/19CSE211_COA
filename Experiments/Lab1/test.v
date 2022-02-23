module test(A,B);
input A;
output B;
assign B=A;
endmodule

module Test_tb;
reg A;
wire B;
test T1(A,B);
initial
begin
A=1'b1;
$monitor("Time=%0t A=%b, B=%b",
$time,A, B);
#5 A=1'b0;
#5 A=1'b1;
end
endmodule