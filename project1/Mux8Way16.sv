module Mux8Way16 (
    input  logic [15:0] a,
    b,
    c,
    d,
    e,
    f,
    g,
    h,
    input  logic [ 2:0] sel,
    output logic [15:0] out
);
  logic [15:0] x, y;
  Mux4Way16 g1 (
      .a  (a),
      .b  (b),
      .c  (c),
      .d  (d),
      .sel(sel[1:0]),
      .out(x)
  );
  Mux4Way16 g2 (
      .a  (e),
      .b  (f),
      .c  (g),
      .d  (h),
      .sel(sel[1:0]),
      .out(y)
  );
  Mux16 g3 (
      .a  (x),
      .b  (y),
      .sel(sel[2]),
      .out(out)
  );
endmodule
