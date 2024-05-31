

module Extender(imm,ExtOp,EOut);
	input [15:0] imm;
	input [1:0] ExtOp;
	output [31:0] EOut;
	
	reg [31:0] EOut1;
	reg [31:0] EOut2;
	reg [31:0] EOut3;
always@(*)
begin
	EOut1={16'b0000000000000000,imm[15:0]};
	if(imm[15])
	EOut2={16'b1111111111111111,imm[15:0]};
	else
	EOut2={16'b0000000000000000,imm[15:0]};
	EOut3={imm[15:0],16'b0000000000000000};
end
	MUX32_4 mux32_4(.M1(EOut1),.M2(EOut2),.M3(EOut3),.M4(EOut1),.Mout(EOut),.MSel(ExtOp));
endmodule
