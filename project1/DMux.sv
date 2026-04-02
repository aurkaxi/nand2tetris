module DMux (
    input  logic in,
    input  logic sel,
    output logic a,
    output logic b
);
  logic ns;
  nand g1 (ns, sel, sel);
  logic na;
  nand g2 (na, in, ns);
  nand g3 (a, na, na);

  logic nb;
  nand g4 (nb, in, sel);
  nand g5 (b, nb, nb);
endmodule
