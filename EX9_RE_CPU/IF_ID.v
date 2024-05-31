

module IF_ID(FlushD,pc_4F,IRF,clk,pc_4D,IRD,en);
input clk;
input en;
input FlushD;
//input we;
input [31:0] pc_4F,IRF;
output [31:0] pc_4D,IRD;

reg [31:0] pc_4D;
reg [31:0] IRD;


always @(posedge clk or negedge FlushD)  //PosEdge Write
	begin
	if(en)
	begin
	pc_4D=pc_4F;
	IRD=IRF;
	
	end
	if(!FlushD)
	begin
	pc_4D=0;
	IRD=0;
	end
	
end
endmodule
