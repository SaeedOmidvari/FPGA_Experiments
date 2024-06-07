----------------------------------------------------------------------------------
-- Engineer: Saeed Omidvari
-- Create Date: 05/31/2024 09:01:10 PM
-- Design Name: Rotate Pattern left/right as sequential VHDL Design
-- Module Name: mvlight - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

entity mvlight is
    Port ( clk     : in STD_LOGIC;
           btnd    : in STD_LOGIC;
           btnl    : in STD_LOGIC;
           btnc    : in STD_LOGIC;
           btnr    : in STD_LOGIC;
           zswitch : in STD_LOGIC_VECTOR (7 downto 0);
           zled    : out STD_LOGIC_VECTOR (7 downto 0));
end mvlight;

architecture Behavioral of mvlight is

--for simulation
constant max_count : integer := 4;
--for hardware(100MHz divided by 6Hz) = 16666667
--constant max_count : integer := 16666667;
subtype COUNTER_TYPE is integer range 0 to max_count-1;
signal pulse_6Hz : std_logic := '0';
signal mv_left   : std_logic := '0';
signal mv_right  : std_logic := '0';
signal led_reg   : std_logic_vector(7 downto 0) := x"03"; --the default status of the LEDs is 00000011

begin
    zled <= led_reg; --LED values are loaded by the value of the LED registers
    --during this process a frequency of 6 Hz is generated.
    cnt_p : process(clk) 
    variable cnt : COUNTER_TYPE := max_count-1;
    begin
        if rising_edge(clk) then
            pulse_6Hz <= '0';
            if cnt=0 then
                pulse_6Hz <= '1';
                cnt := max_count-1;
            else
                cnt:=cnt-1;
            end if;
        end if;
    end process cnt_p;
    --This process defines the function of each pushbutton.
    opr_p : process(clk)
    begin
        if rising_edge(clk) then
            if btnl='1' then      -- Left button
                mv_left <= '1';
                mv_right <= '0';
            elsif btnr='1' then   -- Right button
                mv_left <= '0';
                mv_right <= '1';
            elsif btnc = '1' then -- Stop button
                mv_left <= '0';
                mv_right <= '0';
            end if;
        end if;
    end process opr_p;
    --During this process, the value of the inputs is loaded
    --into the LED registers when the 6 Hz pulse is generated.
    rot_p : process(clk)
    begin
        if rising_edge(clk) then
            if pulse_6Hz='1' then
                if btnd='1' then
                    led_reg <= zswitch;
                elsif mv_left='1' then
                    --rotate the LEDs to the left using concatenation
                    led_reg <= led_reg(6 downto 0) & led_reg(7);
                elsif mv_right='1' then
                    -- rotate the LEDs to the right using concatenation
                    led_reg <= led_reg(0) & led_reg(7 downto 1);
                end if;
            end if;
        end if;
    end process rot_p;
end Behavioral;
