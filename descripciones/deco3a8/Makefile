# Makefile automatically generated by ghdl
# Version: GHDL 0.37 (v0.37) [Dunoon edition] - mcode code generator
# Command used to generate this makefile:
# C:\Users\Dani\scoop\apps\ghdl\current\bin\ghdl.exe --gen-makefile deco3a8_tb

GHDL=C:\Users\Dani\scoop\apps\ghdl\current\bin\ghdl.exe
GHDLFLAGS=
GHDLRUNFLAGS=--vcd=$(ARG).vcd

# Default target : elaborate
all : elab

# Elaborate target.  Almost useless
elab : force
	$(GHDL) -c $(GHDLFLAGS) -e deco3a8_tb

# Run target
run : force
	$(GHDL) -c $(GHDLFLAGS) -r deco3a8_tb $(GHDLRUNFLAGS)

# Targets to analyze libraries
init: force
	# C:\Users\Dani\scoop\apps\ghdl\current\lib/ghdl\ieee\v93\../../src/ieee/v93/std_logic_1164.vhdl
	# C:\Users\Dani\scoop\apps\ghdl\current\lib/ghdl\ieee\v93\../../src/ieee/v93/std_logic_1164-body.vhdl
	# C:\Users\Dani\scoop\apps\ghdl\current\lib/ghdl\ieee\v93\../../src/ieee/v93/numeric_std.vhdl
	# C:\Users\Dani\scoop\apps\ghdl\current\lib/ghdl\ieee\v93\../../src/ieee/v93/numeric_std-body.vhdl
	$(GHDL) -a $(GHDLFLAGS) .\deco3a8_tb.vhdl
	$(GHDL) -a $(GHDLFLAGS) .\deco3a8.vhdl

force:
