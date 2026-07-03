----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.06.2026 16:46:55
-- Design Name: 
-- Module Name: RV32I_top_design - Behavioral
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

entity RV32I_top_design is
    Port ( cmd_in : in STD_LOGIC_VECTOR (31 downto 0);
           ergebnis : out STD_LOGIC_VECTOR (31 downto 0);
           debug : out STD_LOGIC_VECTOR (31 downto 0));
end RV32I_top_design;

architecture Behavioral of RV32I_top_design is

begin


end Behavioral;
