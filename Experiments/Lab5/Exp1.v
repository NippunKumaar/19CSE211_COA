module decoder2to4_gl(i0, i1, en, y0, y1, y2, y3);
input i0, i1, en;
output y0, y1, y2, y3;
wire i0bar, i1bar;

not g1(i0bar, i0);
not g2(i1bar, i1);
and g3(y0, i0bar, i1bar, en);
and g4(y1, i0bar, i1, en);
and g5(y2, i0, i1bar, en);
and g6(y3, i0, i1, en);

endmodule

module decoder2to4_gl_tb;
reg i0, i1, en;
wire y0, y1, y2, y3;

decoder2to4_gl d1(i0, i1, en, y0, y1, y2, y3);

initial
begin
	i0=1'b0; i1=1'b0; en=1'b0;
	$monitor("Time:%f, en=%b, i0=%b, i1=%b, y0=%b, y1=%b, y2=%b, y3=%b", $time, en, i0, i1, y0, y1, y2, y3);
	#5 	en=1'b1; i0=1'b0; i1=1'b0;
	#5 	en=1'b1; i0=1'b0; i1=1'b1;
	#5 	en=1'b1; i0=1'b1; i1=1'b0;
	#5 	en=1'b1; i0=1'b1; i1=1'b1;
	#5 	en=1'b0; i0=1'b1; i1=1'b1;
end

endmodule