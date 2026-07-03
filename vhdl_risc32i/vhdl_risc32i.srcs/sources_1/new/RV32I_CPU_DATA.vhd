----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.06.2026 16:46:55
-- Design Name: 
-- Module Name: RV32I_CPU_DATA - Behavioral
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

entity RV32I_CPU_DATA is
    Port ( addr : in STD_LOGIC_VECTOR (31 downto 0);
           data : out STD_LOGIC_VECTOR (31 downto 0);
           write_en : in STD_LOGIC;
           dirty : out STD_LOGIC);
end RV32I_CPU_DATA;

architecture Behavioral of RV32I_CPU_DATA is

begin


end Behavioral;
