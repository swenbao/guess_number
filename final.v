module final(seven_reset,state,digit,clk,keypadCol,rst,keypadRow,show,match,o1,o2,o3,o4,o5,digit_4,digit_3,digit_2,digit_1,dot_row,dot_col1,dot_col2);

input state,clk,rst,match,show,seven_reset;
input [3:0] digit,keypadCol;
input digit_4,digit_3,digit_2,digit_1;

output [3:0] keypadRow;
output [6:0] o1,o2,o3,o4,o5;
output [7:0] dot_row,dot_col1,dot_col2;

wire div_clk,div_clk2;
wire [3:0] q1,q2,q3,q4,a1,a2,a3,a4;
wire [2:0] r_a,r_b;
wire [3:0] keypadBuf;
wire [1:0] digit_state;
wire state_num;

FrequencyDivider fd(clk,rst,div_clk);
FrequencyDivider2 fd2(clk,rst,div_clk2);
Checkkeypad cp(div_clk,rst,keypadRow,keypadCol,keypadBuf);
Controller md(state, rst,digit,keypadBuf,q1,q2,q3,q4,a1,a2,a3,a4,digit_4,digit_3,digit_2,digit_1,div_clk,digit_state, state_num);
Match mt(q1,q2,q3,q4,a1,a2,a3,a4,r_a,r_b,match);
SevenDisplay sd(r_a,r_b,o1,o2,o3,o4,show,keypadBuf,o5);
DotMatrix dm(show,r_a,match,digit_state,state_num,div_clk2,rst,dot_row,dot_col2,dot_col1);

endmodule 