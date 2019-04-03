module 		instruction_mem_B3		(

							input 		clk 				,
							input 		rst				,
							input 		write_en_B3 			,
							input 	[7:0] 	data_in_B3 			,
							input 	[7:0] 	write_address_B3 		,	  
							input 	[7:0] 	read_address_B3 		,
							output 	[7:0] 	instruction_mem_out_B3 

						) 							;



integer 	i 								;

reg 	[7:0] 	instruction_memory_B3 	[0:255] 				;
initial begin
    $readmemh("../verification/program_B3.hex", instruction_memory_B3);
    $display("Instruction memory B3 loaded");
    
end

always@(posedge clk or posedge rst)
begin

if(rst)
begin

for(i=0; i<256 ; i= i+1 )
instruction_memory_B3[i] 		<= 		8'd0 				;

end


else if(write_en_B3)
instruction_memory_B3[write_address_B3] 	<=	data_in_B3 				;

end



assign  	instruction_mem_out_B3 	= 	instruction_memory_B3[read_address_B3] 	;


endmodule
