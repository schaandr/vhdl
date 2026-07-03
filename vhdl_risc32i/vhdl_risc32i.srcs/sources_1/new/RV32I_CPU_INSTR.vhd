----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.06.2026 16:46:55
-- Design Name: 
-- Module Name: RV32I_CPU_INSTR - Behavioral
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

entity RV32I_CPU_INSTR is
    Port ( addr : in STD_LOGIC;
           instruction_o : out STD_LOGIC_VECTOR (31 downto 0);
           instruction_i : in STD_LOGIC_VECTOR (31 downto 0));
end RV32I_CPU_INSTR;

architecture Behavioral of RV32I_CPU_INSTR is

begin


end Behavioral;
