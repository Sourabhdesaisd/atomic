module 		min_max_signed 		(

						input  	[31:0] 	in_1 		,
						input  	[31:0] 	in_2 		,

						output 	[31:0] 	max_signed_out 	,
						output 	[31:0] 	min_signed_out 

					) 						;

wire diff = in_1[31] ^ in_2[31] ;

assign 	max_signed_out 	=   diff ? (in_1[31] ? in_2 : in_1 ) :( ( in_1 > in_2 ) ? in_1 : in_2 ) ;

assign 	min_signed_out 	=   diff ? (in_1[31] ? in_1 : in_2 ) :( ( in_1 > in_2 ) ? in_2 : in_1 ) ;

endmodule
