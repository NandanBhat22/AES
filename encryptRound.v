module encryptRound(
  input [127:0] in,
  input [127:0] key,
  output [127:0] out
);

  wire [127:0] subOut;
  wire [127:0] shiftRowsOut;
  wire [127:0] mixColumnsOut;

  subBytes er1(.in(in), .out(subOut));
  shiftRows er2(.in(subOut), .out(shiftRowsOut));
  mixColumns er3(.in(shiftRowsOut), .out(mixColumnsOut));
  AddRoundKey sr4(.data(mixColumnsOut), .key(key), .out(out));

endmodule
