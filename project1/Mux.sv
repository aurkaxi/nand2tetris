module Mux (
    input  logic a,
    input  logic b,
    input  logic sel,
    output logic out
);
  logic ns;
  Not g1 (
      .in (sel),
      .out(ns)
  );
  logic aa;
  logic ab;
  And g2 (
      .a  (a),
      .b  (ns),
      .out(aa)
  );
  And g3 (
      .a  (b),
      .b  (sel),
      .out(ab)
  );
  Or g4 (
      .a  (aa),
      .b  (ab),
      .out(out)
  );
endmodule
