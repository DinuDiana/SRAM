module test ();

reg clock, write_enable_user, output_enable_user, chip_enable_user;
reg [3:0] address, data;
wire [15:0] sram_data;
wire [17:0] sram_addr;
wire [6:0] data_out_7_segm;
wire [6:0] address_7_segm;
wire [3:0] data_to_display;
wire [3:0] address_to_display; 

initial begin
  clock = 0;
  forever #1 clock = ~clock;
end

  initial begin
    data = 4'b1010;           //first write
    address = 4'b0001;
    chip_enable_user = 1;
    write_enable_user = 1;
    output_enable_user = 1;
    #10 chip_enable_user = 0;
     write_enable_user = 0;
    #20 data = 4'b 0101;      //second write
        address = 4'b0010;
    #5 chip_enable_user = 0;
     write_enable_user = 0;
    #10 chip_enable_user = 1;
        output_enable_user = 1;
        write_enable_user = 1;
    #20 chip_enable_user = 0;      //first read
        address = 4'b0001;
    #2 output_enable_user = 0;
    #10 chip_enable_user = 1;
        write_enable_user = 1;
        output_enable_user = 1;
    #7 address = 4'b0010;
    #20 chip_enable_user = 0;
    #7 output_enable_user = 0;
    #30 chip_enable_user = 1;
        output_enable_user = 1;
    #100 $stop;
end

    
  

sram dut (clock,					//fpga clock
        	reset,					//initiates al 1s in all data locations, 0 active
        	write_enable,			//if active (0) we can write in SRAM
	       output_enable,		//if active (0) we can read from SRAM
	       chip_enable,			//if active (0) we can use the chip
         lower_byte_ctrl, 		//selects lower bytes [0:7]
	       upper_byte_control,	//selects upper bytes [8:15]
	       sram_addr,		//18 bit address
        	sram_data, 	// bidirectional data bus
	//fpga input
        	address,
        	data,
        	write_enable_user,
        	chip_enable_user,
        	output_enable_user,
        	data_out_7_segm,		//data we read
        	address_7_segm,//,
        	//sram_address, 
        	//sram_data
        	address_to_display,
        	data_to_display
	);
	
	endmodule