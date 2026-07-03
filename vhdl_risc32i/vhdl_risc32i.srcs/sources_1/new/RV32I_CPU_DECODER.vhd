----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.06.2026 16:46:55
-- Design Name: 
-- Module Name: RV32I_CPU_DECODER - Behavioral
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

entity RV32I_CPU_DECODER is
    Port ( cmd : in STD_LOGIC_VECTOR (31 downto 0));
    
end RV32I_CPU_DECODER;

architecture Behavioral of RV32I_CPU_DECODER is
     signal opcode :  STD_LOGIC_VECTOR (6 downto 0);
     signal funct3 :  STD_LOGIC_VECTOR (2 downto 0);
     signal funct7 :  STD_LOGIC_VECTOR (6 downto 0);
     signal rs1 :  std_logic_vector(4 downto 0);
     signal rs2 :  std_logic_vector(4 downto 0);
     signal rd :  std_logic_vector(4 downto 0);
begin
    process(cmd)
        begin
        opcode <= cmd(6 downto 0);
        rd     <= cmd(11 downto 7);
        funct3 <= cmd(14 downto 12);
        rs1    <= cmd(19 downto 15);
        rs2    <= cmd(24 downto 20);
        funct7 <= cmd(31 downto 25);
    end process;
    
    
end Behavioral;
