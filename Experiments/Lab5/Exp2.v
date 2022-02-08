module encoder4to2_dl(i, y);

input [3:0] i;
output [1:0] y;

assign y[0] = i[1]|i[3];
assign y[1] = i[2]|i[3];

endmodule

module encoder4to2_dl_tb;

reg [3:0] i;
wire [1:0] y;

encoder4to2_dl e1(i, y);

initial
begin
	i = 4'b0000;
	$monitor("Time:%f, i=%4b, y=%2b", $time,i, y );
	#5 i = 4'b0001;
	#5 i = 4'b0010;
	#5 i = 4'b0100;
	#5 i = 4'b1000;
end

endmodule