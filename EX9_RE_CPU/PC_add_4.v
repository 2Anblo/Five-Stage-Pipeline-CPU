
module PC_add_4(pc,pc_4);
input [31:0]pc;
output [31:0]pc_4;
reg [31:0] pc_4;
always@(*) begin
	pc_4=pc+4;
end
endmodule

