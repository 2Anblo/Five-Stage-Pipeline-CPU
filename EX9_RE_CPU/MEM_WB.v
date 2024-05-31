

module MEM_WB(jalM,jalW,pc_4M,pc_4W,regwriteM,memtoregM,ALUoutM,dstregM,MemoutM,clk,regwriteW,memtoregW,ALUoutW,dstregW,MemoutW);
input clk,jalM;
//input we;
input regwriteM,memtoregM;
input [31:0] ALUoutM,MemoutM,pc_4M;
input [4:0] dstregM;

output regwriteW,memtoregW,jalW;
output [31:0] ALUoutW,MemoutW,pc_4W;
output [4:0] dstregW;

reg regwriteW,memtoregW,jalW;
reg [31:0] ALUoutW,MemoutW,pc_4W;
reg [4:0] dstregW;


always @(posedge clk)  //PosEdge Write
	begin
	regwriteW=regwriteM;
	memtoregW=memtoregM;
	ALUoutW=ALUoutM;
	MemoutW=MemoutM;
	dstregW=dstregM;
	pc_4W=pc_4M;
	jalW=jalM;
end
endmodule
