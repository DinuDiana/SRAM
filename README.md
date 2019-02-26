# SRAM
SRAM interface for the Altera DE1 FPGA Board - Verilog

This module makes the connection between the SRAM chip on the FPGA board and the user. Using this module a user can write 4 bit data on the integrated SRAM on 16 possible addresses and read the data from these locations. The data stored on the SRAM and the specific address are displayed on two 7 segments displays existing on the FPGA board.

module sram (  
  input clock,		//fpga clock 50MHz  
  input reset,	//initiates al 1s in all data locations, 0 active, for later  
        //implementation  
  output reg write_enable,	//if active (0) we can write in SRAM    
  output reg output_enable,	//if active (0) we can read from SRAM  
	output reg chip_enable,		//if active (0) we can use the chip  
	output lower_byte_ctrl, 	//selects lower data bytes [0:7]  
	output upper_byte_ctrl,		//selects upper data bytes [8:15]  
	output [17:0] sram_addr,	//18 bit address of location in SRAM  
	inout [15:0] sram_data, 		// bidirectional data bus  
		//fpga input  
	input [3:0] address,		//address input from user, sram_sddr[17:14], SW3:SW0  
	input [3:0] data,		//data input from user, SW9:SW6  
	input write_enable_user,	//indicates that the user wants to write in SRAM, KEY3  
	input output_enable_user,	//reads data from the address specified using SW3:SW0  
	output [6:0] data_out_7_segm,	//output on hex 1, data we read from SRAM     
	output [6:0] address_7_segm,	//output on hex 3, address from which we read   
	output reg [17:0] address_to_display,	//serves as input for the 7 segments display for address  
	output reg [15:0] data_to_display);	//serves as input for the 7 segments display for data  
