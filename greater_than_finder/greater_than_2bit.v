// Ensures that the module is only included once
`ifndef _GREATER_THAN_2BIT_
`define _GREATER_THAN_2BIT_

`default_nettype none  // making sure that this has no default nettype
`timescale 1us / 100 ns

// This module compares 2 inputs and if the first input, i0, is larger than i1,
// it will return a greater than flag (gtf), of 1. This module will assume all
// inputs are unsigned.
module greater_than_2bit (
    input logic [1:0] i0,  // input one
    input logic [1:0] i1,  // input two
    output logic gtf  // greater than flag
);

  logic A, B, C, D;

  assign A   = i0[1];
  assign B   = i0[0];

  assign C   = i1[1];
  assign D   = i1[0];

  assign gtf = (~C & A) | (B & ~D) & (~C | A);


endmodule

`endif
