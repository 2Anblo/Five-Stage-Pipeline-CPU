

module MUX3_2(M1,M2,Mout,MSel);
	input [2:0]M1,M2;
	input MSel;
	output [2:0]Mout;
	assign Mout=(MSel==0)?M1:M2;
endmodule
