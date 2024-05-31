

module ID_EXE(SVD,SVE,shamtD,shamtE,SLTD,SLTE,JRD,JRE,jalD,jalE,brCtrlD,brCtrlE,IRD,IRE,npccD,npccE,pc_4D,pc_4E,rsD,rsE,wtypeD,wtypeE,qaD,qbD,immD,rtD,rdD,regwriteD,memtoregD,memwriteD,ALUControlD,ALUSrcD,regdstD,clk,qaE,qbE,immE,rtE,rdE,regwriteE,memtoregE,memwriteE,ALUControlE,ALUSrcE,regdstE,clr);//pc_4D,pc_4E,
input clk;
input clr,jalD,JRD,SLTD,SVD;
//input we;
input [31:0] qaD,qbD,immD,pc_4D,IRD;//pc_4D

input [4:0] rtD,rdD,rsD,shamtD;
input  regwriteD,memtoregD,memwriteD,ALUSrcD,regdstD;
//input [1:0]NPCCtrlD;
input [3:0]ALUControlD;
input [2:0] wtypeD;
input [1:0] npccD;
input [2:0]brCtrlD;

output [31:0] qaE,qbE,immE,pc_4E,IRE;//,pc_4E
output [4:0] rtE,rdE,rsE,shamtE;
output  regwriteE,memtoregE,memwriteE,ALUSrcE,regdstE,jalE,JRE,SLTE,SVE;
//output [1:0]NPCCtrlE;
output [3:0]ALUControlE;
output [2:0]wtypeE;
output [1:0] npccE;
output [2:0]brCtrlE;

reg [31:0] qaE,qbE,immE,pc_4E,IRE;//,pc_4E
reg [4:0] rtE,rdE,rsE,shamtE;
reg  regwriteE,memtoregE,memwriteE,ALUSrcE,regdstE,jalE,JRE,SLTE,SVE;
//reg [1:0]NPCCtrlE;
reg [3:0]ALUControlE;
reg [2:0]wtypeE;
reg [1:0] npccE;
reg [2:0]brCtrlE;

always @(posedge clk or negedge clr)  //PosEdge Write
	begin
if (!clr)
	begin
	qaE=0;
	qbE=0;
	immE=0;
	pc_4E=0;
	rtE=0;
	rdE=0;
	rsE=0;
	regwriteE=0;
	memtoregE=0;
	memwriteE=0;
	ALUSrcE=0;
	regdstE=0;
	npccE=0;
	jalE=0;
	JRE=0;
	//NPCCtrlE=0;
	IRE=0;
	ALUControlE=0;
	wtypeE=0;
	brCtrlE=0;
	SLTE=0;
	shamtE=0;
	SVE=0;
	end
	else
begin
	qaE=qaD;
	qbE=qbD;
	immE=immD;
	pc_4E=pc_4D;
	rtE=rtD;
	rdE=rdD;
	rsE=rsD;
	regwriteE=regwriteD;
	memtoregE=memtoregD;
	memwriteE=memwriteD;
	ALUSrcE=ALUSrcD;
	regdstE=regdstD;
	npccE=npccD;
	//NPCCtrlE=NPCCtrlD;
	IRE=IRD;
	ALUControlE=ALUControlD;
	wtypeE=wtypeD;
	brCtrlE=brCtrlD;
	jalE=jalD;
	JRE=JRD;
	SLTE=SLTD;
	shamtE=shamtD;
	SVE=SVD;
end
	end
endmodule
