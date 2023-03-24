`include "Exp1.v"
`include "Exp2.v"

module ALU_4bit(ALU_Ctrl, operand1, operand2, out);
input [3:0] operand1, operand2;
input [2:0] ALU_Ctrl;
output [3:0] out;
wire [3:0] arithmetic_out, logical_out;
wire cout;
reg [3:0] out;

add_sub_4bit arithmetic(operand1, operand2, arithmetic_out, cout, ALU_Ctrl[2]);
logical_unit_4bit logical(operand1, operand2, logical_out, ALU_Ctrl[1:0]);

always @(1'b1)
begin
	
end

endmodule