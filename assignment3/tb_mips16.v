module tb_mips16;  
 
reg clk;  
reg reset;

wire [5:0] op_code;
wire [3:0] rs_add;
wire [3:0] rt_add;
wire [3:0] rd_add;  

wire [15:0] pc_out;  
wire [15:0] alu_result;
wire [31:0] instr_out;
 

mips16 uut(  
	  .clk(clk),   
	  .reset(reset),   
	  .pc_out(pc_out),   
	  .alu_result(alu_result),
	  .instr_out(instr_out)  
);
 
assign op_code = instr_out[31:26];
assign rs_add = instr_out[25:22];
assign rt_add = instr_out[21:18];
assign rd_add = instr_out[17:14];

initial begin  
		  clk = 0;  
		  forever begin
		  #10 clk = ~clk;
		  if (clk) begin 
			$display ("pc value: %d", pc_out); 
			$display ("rs value: %d", uut.reg_file.reg_array[rs_add]); 
			$display ("rt value: %d", uut.reg_file.reg_array[rt_add]);
			if (op_code == 6'b000000) 
				begin
					$display ("rd value: %d", uut.reg_file.reg_array[rd_add]);
				end	
			$display ("///////////////////////////////");     
		  end
		  end 
	end	   
initial begin  
	reset = 1;  
	#100;  
        reset = 0;   
	end  
endmodule 