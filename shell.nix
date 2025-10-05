# shell.nix for setting up development environment for Nixos/Nix
with (import <nixpkgs> {}); let
  my-python = python-packages:
    with python-packages; [
      find-libpython
      pip
    ];
  python-with-my-packages = python3.withPackages my-python;
in
  mkShell {
    buildInputs = [
      python-with-my-packages
      python312Packages.pip
			# Yosys for verification
			yosys
			yosys-synlig
			# Solver for yosys
			yices
			# SBY
			sby
			# other dependencies
			autoconf
			gperf
			# icarus verilog
			iverilog
			# gtkwave for waveform
			gtkwave
    ];
    shellHook = ''
			# python3 -m venv .cocotbvenv
			# source .cocotbvenv/bin/activate
			# pip3 install cocotb cocotb-bus pytest
			# cocotb-config --version
    '';
  }
