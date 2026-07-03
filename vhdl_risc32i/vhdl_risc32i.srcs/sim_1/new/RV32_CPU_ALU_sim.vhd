----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.06.2026 18:17:13
-- Design Name: 
-- Module Name: RV32_CPU_ALU_sim - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RV32_CPU_ALU_sim is
    signal i1     : std_logic_vector(31 downto 0) := (others => '0');
    signal i2     : std_logic_vector(31 downto 0) := (others => '0');
    signal alu_op : std_logic_vector(3 downto 0)  := (others => '0');
    signal o      : std_logic_vector(31 downto 0);
end RV32_CPU_ALU_sim;

architecture Behavioral of RV32_CPU_ALU_sim is


    constant ALU_ADD  : std_logic_vector(3 downto 0) := "0000";
    constant ALU_SUB  : std_logic_vector(3 downto 0) := "0001";
    constant ALU_AND  : std_logic_vector(3 downto 0) := "0010";
    constant ALU_OR   : std_logic_vector(3 downto 0) := "0011";
    constant ALU_XOR  : std_logic_vector(3 downto 0) := "0100";
    constant ALU_SLT  : std_logic_vector(3 downto 0) := "0101";
    constant ALU_SLTU : std_logic_vector(3 downto 0) := "0110";
    constant ALU_SLL  : std_logic_vector(3 downto 0) := "0111";
    constant ALU_SRL  : std_logic_vector(3 downto 0) := "1000";
    constant ALU_SRA  : std_logic_vector(3 downto 0) := "1001";


begin
 uut : entity work.RV32I_CPU_ALU
    port map(
        i1 => i1, 
        i2 => i2,
        o => o,
        alu_op => alu_op
        );
        
    stim: process
    begin
                -- ADD: 4 + 5 = 9
        i1 <= x"00000004";
        i2 <= x"00000005";
        alu_op <= ALU_ADD;
        wait for 10 ns;
        assert o = x"00000009"
            report "ADD failed"
            severity error;
            
            
  -- SUB: 5 - 3 = 2
        i1 <= x"00000005";
        i2 <= x"00000003";
        alu_op <= ALU_SUB;
        wait for 10 ns;
        assert o = x"00000002"
            report "SUB failed"
            severity error;

        -- ADD mit -3: 5 + (-3) = 2
        i1 <= x"00000005";
        i2 <= x"FFFFFFFD";
        alu_op <= ALU_ADD;
        wait for 10 ns;
        assert o = x"00000002"
            report "ADD signed bitpattern failed"
            severity error;

        -- SLT signed: -1 < 1 -> 1
        i1 <= x"FFFFFFFF";
        i2 <= x"00000001";
        alu_op <= ALU_SLT;
        wait for 10 ns;
        assert o = x"00000001"
            report "SLT failed"
            severity error;

        -- SLTU unsigned: 0xFFFFFFFF < 1 -> false
        i1 <= x"FFFFFFFF";
        i2 <= x"00000001";
        alu_op <= ALU_SLTU;
        wait for 10 ns;
        assert o = x"00000000"
            report "SLTU failed"
            severity error;

        -- SLL: 1 << 4 = 16
        i1 <= x"00000001";
        i2 <= x"00000004";
        alu_op <= ALU_SLL;
        wait for 10 ns;
        assert o = x"00000010"
            report "SLL failed"
            severity error;

        -- SRL: 0x80000000 >> 4 = 0x08000000
        i1 <= x"80000000";
        i2 <= x"00000004";
        alu_op <= ALU_SRL;
        wait for 10 ns;
        assert o = x"08000000"
            report "SRL failed"
            severity error;

        -- SRA: 0x80000000 >>> 4 = 0xF8000000
        i1 <= x"80000000";
        i2 <= x"00000004";
        alu_op <= ALU_SRA;
        wait for 10 ns;
        assert o = x"F8000000"
            report "SRA failed"
            severity error;

        report "ALU simulation finished";
        wait;
            
    end process;
        

end Behavioral;
