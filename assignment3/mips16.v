module mips16
(
	input         clk, reset,  
   output [15:0] pc_out, alu_result, 
	output [31:0] instr_out
);
  
reg [15:0]         pc_current;  
wire signed [15:0] pc_next,pc2;  
wire [31:0]        instr;  
wire [2:0]         alu_op;
wire [1:0]         reg_dst,mem_to_reg;  
wire               jump, branch, mem_read, mem_write, reg_write, alu_src;  
wire [3:0]         reg_write_dest;  
wire [15:0]        reg_write_data;  
wire [3:0]         reg_read_addr_1;  
wire [15:0]        reg_read_data_1;  
wire [3:0]         reg_read_addr_2;  
wire [15:0]        reg_read_data_2;  
wire [15:0]        read_data2,imm_ext;  
wire               jrcontrol;  
wire [2:0]         ALU_Control;  
wire [15:0]        ALU_out;  
wire               zero_flag;  
wire signed [15:0] im_shift_1, PC_j, PC_beq, PC_4beq, PC_4beqj, PC_jr;  
wire               beq_control, bne_control;  
wire [15:0]        mem_read_data;  
wire [15:0]        no_sign_ext;  
wire               sign_or_zero;  
wire               branch_not_equal;

assign instr_out = instr;

always @(posedge clk or posedge reset)  
begin   
     if(reset)   
          pc_current <= 16'd0;  
     else  
          pc_current <= pc_next;  
end 
 
assign pc2 = pc_current + 16'd2;  

instr_mem instrucion_memory(.pc(pc_current),.instruction(instr));  

control control_unit(.reset(reset), .opcode(instr[31:26]), .reg_dst(reg_dst), .mem_to_reg(mem_to_reg), .alu_op(alu_op),
                     .jump(jump), .branch(branch), .mem_read(mem_read), .mem_write(mem_write), .alu_src(alu_src),
							.reg_write(reg_write), .sign_or_zero(sign_or_zero), .branch_not_equal(branch_not_equal));  
							
assign reg_write_dest = (reg_dst == 2'b10) ? 4'b1111: ((reg_dst == 2'b01) ? instr[17:14] : instr[21:18]);  
assign reg_read_addr_1 = instr[25:22];  
assign reg_read_addr_2 = instr[21:18];  

register_file reg_file(.clk(clk), .rst(reset), .reg_write_en(reg_write), .reg_write_dest(reg_write_dest), .reg_write_data(reg_write_data),  
                       .reg_read_addr_1(reg_read_addr_1), .reg_read_data_1(reg_read_data_1), .reg_read_addr_2(reg_read_addr_2), .reg_read_data_2(reg_read_data_2)); 
							  
assign imm_ext = instr[17:2];  

jr_control jrcontrol_unit(.alu_op(alu_op), .funct(instr[9:4]), .jrcontrol(jrcontrol));    
   
ALUControl ALU_Control_unit(.ALUOp(alu_op), .Function(instr[9:4]), .ALU_Control(ALU_Control));  

assign read_data2 = (alu_src==1'b1) ? imm_ext : reg_read_data_2;  

alu alu_unit(.a(reg_read_data_1), .b(read_data2), .shamt(instr[13:10]), .alu_control(ALU_Control), .result(ALU_out));  

assign im_shift_1 = {imm_ext[13:0], 2'b0};  
assign no_sign_ext = ~(im_shift_1) + 1'b1;  
assign PC_beq = (im_shift_1[15] == 1'b1) ? (pc2 - no_sign_ext): (pc2 + im_shift_1);  
assign beq_control = branch & zero_flag;  
assign bne_control = branch_not_equal & ~zero_flag;
assign PC_4beq = (beq_control | bne_control) ? PC_beq : pc2;  
assign PC_j = instr[25:16];  
assign PC_4beqj = (jump == 1'b1) ? PC_j : PC_4beq;  
assign PC_jr = reg_read_data_1;  
assign pc_next = (jrcontrol == 1'b1) ? PC_jr : PC_4beqj;
  
data_memory datamem(.clk(clk), .mem_access_addr(ALU_out),  
                    .mem_write_data(reg_read_data_2), .mem_write_en(mem_write),
						  .mem_read(mem_read), .mem_read_data(mem_read_data));
						  
assign reg_write_data = (mem_to_reg == 2'b10) ? pc2:((mem_to_reg == 2'b01) ? mem_read_data: ALU_out);  
assign pc_out = pc_current;  
assign alu_result = ALU_out;  
endmodule  