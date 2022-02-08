module mux_8to1(I0, I1, I2, I3, I4, I5, I6, I7, S1, S2, S3, Y);

input I0, I1, I2, I3, I4, I5, I6, I7, S1, S2, S3;
output Y;
wire S1not, S2not, S3not;
wire w0, w1, w2, w3, w4, w5, w6, w7;

not g1(S1not, S1);
not g2(S2not, S2);
not g3(S3not, S3);
and g4(w0, I0, S3not, S2not, S1not);
and g5(w1, I1, S3not, S2not, S1);
and g6(w2, I2, S3not, S2, S1not);
and g7(w3, I3, S3not, S2, S1);
and g8(w4, I4, S3, S2not, S1not);
and g9(w5, I5, S3, S2not, S1);
and g10(w6, I6, S3, S2, S1not);
and g11(w7, I7, S3, S2, S1);
or g12(Y,w0, w1, w2, w3, w4, w5, w6, w7);

endmodule

module mux_8to1_tb;

reg I0, I1, I2, I3, I4, I5, I6, I7, S1, S2, S3;
wire Y;


mux_8to1 i1(I0, I1, I2, I3, I4, I5, I6, I7, S1, S2, S3, Y);

initial
begin
	I0 = 1'b0; I1 = 1'b0; I2 = 1'b0; I3 = 1'b0; I4 = 1'b0; I5 = 1'b0; I6 = 1'b0; I7 = 1'b0;	
	S3=1'b0; S2=1'b0; S1=1'b0;
	$monitor ("Time:%f, I7-I0=%b%b%b%b%b%b%b%b, S3S2S1=%b%b%b, Y=%b",$time, I7, I6, I5, I4, I3, I2, I1, I0, S3, S2, S1, Y);
	#5 S3=1'b0; S2=1'b1; S1=1'b0; I0 = 1'b1; I1 = 1'b0; I2 = 1'b1; I3 = 1'b0; I4 = 1'b1; I5 = 1'b1; I6 = 1'b0; I7 = 1'b0;
	#5 S3=1'b0; S2=1'b0; S1=1'b1; I0 = 1'b1; I1 = 1'b0; I2 = 1'b1; I3 = 1'b0; I4 = 1'b1; I5 = 1'b1; I6 = 1'b0; I7 = 1'b0;
	#5 S3=1'b1; S2=1'b0; S1=1'b0; I0 = 1'b1; I1 = 1'b0; I2 = 1'b1; I3 = 1'b0; I4 = 1'b1; I5 = 1'b1; I6 = 1'b0; I7 = 1'b0;
	#5 S3=1'b1; S2=1'b1; S1=1'b1; I0 = 1'b1; I1 = 1'b0; I2 = 1'b1; I3 = 1'b0; I4 = 1'b1; I5 = 1'b1; I6 = 1'b0; I7 = 1'b0;

end
endmodule