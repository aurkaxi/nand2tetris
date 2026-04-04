module Add16 (
    input  logic [15:0] a,
    b,
    output logic [15:0] out
);
  logic c0, c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11, c12, c13, c14, _unused;
  HalfAdder g0 (
      .a(a[0]),
      .b(b[0]),
      .carry(c0),
      .sum(out[0])
  );
  FullAdder g1 (
      .a(a[1]),
      .b(b[1]),
      .c(c0),
      .carry(c1),
      .sum(out[1])
  );
  FullAdder g2 (
      .a(a[2]),
      .b(b[2]),
      .c(c1),
      .carry(c2),
      .sum(out[2])
  );
  FullAdder g3 (
      .a(a[3]),
      .b(b[3]),
      .c(c2),
      .carry(c3),
      .sum(out[3])
  );
  FullAdder g4 (
      .a(a[4]),
      .b(b[4]),
      .c(c3),
      .carry(c4),
      .sum(out[4])
  );
  FullAdder g5 (
      .a(a[5]),
      .b(b[5]),
      .c(c4),
      .carry(c5),
      .sum(out[5])
  );
  FullAdder g6 (
      .a(a[6]),
      .b(b[6]),
      .c(c5),
      .carry(c6),
      .sum(out[6])
  );
  FullAdder g7 (
      .a(a[7]),
      .b(b[7]),
      .c(c6),
      .carry(c7),
      .sum(out[7])
  );
  FullAdder g8 (
      .a(a[8]),
      .b(b[8]),
      .c(c7),
      .carry(c8),
      .sum(out[8])
  );
  FullAdder g9 (
      .a(a[9]),
      .b(b[9]),
      .c(c8),
      .carry(c9),
      .sum(out[9])
  );
  FullAdder g10 (
      .a(a[10]),
      .b(b[10]),
      .c(c9),
      .carry(c10),
      .sum(out[10])
  );
  FullAdder g11 (
      .a(a[11]),
      .b(b[11]),
      .c(c10),
      .carry(c11),
      .sum(out[11])
  );
  FullAdder g12 (
      .a(a[12]),
      .b(b[12]),
      .c(c11),
      .carry(c12),
      .sum(out[12])
  );
  FullAdder g13 (
      .a(a[13]),
      .b(b[13]),
      .c(c12),
      .carry(c13),
      .sum(out[13])
  );
  FullAdder g14 (
      .a(a[14]),
      .b(b[14]),
      .c(c13),
      .carry(c14),
      .sum(out[14])
  );
  FullAdder g15 (
      .a(a[15]),
      .b(b[15]),
      .c(c14),
      .carry(_unused),
      .sum(out[15])
  );
endmodule
