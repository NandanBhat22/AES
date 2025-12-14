//`include "mul3.v"

module mixColumns(
  input [127:0] in,
  output [127:0] out
);
  //i = 0
  wire [7:0] m200out, m300out;
  mul2 m200(in[24 +: 8], m200out);
  mul3 m300(in[16 +: 8], m300out);
  assign out[24 +: 8] = m200out ^ m300out ^ in[8 +: 8] ^ in[0 +: 8];

  wire [7:0] m201out, m301out;
  mul2 m201(in[16 +: 8], m201out);
  mul3 m301(in[8 +: 8], m301out);
  assign out[16 +: 8] = in[24 +: 8] ^ m201out ^ m301out ^ in[0 +: 8];

  wire [7:0] m202out, m302out;
  mul2 m202(in[8 +: 8], m202out);
  mul3 m302(in[0 +: 8], m302out);
  assign out[8 +: 8] =  in[24 +: 8] ^ in[16 +: 8] ^ m202out ^ m302out;

  wire [7:0] m203out, m303out;
  mul2 m203(in[0 +: 8], m203out);
  mul3 m303(in[24 +: 8], m303out);
  assign out[0 +: 8] = m303out ^ in[16 +: 8] ^ in[8 +: 8] ^ m203out;


  //i = 1
  wire [7:0] m210out, m310out;
  mul2 m210(in[56 +: 8], m210out);
  mul3 m310(in[48 +: 8], m310out);
  assign out[56 +: 8] = m210out ^ m310out ^ in[40 +:8] ^ in[32 +:8];

  wire [7:0] m211out, m311out;
  mul2 m211(in[48 +: 8], m211out);
  mul3 m311(in[40 +: 8], m311out);
  assign out[48 +: 8] = in[56 +: 8] ^ m211out ^ m311out ^ in[32 +:8];

  wire [7:0] m212out, m312out;
  mul2 m212(in[40 +: 8], m212out);
  mul3 m312(in[32 +: 8], m312out);
  assign out[40 +: 8] = in[56 +: 8] ^ in[48 +: 8] ^ m212out ^ m312out;

  wire [7:0] m213out, m313out;
  mul2 m213(in[32 +: 8], m213out);
  mul3 m313(in[56 +: 8], m313out);
  assign out[32 +: 8] = m313out ^ in[48 +: 8] ^ in[40 +: 8] ^ m213out;


  //i = 2
  wire [7:0] m220out, m320out;
  mul2 m220(in[88 +: 8], m220out);
  mul3 m320(in[80 +: 8], m320out);
  assign out[88 +: 8] = m220out ^ m320out ^ in[72 +:8] ^ in[64 +:8];

  wire [7:0] m221out, m321out;
  mul2 m221(in[80 +: 8], m221out);
  mul3 m321(in[72 +: 8], m321out);
  assign out[80 +: 8] = in[88 +: 8] ^ m221out ^ m321out ^ in[64 +:8];

  wire [7:0] m222out, m322out;
  mul2 m222(in[72 +: 8], m222out);
  mul3 m322(in[64 +: 8], m322out);
  assign out[72 +: 8] = in[88 +: 8] ^ in[80 +: 8] ^ m222out ^ m322out;

  wire [7:0] m223out, m323out;
  mul2 m223(in[64 +: 8], m223out);
  mul3 m323(in[88 +: 8], m323out);
  assign out[64 +: 8] = m323out ^ in[80 +: 8] ^ in[72 +: 8] ^ m223out;


  //i = 3
  wire [7:0] m230out, m330out;
  mul2 m230(in[120 +: 8], m230out);
  mul3 m330(in[112 +: 8], m330out);
  assign out[120 +: 8] = m230out ^ m330out ^ in[104 +:8] ^ in[96 +:8];

  wire [7:0] m231out, m331out;
  mul2 m231(in[112 +: 8], m231out);
  mul3 m331(in[104 +: 8], m331out);
  assign out[112 +: 8] = in[120 +: 8] ^ m231out ^ m331out ^ in[96 +:8];

  wire [7:0] m232out, m332out;
  mul2 m232(in[104 +: 8], m232out);
  mul3 m332(in[96 +: 8], m332out);
  assign out[104 +: 8] = in[120 +: 8] ^ in[112 +: 8] ^ m232out ^ m332out;

  wire [7:0] m233out, m333out;
  mul2 m233(in[96 +: 8], m233out);
  mul3 m333(in[120 +: 8], m333out);
  assign out[96 +: 8] = m333out ^ in[112 +: 8] ^ in[104 +: 8] ^ m233out;

endmodule
