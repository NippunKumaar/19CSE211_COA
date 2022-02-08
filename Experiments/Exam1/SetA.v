module encoder_8to3(I0, I1, I2, I3, I4, I5, I6, I7, Y0, Y1, Y2);

input I0, I1, I2, I3, I4, I5, I6, I7;
output Y0, Y1, Y2;

or g1 (Y2, I4, I5, I6, I7);
or g2 (Y1, I2, I3, I6, I7);
or g3 (Y0, I1, I3, I5, I7);

endmodule

module encoder_8to3_tb;

reg I0, I1, I2, I3, I4, I5, I6, I7;
wire Y0, Y1, Y2;

encoder_8to3 i1(I0, I1, I2, I3, I4, I5, I6, I7, Y0, Y1, Y2);
initial
begin
	I0 = 1'b0; I1 = 1'b0; I2 = 1'b0; I3 = 1'b0; I4 = 1'b0; I5 = 1'b0; I6 = 1'b0; I7 = 1'b0;
	$monitor ("Time:%f, I7-I0=%b%b%b%b%b%b%b%b, Y2Y1Y0=%b%b%b",$time, I7, I6, I5, I4, I3, I2, I1, I0, Y2, Y1, Y0);
	#5 I0 = 1'b1;
	#5 I0 = 1'b0; I4 = 1'b1;
	#5 I4 = 1'b0; I7 = 1'b1;
	#5 I7 = 1'b0; I3 = 1'b1;
end

endmodule