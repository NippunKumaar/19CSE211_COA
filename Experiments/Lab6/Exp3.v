module jk(J, K, clk, Q);

input J, K, clk;
output Q;
reg Q;

always @(posedge clk)
begin
	case ({J,K})
         2'b00 :  Q = Q;
         2'b01 :  Q = 0;
         2'b10 :  Q = 1;
         2'b11 :  Q = ~Q;
      endcase
end

endmodule


module jk_tb;

reg J, K, clk;
wire Q;

jk i1(J, K, clk, Q);

always #5 clk = ~clk;

initial
begin
	J = 1'b0; K = 1'b0; clk = 1'b0;
	$monitor ("Time:%f, J=%b, K=%b, Q=%b",$time, J, K, Q);
	#5 J = 1'b0; K = 1'b1;
	#10 J = 1'b1; K = 1'b0;
	#10 J = 1'b1; K = 1'b1;
	#10 J = 1'b0; K = 1'b0;
	#10 $finish;
end
endmodule