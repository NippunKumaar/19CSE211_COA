module mux4to1_dl(s0, s1, i0, i1, i2, i3, y);
input s0, s1, i0, i1, i2, i3;
output y;

assign y = ((~s0)&(~s1)&i0)|((~s0)&(s1)&i1)|((~0)&(~s1)&i2)|((s0)&(s1)&i3);

endmodule

module mux4to1_dl_tb;

reg s0, s1, i0, i1, i2, i3;
wire y;

mux4to1_dl i(s0, s1, i0, i1, i2, i3, y);

initial
begin
	s0 = 1'b0; s1 = 1'b0; i0 = 1'b0; i1 = 1'b0; i2 = 1'b0; i3 = 1'b0;
	$monitor ("Time:%f, s0:%b s1:%b i0:%b i1:%b i2:%b i3:%b y:%b",$time, s0, s1, i0, i1, i2, i3, y);
	#5 s0 = 1'b0; s1 = 1'b0; i0 = 1'b0; i1 = 1'b0; i2 = 1'b0; i3 = 1'b0;
	#5 s0 = 1'b0; s1 = 1'b0; i0 = 1'b1; i1 = 1'b0; i2 = 1'b0; i3 = 1'b0;
	#5 s0 = 1'b0; s1 = 1'b1; i0 = 1'b0; i1 = 1'b0; i2 = 1'b0; i3 = 1'b0;
	#5 s0 = 1'b0; s1 = 1'b1; i0 = 1'b0; i1 = 1'b1; i2 = 1'b0; i3 = 1'b0;
	#5 s0 = 1'b1; s1 = 1'b0; i0 = 1'b0; i1 = 1'b0; i2 = 1'b0; i3 = 1'b0;
	#5 s0 = 1'b1; s1 = 1'b0; i0 = 1'b0; i1 = 1'b0; i2 = 1'b1; i3 = 1'b0;
	#5 s0 = 1'b1; s1 = 1'b1; i0 = 1'b0; i1 = 1'b0; i2 = 1'b0; i3 = 1'b0;
	#5 s0 = 1'b1; s1 = 1'b1; i0 = 1'b0; i1 = 1'b0; i2 = 1'b0; i3 = 1'b1;
end
endmodule