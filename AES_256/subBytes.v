//`include "sBox.v"
module subBytes(
  input [127:0] in,
  output [127:0] out
);

  sBox sb1 (.in(in[31:0]), .out(out[31:0]));
  sBox sb2 (.in(in[63:32]), .out(out[63:32]));
  sBox sb3 (.in(in[95:64]), .out(out[95:64]));
  sBox sb4 (.in(in[127:96]), .out(out[127:96]));

endmodule
