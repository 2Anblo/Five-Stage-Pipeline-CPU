

module NPC(JR,qa,pc,addr,offset,pcBr,pcJ);
	//input [1:0]npccontrol;
	input [31:0]pc,qa;
	input [25:0]addr;
	input [15:0]offset;
	input JR;

	output [31:0]pcBr;
	output [31:0]pcJ;
	

	reg [31:0]pcBr;
	reg [31:0]pcJ;
always@(*)
begin
	if(offset[15])
	pcBr=pc+{{14{1'b1}},offset,2'b00};
	else
	pcBr=pc+{{14{1'b0}},offset,2'b00};
	if(!JR)
	pcJ={pc[31:28],addr,2'b00};
	else
	pcJ=qa;
end


endmodule
