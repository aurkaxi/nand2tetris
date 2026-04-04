module Inc16 (
    input  logic [15:0] in,
    output logic [15:0] out
);
  Add16 g1 (
      .a  (in),
      .b  (16'd1),
      .out(out)
  );
endmodule
