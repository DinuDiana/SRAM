module interfata (input clock,
						input write_enable,
						input chip_enable,
						input output_enable,
						input [3:0] data_in,
						input [3:0] address,
						output [6:0] data_out_7_segm,		//data we read
						output [6:0] address_7_segm,		//address from which we read
						output reg write_enable_to_chip,
						output reg chip_enable_to_chip,
						output reg output_enable_to_chip,
						//input data_from_sram,
						output [17:0] sram_address,
						inout [15:0] sram_data
						);		
		


endmodule
		
/*
//reg [15:0] memorie [0:262143];
//wire [17:0] sram_address;
reg [3:0] address_to_display;
reg [6:0] data_to_display;
reg [1:0] count=0;

assign sram_address = {address, 14'b0};
assign sram_data = {data_in, 12'b0};

localparam [2:0] q0=0, q1=1, q2=2, q3=3, q4=4, q5 = 5;
reg [2:0] state, next_state;

always @ (posedge clock)
	state <= next_state;

always @ (posedge clock)
	case (state)
		q0: next_state = (chip_enable == 0) ? q1 : q0;
		q1: next_state = (write_enable == 0) ? q3 : q2;
		q2: next_state = (output_enable == 0) ? q5: q0;
		q3: next_state = (count == 2'b10) ? q4 : q3;
		q4: next_state = q0;
		q5: next_state = q0;
		default: next_state = q0;
	endcase

always @ (posedge clock)
	case(state)
		q0: begin count=0;
						address_to_display = 4'hz; 
						data_to_display = 4'hz; 
						write_enable_to_chip = 1; 
						output_enable_to_chip = 1;
						chip_enable_to_chip = 1;
			end
		q1: begin count = 0;
		        address_to_display = 4'hz; 
						data_to_display = 4'hz; 
						write_enable_to_chip = 1; 
						output_enable_to_chip = 1;
						chip_enable_to_chip = 0;
			end 
		q2: begin count = 0;
		        address_to_display = 4'hz; 
						data_to_display = 4'hz; 
						write_enable_to_chip = 1; 
						output_enable_to_chip = 0;
						chip_enable_to_chip = 0;
			end
		q3: begin count = count+1; 
						address_to_display = 4'hz; 
						data_to_display = 4'hz; 
						write_enable_to_chip = 0; 
						output_enable_to_chip = 1;
						chip_enable_to_chip = 0;
			end
		q4: begin count = 0;                  //se scrie efectiv
						address_to_display = 4'hz; 
						data_to_display = 4'hz;  
						write_enable_to_chip = 1; 
						output_enable_to_chip = 1;
						chip_enable_to_chip = 1;
			end
		q5: begin count = 0;                  //se citeste efectiv
						address_to_display = address; 
						data_to_display = sram_data;  
						write_enable_to_chip = 1; 
						output_enable_to_chip = 1;
						chip_enable_to_chip = 1;
			end
		default: begin count = 0;
		        address_to_display = 4'hz; 
						data_to_display = 4'hz; 
						write_enable_to_chip = 1; 
						output_enable_to_chip = 1;
						chip_enable_to_chip = 1;
			end
	endcase

/*
//scriere	
always @ (posedge clock)	//sincrona
		if (write_enable == 0)	//activ pe 0
			memorie[sram_address] <= data_in;

//citire
always @ (posedge clock)	//sincrona
		if (output_enable == 0)	//activ pe 0
		begin
			data_to_display <= memorie[address];
			address_to_display <= sram_address[17:14];
		end

segments afisaj_adresa (address_to_display, address_7_segments);
segments afisaj_date (data_to_display, data_out_7_segments);	



		
endmodule */