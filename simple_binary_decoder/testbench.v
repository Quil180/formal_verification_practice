`default_nettype none `timescale 1ns / 10ps

`include "binary_decoder.v"

module testbench (
    input logic enable,     // enable signal
    input logic [1:0] in,   // input binary number
    output logic [3:0] out  // output decoded number
);

  // instantiating the simple module we made
  binary_decoder test (
      .enable(enable),
      .in(in),
      .out(out)
  );

  always_comb begin
    if (enable) begin
      case (in)
        2'b00:
          assert(out == 4'b0001);
        2'b01:
          assert(out == 4'b0010);
        2'b10:
          assert(out == 4'b0100);
        2'b11:
          assert(out == 4'b1000);
        default:
          assert(out == 4'bxxxx);
      endcase

    end else begin
      assert (out == 4'b0);
    end
  end

endmodule
