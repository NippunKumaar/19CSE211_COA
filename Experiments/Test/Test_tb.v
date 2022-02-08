'include "Test.v"

module Test_tb;

reg A;
wire B;

Test T1(A,B)

initial 
begin
A=1 #10
$monitor($time, "A=%b, B=%b"A, B);
end