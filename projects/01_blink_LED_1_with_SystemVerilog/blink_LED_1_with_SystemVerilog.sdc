# clock
create_clock -period 20.000 [get_ports {clk}]
derive_clock_uncertainty

# I/O
set_output_delay -clock { clk } -min 2.5 [get_ports {led}]
set_output_delay -clock { clk } -max 4.5 [get_ports {led}]

# false path
set_false_path -from [get_ports rst_async] -to [get_registers {double_ff:double_ff_inst|temp}]
