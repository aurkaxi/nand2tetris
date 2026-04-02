module And (
    input  logic a,
    input  logic b,
    output logic out
);
  logic nand_out;
  nand nd1 (nand_out, a, b);
  Not n (
      .in (nand_out),
      .out(out)
  );
endmodule
