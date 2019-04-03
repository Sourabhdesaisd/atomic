module 		instruction_mem_B0		(

							input 		clk 				,
							input 		rst				,
							input 		write_en_B0 			,
							input 	[7:0] 	data_in_B0 			,
							input 	[7:0] 	write_address_B0 		,	  
							input 	[7:0] 	read_address_B0 		,
							output 	[7:0] 	instruction_mem_out_B0 

						) 							;

integer 	i 								;

reg 	[7:0] 	instruction_memory_B0 	[0:255] 				;

initial begin
    $readmemh("../verification/program_B0.hex", instruction_memory_B0);
    $display("Instruction memory B0 loaded");
    
end

always@(posedge clk or posedge rst)
begin

if(rst)
begin
for(i=0; i<256 ; i= i+1 )
instruction_memory_B0[i] 		<= 	8'd0 				;
end
else if(write_en_B0)
instruction_memory_B0[write_address_B0] 	<=	data_in_B0 				;
end
assign  	instruction_mem_out_B0 	= 	instruction_memory_B0[read_address_B0] 	;

endmodule
