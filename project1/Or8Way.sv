module Or8Way (
    input logic [7:0] in,
    output logic out
);
  logic or01, or23, or45, or67;
  Or g1 (
      .a  (in[0]),
      .b  (in[1]),
      .out(or01)
  );
  Or g2 (
      .a  (in[2]),
      .b  (in[3]),
      .out(or23)
  );
  Or g3 (
      .a  (in[4]),
      .b  (in[5]),
      .out(or45)
  );
  Or g4 (
      .a  (in[6]),
      .b  (in[7]),
      .out(or67)
  );

  logic or03, or47;
  Or g5 (
      .a  (or01),
      .b  (or23),
      .out(or03)
  );
  Or g6 (
      .a  (or45),
      .b  (or67),
      .out(or47)
  );

  Or g7 (
      .a  (or03),
      .b  (or47),
      .out(out)
  );
endmodule
