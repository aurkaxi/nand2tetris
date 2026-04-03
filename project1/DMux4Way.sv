module DMux4Way (
    input logic in,
    input logic [1:0] sel,
    output logic a,
    b,
    c,
    d
);
  logic x, y;
  DMux g1 (
      .in (in),
      .sel(sel[1]),
      .a  (x),
      .b  (y)
  );

  DMux g2 (
      .in (x),
      .sel(sel[0]),
      .a  (a),
      .b  (b)
  );
  DMux g3 (
      .in (y),
      .sel(sel[0]),
      .a  (c),
      .b  (d)
  );
endmodule
