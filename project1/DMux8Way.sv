module DMux8Way (
    input logic in,
    input logic [2:0] sel,
    output logic a,
    b,
    c,
    d,
    e,
    f,
    g,
    h
);
  logic p, q, r, s;
  DMux4Way g1 (
      .in (in),
      .sel(sel[2:1]),
      .a  (p),
      .b  (q),
      .c  (r),
      .d  (s)
  );
  DMux g2 (
      .in (p),
      .sel(sel[0]),
      .a  (a),
      .b  (b)
  );
  DMux g3 (
      .in (q),
      .sel(sel[0]),
      .a  (c),
      .b  (d)
  );
  DMux g4 (
      .in (r),
      .sel(sel[0]),
      .a  (e),
      .b  (f)
  );
  DMux g5 (
      .in (s),
      .sel(sel[0]),
      .a  (g),
      .b  (h)
  );
endmodule
