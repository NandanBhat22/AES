module encryptFinalRound(
  input [127:0] in,
  input [127:0] key,
  output [127:0] out
);

  wire [127:0] subout;
  subBytes efr1(.in(in), .out(subout));

  wire [127:0] shiftout;
  shiftRows efr2(.in(subout), .out(shiftout));

  AddRoundKey efr3(.data(shiftout), .key(key), .out(out));
endmodule
