module Not16 (
    input  logic [15:0] in,
    output logic [15:0] out

);
  Not g0 (
      .in (in[0]),
      .out(out[0])
  );
  Not g1 (
      .in (in[1]),
      .out(out[1])
  );
  Not g2 (
      .in (in[2]),
      .out(out[2])
  );
  Not g3 (
      .in (in[3]),
      .out(out[3])
  );
  Not g4 (
      .in (in[4]),
      .out(out[4])
  );
  Not g5 (
      .in (in[5]),
      .out(out[5])
  );
  Not g6 (
      .in (in[6]),
      .out(out[6])
  );
  Not g7 (
      .in (in[7]),
      .out(out[7])
  );
  Not g8 (
      .in (in[8]),
      .out(out[8])
  );
  Not g9 (
      .in (in[9]),
      .out(out[9])
  );
  Not g10 (
      .in (in[10]),
      .out(out[10])
  );
  Not g11 (
      .in (in[11]),
      .out(out[11])
  );
  Not g12 (
      .in (in[12]),
      .out(out[12])
  );
  Not g13 (
      .in (in[13]),
      .out(out[13])
  );
  Not g14 (
      .in (in[14]),
      .out(out[14])
  );
  Not g15 (
      .in (in[15]),
      .out(out[15])
  );

  // 1.
  // SystemVerilog actually allows to instantiate an array of modules in a single line.
  // It automatically connects each bit of the bus to each instance.
  // This creates 16 'Not' gates and maps in[0] to g[0], in[1] to g[1], etc.
  // Not g [15:0] (.in(in), .out(out));

  // 2. using generating loop
  // genvar i;
  // generate
  // for (i = 0; i < 16; i = i + 1) begin : gen_not
  // Not gi (.in(in[i]), .out(out[i]));
  // end
  // endgenerate

endmodule
