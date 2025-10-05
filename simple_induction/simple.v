`ifndef _SIMPLE_VH_
`define _SIMPLE_VH_

`default_nettype none  // making sure that this has no default nettype
`timescale 1us / 100ns

module simple (
    input logic clk,
    input logic we,  // write enable
    input logic [63:0] in,
    output logic [63:0] y
);

  logic [63:0] r;
  initial r <= 0;

  assign y = r;
  always @(posedge clk) begin
    if (we) begin
      r <= in;
    end
  end

endmodule

`endif  // _SIMPLE_VH_
