module demux_1to8(I, S1, S2, S3, I0, I1, I2, I3, I4, I5, I6, I7);

input I, S1, S2, S3;
output I0, I1, I2, I3, I4, I5, I6, I7;
wire S1not, S2not, S3not;

not g1(S1not, S1);
not g2(S2not, S2);
not g3(S3not, S3);

and g4(I0, I, S3not, S2not, S1not);
and g5(I1, I, S3not, S2not, S1);
and g6(I2, I, S3not, S2, S1not);
and g7(I3, I, S3not, S2, S1);
and g8(I4, I, S3, S2not, S1not);
and g9(I5, I, S3, S2not, S1);
and g10(I6, I, S3, S2, S1not);
and g11(I7, I, S3, S2, S1);

endmodule

module demux_1to8_tb;

reg I, S1, S2, S3;
wire I0, I1, I2, I3, I4, I5, I6, I7;

demux_1to8 i1(I, S1, S2, S3, I0, I1, I2, I3, I4, I5, I6, I7);

initial
begin
	I=1'b1; S3=1'b0; S2=1'b0; S1=1'b0;
	$monitor("Time:%f, I=%b, S3S2S1=%b%b%b, I7-I0=%b%b%b%b%b%b%b%b", $time, I, S3, S2, S1, I7, I6, I5, I4, I3, I2, I1, I0);
	#5 S3=1'b0; S2=1'b1; S1=1'b0;
	#5 S3=1'b0; S2=1'b0; S1=1'b1;
	#5 S3=1'b1; S2=1'b0; S1=1'b0;
	#5 S3=1'b1; S2=1'b1; S1=1'b1;
end

endmodule