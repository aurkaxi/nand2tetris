module Xor (
    input  logic a,
    input  logic b,
    output logic out
);
  logic nab;
  nand g1 (nab, a, b);

  logic nax;
  nand g2 (nax, nab, a);
  logic nbx;
  nand g3 (nbx, nab, b);

  nand g4 (out, nax, nbx);
endmodule
