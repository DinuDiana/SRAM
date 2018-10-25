module segments(
		input [3:0] in, 			//data to be displayed
		input enable, 				//makes the display active
		output reg [6:0] out		//7 segments display data
		);

always @(*)
	begin
		if(enable==1)				//hex display is off
			out=7'b111_1111;
		else 
			if(enable==0)			//hex display is on
				case(in)
					0: out= 7'b000_0001;
					1: out= 7'b100_1111;
					2: out= 7'b001_0010;
					3: out= 7'b000_0110;
					4: out= 7'b100_1100;
					5: out= 7'b010_0101;
					6: out= 7'b000_0010;
					7: out= 7'b000_1111;
					8: out= 7'b000_0000;
					9: out= 7'b000_0100;
					10:out= 7'b000_1000;
					11:out= 7'b110_0000;
					12:out= 7'b011_0001;
					13:out= 7'b100_0010;
					14:out= 7'b011_0000;
					15:out= 7'b011_1000;
					default: out= 7'b011_0000;
				endcase
	end

endmodule