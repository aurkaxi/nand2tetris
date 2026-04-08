module Bit (
    input  logic in,
    load,
    clk,
    output logic out
);
  logic dffout, muxout;
  Mux g1 (
      .a  (dffout),
      .b  (in),
      .sel(load),
      .out(muxout)
  );
  DFF g2 (
      .in (muxout),
      .clk(clk),
      .out(dffout)
  );
  Or g3 (
      .a  (dffout),
      .b  (dffout),
      .out(out)
  );
endmodule
