module decoder_3to8(I0, I1, I2, Y0, Y1, Y2, Y3, Y4, Y5, Y6, Y7);

input I0, I1, I2;
output Y0, Y1, Y2, Y3, Y4, Y5, Y6, Y7;
wire I0not, I1not, I2not;

not g1(I0not, I0);
not g2(I1not, I1);
not g3(I2not, I2);

and g4(Y0, I2not, I1not, I0not);
and g5(Y1, I2not, I1not, I0);
and g6(Y2, I2not, I1, I0not);
and g7(Y3, I2not, I1, I0);
and g8(Y4, I2, I1not, I0not);
and g9(Y5, I2, I1not, I0);
and g10(Y6, I2, I1, I0not);
and g11(Y7, I2, I1, I0);

endmodule

module decoder_3to8_tb;

reg I0, I1, I2;
wire Y0, Y1, Y2, Y3, Y4, Y5, Y6, Y7;

decoder_3to8 i1(I0, I1, I2, Y0, Y1, Y2, Y3, Y4, Y5, Y6, Y7);

initial
begin
	I2=1'b0; I1=1'b0; I0=1'b0;
	$monitor("Time:%f, S3S2S1=%b%b%b, Y7-Y0=%b%b%b%b%b%b%b%b", $time,I2, I1, I0, Y7, Y6, Y5, Y4, Y3, Y2, Y1, Y0);
	#5 I2=1'b0; I1=1'b1; I0=1'b0;
	#5 I2=1'b0; I1=1'b0; I0=1'b1;
	#5 I2=1'b1; I1=1'b0; I0=1'b0;
	#5 I2=1'b1; I1=1'b1; I0=1'b1;
end

endmodule