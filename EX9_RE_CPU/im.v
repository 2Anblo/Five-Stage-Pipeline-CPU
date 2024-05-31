

module im(addr,out);//,op,func,shamt,rs,rt,rd,immd,address
input [7:0] addr;
output[31:0] out;

reg [31:0] out;
always @(addr) begin  //
	case(addr)
	

	8'h00: out = 32'h3c09abcd;
	8'h04: out = 32'h1d20000a;
	8'h08: out = 32'h00000000;
	8'h0c: out = 32'h05210008;
	8'h10: out = 32'h00000000;
	8'h14: out = 32'h292a0000;
	8'h18: out = 32'h11400005;
	8'h1c: out = 32'h00000000;
	8'h20: out = 32'h14000003;
	8'h24: out = 32'h00000000;
	8'h28: out = 32'h19200002;
	8'h2c: out = 32'h00000000;
	8'h30: out = 32'h08000c0c;
	8'h34: out = 32'h0c000c11;
	8'h38: out = 32'h0c000c20;
	8'h3c: out = 32'h0c000c30;
	8'h40: out = 32'h08000c39;
	8'h44: out = 32'h2008ffff;
	8'h48: out = 32'h24090001;
	8'h4c: out = 32'h01095022;
	8'h50: out = 32'h01285023;
	8'h54: out = 32'h0109502a;
	8'h58: out = 32'h01095021;
	8'h5c: out = 32'h3c095555;
	8'h60: out = 32'h35295555;
	8'h64: out = 32'h01204825;
	8'h68: out = 32'h390a5555;
	8'h6c: out = 32'h01095024;
	8'h70: out = 32'h01095026;
	8'h74: out = 32'h01095027;
	8'h78: out = 32'h300a5555;
	8'h7c: out = 32'h03e00008;
	8'h80: out = 32'h00008020;
	8'h84: out = 32'h34081280;
	8'h88: out = 32'hae080000;
	8'h8c: out = 32'h22100004;
	8'h90: out = 32'ha2080000;
	8'h94: out = 32'h21080001;
	8'h98: out = 32'ha2080001;
	8'h9c: out = 32'ha6080002;
	8'ha0: out = 32'h82090000;
	8'ha4: out = 32'h92090000;
	8'ha8: out = 32'h86090000;
	8'hac: out = 32'h96090000;
	8'hb0: out = 32'h8e090000;
	8'hb4: out = 32'hac000000;
	8'hb8: out = 32'hae000000;
	8'hbc: out = 32'h03e00008;
	8'hc0: out = 32'h2008ffff;
	8'hc4: out = 32'h00084fc0;
	8'hc8: out = 32'h000957c2;
	8'hcc: out = 32'h000957c3;
	8'hd0: out = 32'h34080017;
	8'hd4: out = 32'h01095004;
	8'hd8: out = 32'h01095006;
	8'hdc: out = 32'h01095007;
	8'he0: out = 32'h03e00008;
	8'he4: out = 32'h08000c39;
	8'he8: out = 32'h00000000;
	8'hec: out = 32'h00000000;
	default: out = {32{1'b0}};
	endcase

end
endmodule
