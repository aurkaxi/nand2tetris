module Not (
    input  logic in,
    output logic out
);
  nand g1 (out, in, in);
endmodule
