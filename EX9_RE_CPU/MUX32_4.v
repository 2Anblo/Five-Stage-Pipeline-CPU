

module MUX32_4(M1,M2,M3,M4,Mout,MSel);
	input [31:0]M1;
	input [31:0]M2;
	input [31:0]M3;
	input [31:0]M4;
	input [1:0]MSel;
	output [31:0]Mout;
	reg [31:0]Mout;
always@(*)
begin
	case(MSel)
		2'b00:
		Mout=M1;
		2'b01:
		Mout=M2;
		2'b10:
		Mout=M3;
		2'b11:
		Mout=M4;
	default:
	Mout=M1;
	endcase
end
endmodule
