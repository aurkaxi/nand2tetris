module FullAdder (
    input  logic a,
    b,
    c,
    output logic sum,
    carry
);
  logic AnB, AnBnA, AnBnB, AxB;
  nand g1 (AnB, a, b);
  nand g2 (AnBnA, AnB, a);
  nand g3 (AnBnB, AnB, b);
  nand g4 (AxB, AnBnA, AnBnB);

  logic AxBnC, AxBnCnAxB, AxBnCnC;
  nand g5 (AxBnC, AxB, c);
  nand g6 (AxBnCnAxB, AxBnC, AxB);
  nand g7 (AxBnCnC, AxBnC, c);
  nand g8 (sum, AxBnCnAxB, AxBnCnC);

  nand g9 (carry, AnB, AxBnC);
endmodule
