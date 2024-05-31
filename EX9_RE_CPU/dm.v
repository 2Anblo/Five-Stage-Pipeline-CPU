

module dm(clk,we,addr,din,dout,wtype);
input we;
input clk;
input [7:0] addr;
input [31:0] din;
input [2:0] wtype;
output [31:0] dout;


reg [31:0] dout;
 integer i;
reg [7:0] ram[1023:0];
initial begin
 
  for (i = 0; i < 1024; i = i + 1) begin
    ram[i] = 8'b00000000;
  end
end
always @(posedge clk)   //Pose Edge Write
	if (we == 1)
	begin
	case (wtype)
		3'b000://sw
		begin
		ram[addr+3] <= din[31:24];
		ram[addr+2] <= din[23:16];
		ram[addr+1] <= din[15:8];
		ram[addr] <= din[7:0];
		end
		3'b001://sb
		case (addr[1:0])
			2'b00:// sb_1
			ram[addr] <= din[7:0];
			2'b01:// lb_2
			ram[{addr[7:2],2'b00}+1] <= din[7:0];
			2'b10:// lb_3
			ram[{addr[7:2],2'b00}+2] <= din[7:0];
			2'b11:// lb_4
			ram[{addr[7:2],2'b00}+3] <= din[7:0];
			endcase
		3'b010://sh
		case (addr[1:0])
			2'b00:// sh_low
			begin
		ram[{addr[7:2],2'b00}+1] <= din[15:8];
		ram[{addr[7:2],2'b00}] <= din[7:0];
			end
			2'b10:// sh_high
			begin
                ram[{addr[7:2],2'b00}+3] <= din[15:8];
		ram[{addr[7:2],2'b00}+2] <= din[7:0];
			end
		endcase
	endcase
	end
always @(*) begin
	//a<={addr[7:2],2'b00};
        case (wtype)
            3'b000: // lw
                dout <= {ram[addr+3], ram[addr+2], ram[addr+1], ram[addr]};
            3'b010: // lh big-endian storage
		case (addr[1:0])
			2'b00:// lh_low
			begin
                if (ram[addr][7] == 0)
                    dout <= {16'b0, ram[{addr[7:2],2'b00}+1], ram[{addr[7:2],2'b00}]};
                else
                    dout <= {16'b1111111111111111, ram[{addr[7:2],2'b00}+1], ram[{addr[7:2],2'b00}]};
			end
			2'b10:// lh_high
			begin
                if (ram[addr][7] == 0)
                    dout <= {16'b0, ram[{addr[7:2],2'b00}+3], ram[{addr[7:2],2'b00}+2]};
                else
                    dout <= {16'b1111111111111111, ram[{addr[7:2],2'b00}+3], ram[{addr[7:2],2'b00}+2]};
			end
		endcase
            3'b001: // lb big-endian storage
		case (addr[1:0])
			2'b00:// lb_1
			begin
                if (ram[addr][7] == 0)
		dout <= {24'b0, ram[{addr[7:2],2'b00}]};
   		 else
                   dout <= {24'b111111111111111111111111, ram[{addr[7:2],2'b00}]};
			end
			2'b01:// lb_2
			begin
                if (ram[addr][7] == 0)
		dout <= {24'b0, ram[{addr[7:2],2'b00}+1]};
   		 else
                   dout <= {24'b111111111111111111111111, ram[{addr[7:2],2'b00}+1]};
			end
			2'b10:// lb_3
			begin
                if (ram[addr][7] == 0)
		dout <= {24'b0, ram[{addr[7:2],2'b00}+2]};
   		 else
                   dout <= {24'b111111111111111111111111, ram[{addr[7:2],2'b00}+2]};
			end
			2'b11:// lb_4
			begin
                if (ram[addr][7] == 0)
		dout <= {24'b0, ram[{addr[7:2],2'b00}+3]};
   		 else
                   dout <= {24'b111111111111111111111111, ram[{addr[7:2],2'b00}+3]};
			end
			endcase
      		3'b110: // lhu big-endian storage
		case (addr[1:0])
			2'b00:// lh_low
			begin  
                    dout <= {16'b0, ram[{addr[7:2],2'b00}+1], ram[{addr[7:2],2'b00}]};
               end
			2'b10:// lh_high
			begin
                
                    dout <= {16'b0, ram[{addr[7:2],2'b00}+3], ram[{addr[7:2],2'b00}+2]};
			end
		endcase
                3'b101: // lbu big-endian storage
		case (addr[1:0])
			2'b00:// lbu_1
			begin
               
		dout <= {24'b0, ram[{addr[7:2],2'b00}]};
   		
			end
			2'b01:// lbu_2
			begin
                
		dout <= {24'b0, ram[{addr[7:2],2'b00}+1]};
			end
			2'b10:// lbu_3
			begin
                
		dout <= {24'b0, ram[{addr[7:2],2'b00}+2]};
			end
			2'b11:// lbu_4
			begin
                
		dout <= {24'b0, ram[{addr[7:2],2'b00}+3]};
   		
			end
			endcase
            	default: dout <= 32'b0; // default case to handle unused wtype values
		//endcase
endcase
end
endmodule
