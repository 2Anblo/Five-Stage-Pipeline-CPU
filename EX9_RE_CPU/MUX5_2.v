

module MUX5_2(M1,M2,MOut,MSel);
	input [4:0]M1;
	input [4:0]M2;
	input MSel;
	output [4:0]MOut;

	assign MOut=(MSel==0)?M1:M2;
endmodule
