module Encrypt(
  input clk,
  input rst,
  input [127:0] in,
  input [255:0] key,
  output [127:0] out
);

  wire [1919:0] expandedkeys;
  wire [127:0] states [14:0];

  reg [127:0] states_buff [14:0];

//  wire [127:0] afterSubBytes;
// wire [127:0] afterShiftRows;

  keyExpansion ke(key, expandedkeys);
  AddRoundKey akrnd0(in, expandedkeys[1919 -: 128], states[0]);

  encryptRound rnd1(states_buff[0], expandedkeys[1791 -: 128], states[1]);
  encryptRound rnd2(states_buff[1], expandedkeys[1663 -: 128], states[2]);
  encryptRound rnd3(states_buff[2], expandedkeys[1535 -: 128], states[3]);
  encryptRound rnd4(states_buff[3], expandedkeys[1407 -: 128], states[4]);
  encryptRound rnd5(states_buff[4], expandedkeys[1279 -: 128], states[5]);
  encryptRound rnd6(states_buff[5], expandedkeys[1151 -: 128], states[6]);
  encryptRound rnd7(states_buff[6], expandedkeys[1023 -: 128], states[7]);
  encryptRound rnd8(states_buff[7], expandedkeys[895 -: 128], states[8]);
  encryptRound rnd9(states_buff[8], expandedkeys[767 -: 128], states[9]);
  encryptRound rnd10(states_buff[9], expandedkeys[639 -: 128], states[10]);
  encryptRound rnd11(states_buff[10], expandedkeys[511 -: 128], states[11]);
  encryptRound rnd12(states_buff[11], expandedkeys[383 -: 128], states[12]);
  encryptRound rnd13(states_buff[12], expandedkeys[255 -: 128], states[13]);
  encryptFinalRound rnd14(states_buff[13], expandedkeys[127:0], out); 
/*
  subBytes sbrnd14(states_buff[13], afterSubBytes);
  shiftRows srrnd14(afterSubBytes, afterShiftRows);
  AddRoundKey akrnd14(afterShiftRows, expandedkeys[127:0], states[14]);
  assign out = states[14];
*/

  always @(posedge clk) begin
    if(rst) begin
      states_buff[0] <= 128'b0;
      states_buff[1] <= 128'b0;
      states_buff[2] <= 128'b0;
      states_buff[3] <= 128'b0;
      states_buff[4] <= 128'b0;
      states_buff[5] <= 128'b0;
      states_buff[6] <= 128'b0;
      states_buff[7] <= 128'b0;
      states_buff[8] <= 128'b0;
      states_buff[9] <= 128'b0;
      states_buff[10] <= 128'b0;
      states_buff[11] <= 128'b0;
      states_buff[12] <= 128'b0;
      states_buff[13] <= 128'b0;
      states_buff[14] <= 128'b0;
    end else begin
      states_buff[0] <= states[0];
      states_buff[1] <= states[1];
      states_buff[2] <= states[2];
      states_buff[3] <= states[3];
      states_buff[4] <= states[4];
      states_buff[5] <= states[5];
      states_buff[6] <= states[6];
      states_buff[7] <= states[7];
      states_buff[8] <= states[8];
      states_buff[9] <= states[9];
      states_buff[10] <= states[10];
      states_buff[11] <= states[11];
      states_buff[12] <= states[12];
      states_buff[13] <= states[13];
      states_buff[14] <= states[14];
    end
  end
endmodule
