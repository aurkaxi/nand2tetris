module Mux4Way16 (
    input  logic [15:0] a,
    input  logic [15:0] b,
    input  logic [15:0] c,
    input  logic [15:0] d,
    input  logic [ 1:0] sel,
    output logic [15:0] out
);
  logic [15:0] x, y;
  Mux16 g1 (
      .a  (a),
      .b  (b),
      .sel(sel[0]),
      .out(x)
  );
  Mux16 g2 (
      .a  (c),
      .b  (d),
      .sel(sel[0]),
      .out(y)
  );
  Mux16 g3 (
      .a  (x),
      .b  (y),
      .sel(sel[1]),
      .out(out)
  );
endmodule
