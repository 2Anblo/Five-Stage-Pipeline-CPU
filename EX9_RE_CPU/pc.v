

module pc(clk,clrn,e,d,q);
input clk;    //clock
input clrn;   //
input e;      //
input [31:0] d;    //
output [31:0] q;   //
reg [31:0] q;
initial begin
q<=0;
end
always@(posedge clk or negedge clrn)
begin
if(!clrn)
begin
q<=0;
end
else if(e)
begin 
q<=d;
end
end
endmodule
