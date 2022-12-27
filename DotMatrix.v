module DotMatrix(match,digit_state,qa_state,clk_div,reset,state,dot_row,dot_col);
input clk_div;
input match;
input reset;
input [1:0] digit_state;
input  qa_state;
output reg [7:0] dot_row;
output reg [7:0] dot_col;
reg [2:0] row_count;
always @(posedge clk_div or negedge reset)begin
if(!reset)begin //reset=0
	dot_row<=8'b11111111;
	dot_col<=8'd0;
	row_count<= 3'd0;
end
else begin //reset=1
	row_count<=row_count+1;
	case(row_count) //different row show
		3'd0: dot_row <= 8'b01111111;
		3'd1: dot_row <= 8'b10111111;
		3'd2: dot_row <= 8'b11011111;
		3'd3: dot_row <= 8'b11101111;
		3'd4: dot_row <= 8'b11110111;
		3'd5: dot_row <= 8'b11111011;
		3'd6: dot_row <= 8'b11111101;
		3'd7: dot_row <= 8'b11111110;
	endcase
	if(!match) begin
		case(digit_state)
			2'd0:begin //1st
			case(row_count)
			3'd0: dot_col <= 8'b00001000;
			3'd1: dot_col <= 8'b00011000;
			3'd2: dot_col <= 8'b00101000;
			3'd3: dot_col <= 8'b00001000;
			3'd4: dot_col <= 8'b00001000;
			3'd5: dot_col <= 8'b00001000;
			3'd6: dot_col <= 8'b00001000;
			3'd7: dot_col <= 8'b00111110;
			endcase
			end
			2'd1:begin //2nd
			case(row_count)
			3'd0: dot_col <= 8'b00011000;
			3'd1: dot_col <= 8'b00100100;
			3'd2: dot_col <= 8'b00100100;
			3'd3: dot_col <= 8'b00000100;
			3'd4: dot_col <= 8'b00001000;
			3'd5: dot_col <= 8'b00010000;
			3'd6: dot_col <= 8'b00100000;
			3'd7: dot_col <= 8'b00111100;
			endcase
			end
			2'd2:begin //3rd
			case(row_count)
			3'd0: dot_col <= 8'b00011000;
			3'd1: dot_col <= 8'b00100100;
			3'd2: dot_col <= 8'b00000100;
			3'd3: dot_col <= 8'b00001000;
			3'd4: dot_col <= 8'b00011100;
			3'd5: dot_col <= 8'b00000100;
			3'd6: dot_col <= 8'b00100100;
			3'd7: dot_col <= 8'b00011000;
			endcase
			end
			2'd3:begin //4th
			case(row_count)
				3'd0: dot_col <= 8'b00001000;
				3'd1: dot_col <= 8'b00010000;
				3'd2: dot_col <= 8'b00100000;
				3'd3: dot_col <= 8'b01001000;
				3'd4: dot_col <= 8'b01111110;
				3'd5: dot_col <= 8'b00001000;
				3'd6: dot_col <= 8'b00001000;
				3'd7: dot_col <= 8'b00001000;
			endcase
			end
		endcase
		case(qa_state)
		2'd0:begin //q
			case(row_count)
				3'd0: dot_col <= 8'b00111000;
				3'd1: dot_col <= 8'b01000100;
				3'd2: dot_col <= 8'b01000100;
				3'd3: dot_col <= 8'b01000100;
				3'd4: dot_col <= 8'b01010100;
				3'd5: dot_col <= 8'b01001100;
				3'd6: dot_col <= 8'b00111100;
				3'd7: dot_col <= 8'b00000010;
			endcase
			end
		2'd1:begin //a
			case(row_count)
				3'd0: dot_col <= 8'b00010000;
				3'd1: dot_col <= 8'b00101000;
				3'd2: dot_col <= 8'b01000100;
				3'd3: dot_col <= 8'b01000100;
				3'd4: dot_col <= 8'b01111100;
				3'd5: dot_col <= 8'b01000100;
				3'd6: dot_col <= 8'b01000100;
				3'd7: dot_col <= 8'b01000100;
			endcase
			end
		endcase
	end
	else begin
		case(state)
			2'd1:begin //good
			case(row_count)
			3'd0: dot_col <= 8'b00000000;
			3'd1: dot_col <= 8'b00110000;
			3'd2: dot_col <= 8'b01110000;
			3'd3: dot_col <= 8'b01111110;
			3'd4: dot_col <= 8'b11111110;
			3'd5: dot_col <= 8'b11111110;
			3'd6: dot_col <= 8'b11111110;
			3'd7: dot_col <= 8'b00000000;
			endcase
			end
			default:begin //bad
			case(row_count)
				3'd0: dot_col <= 8'b00000000;
				3'd1: dot_col <= 8'b11111110;
				3'd2: dot_col <= 8'b11111110;
				3'd3: dot_col <= 8'b11111110;
				3'd4: dot_col <= 8'b01111110;
				3'd5: dot_col <= 8'b00110000;
				3'd6: dot_col <= 8'b00110000;
				3'd7: dot_col <= 8'b00000000;
			endcase
			end
		endcase
	end
end
end
endmodule