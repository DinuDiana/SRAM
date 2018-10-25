module sram(
				/////////////////////SRAM INTERFACE////////////////////////
				input clock,									//fpga clock
				input reset,									//initiates al 1s in all data locations, 0 active
				output reg write_enable,					//if active (0) we can write in SRAM
				output reg output_enable,					//if active (0) we can read from SRAM
				output reg chip_enable,						//if active (0) we can use the chip
				output lower_byte_ctrl, 					//selects lower bytes [0:7]
				output upper_byte_ctrl,						//selects upper bytes [8:15]
				output [17:0] sram_addr,					//18 bit address of location in SRAM
				inout [15:0] sram_data, 					// bidirectional data bus
				/////////////////////FPGA/USER INPUT///////////////////////
				input [3:0] address,							//address input from user, sram_sddr[17:14], SW3:SW0
				input [3:0] data,								//data input from user, SW9:SW6
				input write_enable_user,					//indicates that the user wants to write in SRAM, KEY3
				input output_enable_user,					//reads data from the address specified using SW3:SW0
				output [6:0] data_out_7_segm,				//output on hex 1, data we read from SRAM
				output [6:0] address_7_segm,				//output on hex 3, address from which we read
				output reg [17:0] address_to_display,	//serves as input for the 7 segments display for address
				output reg [15:0] data_to_display		//serves as input for the 7 segments display for data
				);		
			
reg chip_enable_user;			

///////WRITE - ON DATA BUS///////
assign sram_data = (chip_enable == 0 && write_enable == 0) ?  {data, 12'b0} : 16'bz;

//////ADDRESS BUS - READ AND WRITE//////
assign sram_addr = ( (chip_enable == 0 && write_enable ==0) || (chip_enable == 0 && output_enable == 0) ) ? {address, 14'b0} : {4'b0000, 14'b0};

//////We have 16bit data//////
assign upper_byte_ctrl=1'b0;
assign lower_byte_ctrl=1'b0;

//////connection between user key and sram input signals//////
always @ (posedge clock)
	begin 
			chip_enable_user <= 0;
			
			if (chip_enable_user == 0)
				if (write_enable_user == 0)
					begin 
						write_enable <= 0;
						chip_enable <= 0;
					end
				else if (output_enable_user == 0)
					begin
						output_enable <= 0;
						chip_enable <= 0;
					end
				else 
					begin
						write_enable <= 1;
						output_enable <= 1;
						chip_enable <= 1;
					end	
	end
		
//////display on hex the address and data when reading from sram////////
always @ (*)	
	begin
		data_to_display = (chip_enable == 0 && output_enable == 0) ? sram_data[15:12] : 4'bz;
		address_to_display = (chip_enable == 0 && output_enable == 0) ? sram_addr[17:14] : 4'bz;
	end

			
segments afisaj_address (address_to_display, output_enable, address_7_segm);
segments afisaj_data (data_to_display, output_enable, data_out_7_segm);	

endmodule 		
			
