module mux2to1 (d0, d1, s, y);
input d0, d1, s;
output y;
wire sbar, w1, w2;

not g1 (sbar, s);
and g2 (w1, d0, sbar);
and g3 (w2, d1, s);
or g4(y, w1, w2);

endmodule

module mux2to1_tb;

reg d0, d1, s;
wire y;

mux2to1 i(d0, d1, s, y);

initial
begin
	s=1'b0; d0 = 1'b0; d1 = 1'b0;
	$monitor("Time:%f, s:%b d0:%b d1:%b y:%b", $time, s, d0, d1, y);
	#5 s=1'b0; d0 = 1'b1; d1 = 1'b0;
	#5 s=1'b0; d0 = 1'b0; d1 = 1'b1;
	#5 s=1'b1; d0 = 1'b1; d1 = 1'b0;
	#5 s=1'b1; d0 = 1'b0; d1 = 1'b1;
end

endmodule