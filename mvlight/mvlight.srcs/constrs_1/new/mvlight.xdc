# ZedBoard
#define clk and period
create_clock -period 10.000 -name clk -waveform {0.000 5.000} [get_ports clk];
set_property PACKAGE_PIN Y9 [get_ports clk];
set_property IOSTANDARD LVCMOS33 [get_ports clk];
#------------------------------------------------------------------------------------
#User DIP Switches - Bank 35
#------------------------------------------------------------------------------------
set_property PACKAGE_PIN F22 [get_ports zswitch[0]]; # "SW0
set_property PACKAGE_PIN G22 [get_ports zswitch[1]]; # "SW1
set_property PACKAGE_PIN H22 [get_ports zswitch[2]]; # "SW2
set_property PACKAGE_PIN E21 [get_ports zswitch[3]]; # "SW3
set_property PACKAGE_PIN H19 [get_ports zswitch[4]]; # "SW4
set_property PACKAGE_PIN H18 [get_ports zswitch[5]]; # "SW5
set_property PACKAGE_PIN H17 [get_ports zswitch[6]]; # "SW6
set_property PACKAGE_PIN M15 [get_ports zswitch[7]]; # "SW7
set_property IOSTANDARD LVCMOS18 [get_ports zswitch];
#------------------------------------------------------------------------------------
#User LEDs - Bank 33
#------------------------------------------------------------------------------------
set_property PACKAGE_PIN T22 [get_ports zled[0]]; # "LD0
set_property PACKAGE_PIN T21 [get_ports zled[1]]; # "LD1
set_property PACKAGE_PIN U22 [get_ports zled[2]]; # "LD2
set_property PACKAGE_PIN U21 [get_ports zled[3]]; # "LD3
set_property PACKAGE_PIN V22 [get_ports zled[4]]; # "LD4
set_property PACKAGE_PIN W22 [get_ports zled[5]]; # "LD5
set_property PACKAGE_PIN U19 [get_ports zled[6]]; # "LD6
set_property PACKAGE_PIN Ul4 [get_ports zled[7]]; # "LD7
set_property IOSTANDARD LVCMOS33 [get_ports zled]; # "LD8
#------------------------------------------------------------------------------------
#User Push Button - Bank 34
#------------------------------------------------------------------------------------
set_property PACKAGE_PIN Pl6 [get_ports btnc]; # "BTNC
set_property IOSTANDARD LVCMOS18 [get_ports btnc];
set_property PACKAGE_PIN R16 [get_ports btnd]; # "BTND
set_property IOSTANDARD LVCMOS18 [get_ports btnd];
set_property PACKAGE_PIN N15 [get_ports btnl]; # "BTNL
set_property IOSTANDARD LVCMOS18 [get_ports btnl];
set_property PACKAGE_PIN R18 [get_ports btnr]; # "BTNR
set_property IOSTANDARD LVCMOS18 [get_ports btnr];