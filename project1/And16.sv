module And16 (
    input  logic [15:0] a,
    input  logic [15:0] b,
    output logic [15:0] out
);
  And g[15:0] (
      .a  (a),
      .b  (b),
      .out(out)
  );
endmodule

