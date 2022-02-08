module Combi_logic (Z, In);

input [3:0] In;
output Z;
wire w1,w2;

assign w1 = In[0] & In[1];
assign w2 = In[2] | In[3];
assign Z = w1 | w2;

endmodule

module Dff(Q,D,Clk,Rst);

output Q;
input D,Clk,Rst;

reg Q;

	always@(Rst)
		if(Rst)
			Q=0;
	always@(negedge Clk)
		if(!Rst)
			Q=D;
		
endmodule

module System(Q,In,Clk,Rst);
output Q;
input [3:0] In;
input Clk,Rst;

wire w;
	Combi_logic c(w, In);
	Dff t1(Q,w,Clk,Rst);
endmodule

module system_tb;
wire Q;
reg [3:0] In;
reg Clk, Rst;

System i1(Q, In, Clk, Rst);

always #5 Clk = ~Clk;

initial
begin
	 Rst=1'b1; Clk=1'b0;
	$monitor("Time:%f, In:%4b, Clk:%b, Q:%b", $time, In, Clk, Q);
	#15 In = 4'b0000; Rst = 1'b0;
	#15 In = 4'b1100; Rst = 1'b0;
	#15 In = 4'b0001; Rst = 1'b0;
	#15 In = 4'b1011; Rst = 1'b0;
	#15 In = 4'b0010; Rst = 1'b0;
	#15 In = 4'b1111; Rst = 1'b0;
	#15 $finish;
end

endmodule
