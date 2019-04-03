module 	atomic_32_tb ;

reg clk ;
reg rst ;
reg rst_inst_mem ;
reg rst_data_mem ;
reg rst_reg_mem ;

reg instruction_write ;
reg [7:0] instruction_write_address ;
reg [31:0] instruction_in ;

atomic_32_top    dut (

				.clk(clk) ,
				.rst(rst) ,
				.rst_inst_mem(rst_inst_mem) ,
				.rst_data_mem(rst_data_mem) ,
				.rst_reg_mem(rst_reg_mem) ,
				.instruction_write(instruction_write) ,
				.instruction_write_address(instruction_write_address) ,
				.instruction_in(instruction_in)  
				

				) ;


initial begin
$shm_open("wave.shm") ;
$shm_probe("ACTMF") ;
end

always @(posedge clk)
begin
$display("PC=%h INST=%h ALU=%h MEM_OUT=%h RS1=%h MEM_IN=%h REG_IN=%h RD=%0d MEM_WE=%b REG_WE=%b",
        dut.pc_out,
        dut.instruction,
        dut.alu_out,
        dut.MR_EXE_mem_out,
        dut.EXE_WR_data_from_rs1,
        dut.EXE_WR_data_in_for_mem,
        dut.EXE_WR_data_in_for_reg,
        dut.EXE_WR_rd_address,
        dut.EXE_WR_write_mem_en,
        dut.EXE_WR_write_reg_en);
end
initial begin
clk = 1;
forever #5 clk = ~clk ;
end

initial begin

rst_inst_mem = 0 ;
rst_data_mem = 0 ;
rst_reg_mem = 0 ;

instruction_write = 0 ;
instruction_write_address = 0 ;
instruction_in = 0 ;

end

initial begin
rst = 1 ;#10
rst = 0 ;#930
$finish;

end


endmodule
