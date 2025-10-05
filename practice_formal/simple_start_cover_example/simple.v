// Ensures that the module is only included once
`ifndef _SIMPLE_VH_
`define _SIMPLE_VH_

`default_nettype none  // making sure that this has no default nettype
`timescale 1us / 100 ns

module simple (
    input  logic [63:0] a,
    input  logic [63:0] b,
    output logic [63:0] sum
);

  // Subtracting via a weird method for demonstration purposes
  assign sum = a + (~b + 1);

`ifdef NORMAL
  // you could put assertions here (this is cringe, though)
`endif

endmodule

`endif  // _SIMPLE_VH_
