----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.07.2026 16:09:17
-- Design Name: 
-- Module Name: tb_clock_devider - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_clock_devider is
    
end tb_clock_devider;



architecture Behavioral of tb_clock_devider is
    component clock_divider is
        generic (
            fin : positive := 100;
            fout : positive := 50
        );
        port  (
            clk : in std_logic;
            rst : in std_logic;
            sclk : out std_logic
        );
    end component;
    
signal rst : std_logic :='1';
signal clk : std_logic :='0';    
signal s_out : std_logic;

begin
dut : clock_divider
generic map (
    fin => 100,
    fout => 10)
port map (
    rst => rst,
    clk => clk,
    sclk => s_out
);


clk <= not clk after 5ns;

process
begin
rst<='1';
wait for 20ns;
rst<='0';
wait for 100ns;
wait;
end process;
end Behavioral;
