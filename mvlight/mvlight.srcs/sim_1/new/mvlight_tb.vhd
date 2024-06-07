----------------------------------------------------------------------------------
-- Engineer: Saeed Omidvari
-- Create Date: 05/31/2024 09:01:10 PM
-- Design Name: Rotate Pattern left/right as sequential VHDL Design
-- Target Devices: ZedBoard
-- Pushbuttons:
-- o BTNL:  rotate left
-- o BTNR:  rotate right
-- o BTNC:  stop rotation
-- o BTND:  load new pattern from switches
--The rotation frequency shall be 6 Hz (derived from 100 MHz system clk).
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mvlight_tb is
end mvlight_tb;

architecture Behavioral of mvlight_tb is
component mvlight is
    Port ( clk     : in STD_LOGIC;
           btnd    : in STD_LOGIC;
           btnl    : in STD_LOGIC;
           btnc    : in STD_LOGIC;
           btnr    : in STD_LOGIC;
           zswitch : in STD_LOGIC_VECTOR (7 downto 0);
           zled    : out STD_LOGIC_VECTOR (7 downto 0));
end component mvlight;

signal clk     :  STD_LOGIC := '0';
signal btnd    :  STD_LOGIC := '0';
signal btnl    :  STD_LOGIC := '0';
signal btnc    :  STD_LOGIC := '0';
signal btnr    :  STD_LOGIC := '0';
signal zswitch :  STD_LOGIC_VECTOR (7 downto 0) := x"f1";
signal zled    :  STD_LOGIC_VECTOR (7 downto 0) := x"00";
constant clk_period : time := 10 ns;

begin
    uut: mvlight 
    port map(   clk     => clk,
                btnd    => btnd,
                btnl    => btnl,
                btnc    => btnc,
                btnr    => btnr,
                zswitch => zswitch,
                zled    => zled);
    clk_p : process
    begin
        wait for clk_period/2;
        clk <= '1';
        wait for clk_period/2;
        clk <= '0';
    end process clk_p;
    stim_p : process
    begin
        wait for clk_period*4;
        btnl <= '1';
        wait for clk_period;
        btnl <= '0';
        wait for clk_period*20;
        btnr <= '1';
        wait for clk_period ;
        btnr <= '0';
        wait for clk_period*20;
        btnc <= '1';
        wait for clk_period ;
        btnc <= '0';
        wait for clk_period*6;                        
        btnd <= '1';
        wait for clk_period*4 ;
        btnd <= '0';
        WAIT;
    end process stim_p;
end Behavioral;
