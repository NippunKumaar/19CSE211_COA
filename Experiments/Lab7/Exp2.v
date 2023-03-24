module logical_unit_4bit(input1, input2, out, ctrl);
input [3:0] input1, input2;
input [1:0] ctrl;
output [3:0] out;

assign out = ctrl[0]?(ctrl[1]?(input1 ^ input2): (input1 | input2)) : (ctrl[1]?(~input1): (input1 & input2));

endmodule

module logical_unit_4bit_tb;

reg [3:0] input1, input2;
reg [1:0] ctrl;
wire [3:0] out;

logical_unit_4bit i1(input1, input2, out, ctrl);

initial
begin
	input1 = 4'b0000;
	input2 = 4'b0000;
	ctrl = 2'b00;
	$monitor("Time:%0t ctrl=%b input1=%4b input2=%4b output=%4b", $time, ctrl, input1, input2, out);
	#5 input1 = 4'b1010; input2 = 4'b1010; ctrl = 2'b00;
	#5 input1 = 4'b0011; input2 = 4'b0111; ctrl = 2'b01;
	#5 input1 = 4'b0000;  ctrl = 2'b10;
	#5 input1 = 4'b1111; input2 = 4'b1111; ctrl = 2'b11;
end

endmodule

