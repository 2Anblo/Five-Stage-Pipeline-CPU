

module MUX32_2(M1,M2,Mout,MSel);
	input [31:0]M1,M2;
	input MSel;
	output [31:0]Mout;
	assign Mout=(MSel==0)?M1:M2;
endmodule
