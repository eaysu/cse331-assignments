module control(write, shift_right, clk, product0, reset);

input clk, product0, reset;
output reg write, shift_right;

localparam [2:0] s0 = 3'b000,
			  [2:0] s1 = 3'b001,
			  [2:0] s2 = 3'b010,
			  [2:0] s3 = 3'b011,
			  [2:0] s4 = 3'b100;
			
reg [2:0] present_state;
reg [2:0] next_state = s0;
reg [5:0] count = 0;

always@(posedge clk)
begin
	if(reset) 
		present_state <= next_state;
	else
		begin
			case(present_state)
				
				s0:
					begin
						if(product0) 
							present_state <= s1;
						else 
							present_state <= s2;
					end
				
				s1:
					begin
						present_state <= s2;
					end
				
				s2:
					begin
						present_state <= s3;
					end
				
				s3:
					begin
						if (count < 32)
							present_state <= s0;
						else
							present_state <= s4;
						count = count + 1;	
					end
			endcase
		end
end

always@(posedge clk)
begin
	if(reset);
	else 
		begin
			case(present_state)
				
				s0:
					begin
						write <= 0;
						shift_right <= 0;
					end
				
				s1:
					begin 
						write <= 1;
						shift_right <= 0;
					end
				
				s2:
					begin 
						write <= 0;
						shift_right <= 1;
					end
				
				s3:
					begin 
						write <= 0;
						shift_right <= 0;
					end
			endcase
		end
end
	
endmodule			