//`include "kec.v"

module keyExpansion (input [0:255] key,
                     output [0:1919] expandedKey);

  wire [0:31] sbout1, sbout2, sbout3, sbout4, sbout5, sbout6, sbout7, sbout8, kecout1, kecout2, kecout3, kecout4, kecout5, kecout6, kecout7;
  wire [0:127] key1, key2, key3, key4, key5, key6, key7, key8, key9, key10, key11, key12, key13, key14, key15;
  reg [0:31] w0, w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13, w14, w15,
              w16, w17, w18, w19, w20, w21, w22, w23, w24, w25, w26, w27, w28, w29, w30, w31,
              w32, w33, w34, w35, w36, w37, w38, w39, w40, w41, w42, w43, w44, w45, w46, w47,
              w48, w49, w50, w51, w52, w53, w54, w55, w56, w57, w58, w59;
 
  always @(*) begin
    w0 = key[0:31];
    w1 = key[32:63];
    w2 = key[64:95];
    w3 = key[96:127];
    w4 = key[128:159];
    w5 = key[160:191];
    w6 = key[192:223];
    w7 = key[224:255];

    w8 = w0 ^ kecout1;

    w9 = w1 ^ w8;
    w10 = w2 ^ w9;
    w11 = w3 ^ w10;

    w12 = w4 ^ sbout1;

    w13 = w5 ^ w12;
    w14 = w6 ^ w13;
    w15 = w7 ^ w14;

    w16 = w8 ^ kecout2;

    w17 = w9 ^ w16;
    w18 = w10 ^ w17;
    w19 = w11 ^ w18;

    w20 = w12 ^ sbout2;

    w21 = w13 ^ w20;
    w22 = w14 ^ w21;
    w23 = w15 ^ w22;

    w24 = w16 ^ kecout3;

    w25 = w17 ^ w24;
    w26 = w18 ^ w25;
    w27 = w19 ^ w26;

    w28 = w20 ^ sbout3;

    w29 = w21 ^ w28;
    w30 = w22 ^ w29;
    w31 = w23 ^ w30;

    w32 = w24 ^ kecout4;

    w33 = w25 ^ w32;
    w34 = w26 ^ w33;
    w35 = w27 ^ w34;

    w36 = w28 ^ sbout4;

    w37 = w29 ^ w36;
    w38 = w30 ^ w37;
    w39 = w31 ^ w38;

    w40 = w32 ^ kecout5;

    w41 = w33 ^ w40;
    w42 = w34 ^ w41;
    w43 = w35 ^ w42;

    w44 = w36 ^ sbout5;

    w45 = w37 ^ w44;
    w46 = w38 ^ w45;
    w47 = w39 ^ w46;

    w48 = w40 ^ kecout6;

    w49 = w41 ^ w48;
    w50 = w42 ^ w49;
    w51 = w43 ^ w50;

    w52 = w44 ^ sbout6;

    w53 = w45 ^ w52;
    w54 = w46 ^ w53;
    w55 = w47 ^ w54;

    w56 = w48 ^ kecout7;

    w57 = w49 ^ w56;
    w58 = w50 ^ w57;
    w59 = w51 ^ w58;

    /*
    sBox sbox60(w59, sbout7);
    w60 = w52 ^ sbout7;
    */
  end

  kec kec8(w7, 4'd0, kecout1);
  kec kec16(w15, 4'd1, kecout2);
  kec kec24(w23, 4'd2, kecout3);
  kec kec32(w31, 4'd3, kecout4);
  kec kec40(w39, 4'd4, kecout5);
  kec kec48(w47, 4'd5, kecout6);
  kec kec56(w55, 4'd6, kecout7);

  sBox sbox12(w11, sbout1);
  sBox sbox20(w19, sbout2);
  sBox sbox28(w27, sbout3);
  sBox sbox36(w35, sbout4);
  sBox sbox44(w43, sbout5);
  sBox sbox52(w51, sbout6);

  assign key1 = {w0, w1, w2, w3};
  assign key2 = {w4, w5, w6, w7};
  assign key3 = {w8, w9, w10, w11};
  assign key4 = {w12, w13, w14, w15};
  assign key5 = {w16, w17, w18, w19};
  assign key6 = {w20, w21, w22, w23};
  assign key7 = {w24, w25, w26, w27};
  assign key8 = {w28, w29, w30, w31};
  assign key9 = {w32, w33, w34, w35};
  assign key10 = {w36, w37, w38, w39};
  assign key11 = {w40, w41, w42, w43};
  assign key12 = {w44, w45, w46, w47};
  assign key13 = {w48, w49, w50, w51};
  assign key14 = {w52, w53, w54, w55};
  assign key15 = {w56, w57, w58, w59};

  assign expandedKey = {key1, key2, key3, key4, key5, key6, key7, key8, key9, key10, key11, key12, key13, key14, key15};
 endmodule
