----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.07.2026 09:57:37
-- Design Name: 
-- Module Name: clock_divider - Behavioral
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

entity clock_divider is
    generic (
        fin : positive := 100;
        fout : positive := 50
    );
    Port ( 
            rst : in std_logic;
            clk : in STD_LOGIC;
            sclk : out STD_LOGIC);
end clock_divider;

architecture Behavioral of clock_divider is
signal count: integer;
signal tmp : std_logic;

begin
process(clk)
begin
    if(rst='1') then 
        count<=0;
        tmp<='0';
    elsif(rising_edge(clk)) then
        count <=count+1;
        if (count = integer(fin/(2*fout)-1)) then
            tmp <= NOT tmp;
            count <= 0;
        end if;
    end if;
sclk <= tmp;
end process;
end Behavioral;
