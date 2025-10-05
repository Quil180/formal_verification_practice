// Ensures that the module is only included once
`ifndef _COMPARATOR_
`define _COMPARATOR_

`default_nettype none  // making sure that this has no default nettype
`timescale 1us / 100 ns

// This module compares 2 inputs and if both inputs are exactly the same, it
// will output a result, eq, of 1.
module comparator (
    input  logic i0,  // input one
    input  logic i1,  // input two
    output logic eq   // output result
);

  logic p0, p1;

  assign p0 = ~i0 & ~i1;
  assign p1 = i0 & i1;

  assign eq = p0 | p1;

endmodule

`endif  // _COMPARATOR_
