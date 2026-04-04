module ALU (
    input logic [15:0] x,
    y,  // 16 bit inputs
    input logic zx,  // zero the x input?
    nx,  // negate the x input?
    zy,  // zero the y input?
    ny,  // negate the
    f,  // compute x+y or x&y?
    no,  // negate the output?
    output logic [15:0] out,
    output logic zr,  // is out 0?
    ng  // is out negative
);
  // finalizing X
  logic [15:0] XorZ, notX, XorZorNot;
  Mux16 g1 (
      .a  (x),
      .b  (16'd0),
      .sel(zx),
      .out(XorZ)
  );
  Not16 g2 (
      .in (XorZ),
      .out(notX)
  );
  Mux16 g3 (
      .a  (XorZ),
      .b  (notX),
      .sel(nx),
      .out(XorZorNot)
  );

  // finalizing Y
  logic [15:0] YorZ, notY, YorZorNot;
  Mux16 g4 (
      .a  (y),
      .b  (16'd0),
      .sel(zy),
      .out(YorZ)
  );
  Not16 g5 (
      .in (YorZ),
      .out(notY)
  );
  Mux16 g6 (
      .a  (YorZ),
      .b  (notY),
      .sel(ny),
      .out(YorZorNot)
  );

  // function
  logic [15:0] XandY, XaddY, XopY;
  And16 g7 (
      .a  (XorZorNot),
      .b  (YorZorNot),
      .out(XandY)
  );
  Add16 g8 (
      .a  (XorZorNot),
      .b  (YorZorNot),
      .out(XaddY)
  );
  Mux16 g9 (
      .a  (XandY),
      .b  (XaddY),
      .sel(f),
      .out(XopY)
  );

  // finalizing output
  logic [15:0] XopYnot;
  Not16 g10 (
      .in (XopY),
      .out(XopYnot)
  );
  Mux16 g11 (
      .a  (XopY),
      .b  (XopYnot),
      .sel(no),
      .out(out)
  );

  logic [7:0] outLSB;
  logic [6:0] outMSB;
  logic outMSBbit;
  assign {outMSBbit, outMSB, outLSB} = out;

  // zero flag
  logic XYor1, XYor2, XYorFinal;
  Or8Way g12 (
      .in (outLSB),
      .out(XYor1)
  );
  Or8Way g13 (
      .in ({outMSBbit, outMSB}),
      .out(XYor2)
  );
  Or g14 (
      .a  (XYor1),
      .b  (XYor2),
      .out(XYorFinal)
  );
  Not g15 (
      .in (XYorFinal),
      .out(zr)
  );

  // negative flag
  Or g16 (
      .a  (outMSBbit),
      .b  (1'b0),
      .out(ng)
  );

endmodule
