

module RF_32(clk,we,ra,rb,rw,rd,qa,qb,r16,r17,r18,s0);
input clk;
input we;
input [4:0] ra,rb,rw;
input [31:0] rd;
output [31:0] qa,qb;
output [31:0] r16,r17,r18,s0;

//wire [31:0] qa,qb;//register is illegal
reg [31:0] register[31:0];
reg [31:0] r16,r17,r18,s0;
integer i;
initial begin
 
  for (i = 0; i < 32; i = i + 1) begin
    register[i] = 32'h00000000;
  end
end
assign qa=(ra==0)?0:register[ra];
assign qb=(rb==0)?0:register[rb];

always @(posedge clk)  //PosEdge Write
	begin
if((rw!=0)&&we)
	   register[rw]=rd;
r16=register[9];
r17=register[10];
r18=register[8];
s0=register[16];
end
endmodule
