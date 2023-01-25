module alu
(       
      input          [15:0]     a,            
      input          [15:0]     b,           
      input          [2:0]      alu_control,      
		input          [3:0]      shamt,
      output reg     [15:0]     result,               
      output         zero  
);  
	
reg [15:0] rslt;	
	
always @(*)
	begin
		case (alu_control)
			3'b011: result = rslt << shamt;
			3'b111: result = rslt >> shamt;
			default: result = rslt[15:0];
		endcase	
	end
	
always @(*)  
begin   
     case(alu_control)  
     3'b000: rslt = a + b; // add  
     3'b001: rslt = a - b; // sub  
     3'b010: rslt = a & b; // and  
     3'b011: rslt = a | b; // or  
     3'b100: begin if (a < b) rslt = 16'd1;  
                    else rslt = 16'd0;  
                    end  
     3'b101:  rslt = b;
     default: rslt = a + b; // add  
     endcase  
 end  
 assign zero = (result == 16'd0) ? 1'b1: 1'b0;  
 endmodule 