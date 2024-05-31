
module hazard_unit(ForwardSV,SVE,ForwardQAE,ForwardQBE,memwriteE,npcc,npccE,FlushD,StallF,StallD,FlushE,rsD,rtD,rsE,rtE,ForwardAE,ForwardBE,memtoregE,dstregM,regwriteM,regwriteW,dstregW,dstregE,regwriteE);//ForwardNE,ForwardNT,
	input [4:0]rsD,rtD,rsE,rtE;
	input memtoregE,regwriteM,regwriteW,regwriteE,memwriteE,SVE;
	input [4:0]dstregW,dstregM,dstregE;
	input [1:0]npcc,npccE;

	output StallF,StallD,FlushE,FlushD;
	output [1:0]ForwardAE,ForwardBE,ForwardSV;
	output ForwardQAE,ForwardQBE;
	//output [1:0]ForwardNE,ForwardNT;

	reg StallF,StallD,FlushE,FlushD;
	reg [1:0]ForwardAE,ForwardBE,ForwardSV;
	reg ForwardQAE,ForwardQBE;
	//reg [1:0]ForwardNE,ForwardNT;
initial begin
	StallF=1;
	StallD=1;
	FlushE=1;
	FlushD=1;
end

always@(*)
	begin
	StallF=1;
	StallD=1;
	FlushE=1;
	FlushD=1;
	ForwardQAE=1'b0;
	ForwardQBE=1'b0;
	ForwardSV=2'b00;
	//ID/WB conflict
	if(regwriteW && (dstregW!=5'b00000)&&((dstregW==rsD) || (dstregW==rtD)))
	begin
	if(dstregW==rsD)	
	ForwardQAE=1'b1;
	else if(dstregW==rtD)	
	ForwardQBE=1'b1;
	end
	//MEM/WB & EXE/MEM SVE conflict conflict SW conflict

		
	ForwardAE=2'b00;
	ForwardBE=2'b00;
		
	if((regwriteW && (dstregW!=5'b00000) && ((dstregW==rsE) || (dstregW==rtE)))||(memwriteE&& (dstregW!=5'b00000) &&((dstregW==rsE) || (dstregW==rtE))))
	begin
	if(dstregW==rsE)	
	ForwardAE=2'b01;
	else if(dstregW==rtE)	
	ForwardBE=2'b01;
	end
	if((regwriteM && (dstregM!=5'b00000) && ((dstregM==rsE) || (dstregM==rtE)))||(memwriteE&& (dstregM!=5'b00000) && ((dstregW==rsE) || (dstregW==rtE))))
	begin
	if(dstregM==rsE)	
	ForwardAE=2'b10;
	else if(dstregM==rtE)	
	ForwardBE=2'b10;
	end
	if(regwriteW && (dstregW!=5'b00000) && (dstregW==rsE)&& SVE)
	ForwardSV=2'b10;
	if(regwriteM && (dstregM!=5'b00000) && (dstregM==rsE)&& SVE)
	ForwardSV=2'b01;
	//ID/EXE 

	//Load Stop
	if(memtoregE && (rtE!=5'b00000) &&((rtE==rtD) || (rtE==rsD)))
	begin
	StallF=0;
	StallD=0;
	FlushE=0;
	end
	else
	begin
	StallF=1;
	StallD=1;
	FlushE=1;
	end
	//npc Stop
	
	if((npcc==2'b10)||(npcc==2'b01))
	begin
	StallF=1;
	StallD=0;
	FlushD=0;
	FlushE=0;
	end
	else
	begin
	StallF=1;
	StallD=1;
	FlushD=1;
	FlushE=1;
	end

	end
	
endmodule
