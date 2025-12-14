//`include "sTable.v"

module sBox (
   input [0:31] in,
   output [0:31] out
);

  sTable st1 (.inByte (in[0:7]),.outByte(out[0:7]));
  sTable st2 (.inByte (in[8:15]),.outByte(out[8:15]));
  sTable st3 (.inByte (in[16:23]),.outByte(out[16:23]));
  sTable st4 (.inByte (in[24:31]),.outByte(out[24:31]));

endmodule
