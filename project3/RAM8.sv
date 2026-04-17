module RAM8 (
    input logic [15:0] in,
    input logic load,
    clk,
    input logic [2:0] address,
    output logic [15:0] out
);
  logic reg1l, reg2l, reg3l, reg4l, reg5l, reg6l, reg7l, reg8l;
  DMux8Way select_where_to_load (
      .in (load),
      .sel(address),
      .a  (reg1l),
      .b  (reg2l),
      .c  (reg3l),
      .d  (reg4l),
      .e  (reg5l),
      .f  (reg6l),
      .g  (reg7l),
      .h  (reg8l)
  );

  logic [15:0] reg1o, reg2o, reg3o, reg4o, reg5o, reg6o, reg7o, reg8o;
  Register r1 (
      .in  (in),
      .load(reg1l),
      .clk (clk),
      .out (reg1o)
  );
  Register r2 (
      .in  (in),
      .load(reg2l),
      .clk (clk),
      .out (reg2o)
  );
  Register r3 (
      .in  (in),
      .load(reg3l),
      .clk (clk),
      .out (reg3o)
  );
  Register r4 (
      .in  (in),
      .load(reg4l),
      .clk (clk),
      .out (reg4o)
  );
  Register r5 (
      .in  (in),
      .load(reg5l),
      .clk (clk),
      .out (reg5o)
  );
  Register r6 (
      .in  (in),
      .load(reg6l),
      .clk (clk),
      .out (reg6o)
  );
  Register r7 (
      .in  (in),
      .load(reg7l),
      .clk (clk),
      .out (reg7o)
  );
  Register r8 (
      .in  (in),
      .load(reg8l),
      .clk (clk),
      .out (reg8o)
  );

  Mux8Way16 res (
      .a  (reg1o),
      .b  (reg2o),
      .c  (reg3o),
      .d  (reg4o),
      .e  (reg5o),
      .f  (reg6o),
      .g  (reg7o),
      .h  (reg8o),
      .sel(address),
      .out(out)

  );

endmodule
