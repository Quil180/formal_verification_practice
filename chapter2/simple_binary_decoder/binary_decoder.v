// Ensures that the module is only included once
`ifndef _BINARY_DECODER_
`define _BINARY_DECODER_

`default_nettype none  // making sure that this has no default nettype
`timescale 1us / 100 ns

// This module compares 2 inputs and if the first input, i0, is larger than i1,
// it will return a greater than flag (gtf), of 1. This module will assume all
// inputs are unsigned.
module binary_decoder (
    input logic enable,     // enable signal
    input logic [1:0] in,   // input binary number
    output logic [3:0] out  // output decoded number
);

  assign out[0] = enable & (~in[1] & ~in[0]);
  assign out[1] = enable & ~in[1] & in[0];
  assign out[2] = enable & in[1] & ~in[0];
  assign out[3] = enable & in[1] & in[0];

endmodule

`endif
