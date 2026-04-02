module Or (
    input  logic a,
    input  logic b,
    output logic out
);
  logic nota;
  logic notb;

  Not ng1 (
      .in (a),
      .out(nota)
  );
  Not ng2 (
      .in (b),
      .out(notb)
  );
  nand res (out, nota, notb);
endmodule
