`ifndef _SIMPLE_VH_
`define _SIMPLE_VH_

`default_nettype none  // making sure that this has no default nettype
`timescale 1us / 100ns

module simple (
    input logic clk,
    output logic [63:0] y
);

  logic [63:0] r;

  assign y = r;
  always @(posedge clk) begin
    r <= r + 1;
  end

endmodule

`endif  // _SIMPLE_VH_
