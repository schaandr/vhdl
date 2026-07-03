----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.06.2026 16:46:55
-- Design Name: 
-- Module Name: RV32I_CPU_ALU - Behavioral
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

------------------
--alu_op 
--ALU_ADD 
--ALU_SUB
--ALU_AND
--ALU_OR
--ALU_XOR
--ALU_SLT
--ALU_SLTU
--ALU_SLL
--ALU_SRL
--ALU_SRA
------------------

entity RV32I_CPU_ALU is
    Port ( i1 : in STD_LOGIC_VECTOR (31 downto 0);
           i2 : in STD_LOGIC_VECTOR (31 downto 0);
           o : out STD_LOGIC_VECTOR (31 downto 0);
           alu_op: in STD_LOGIC_VECTOR(3 downto 0));
end RV32I_CPU_ALU;

architecture Behavioral of RV32I_CPU_ALU is


constant ALU_ADD    :std_logic_vector(3 downto 0) :=    "0000"; 
constant ALU_SUB    :std_logic_vector(3 downto 0) :=    "0001";
constant ALU_AND    :std_logic_vector(3 downto 0) :=    "0010";
constant ALU_OR     :std_logic_vector(3 downto 0) :=    "0011";
constant ALU_XOR    :std_logic_vector(3 downto 0) :=    "0100";
constant ALU_SLT    :std_logic_vector(3 downto 0) :=    "0101";
constant ALU_SLTU   :std_logic_vector(3 downto 0) :=    "0110";
constant ALU_SLL    :std_logic_vector(3 downto 0) :=    "0111";
constant ALU_SRL    :std_logic_vector(3 downto 0) :=    "1000";
constant ALU_SRA    :std_logic_vector(3 downto 0) :=    "1001";

begin

process(i1,i2,alu_op)
variable shift_amount : integer := 0;
begin
   
    case alu_op is
        when ALU_ADD =>
            o<=std_logic_vector(unsigned(i1) + unsigned(i2));
        when ALU_SUB =>
            o<=std_logic_vector(unsigned(i1) - unsigned(i2));
        when ALU_AND =>
            o<=i1 and i2;
        when ALU_OR =>
            o<=i1 or i2;
        when ALU_XOR =>
            o<=i1 xor i2;
        when ALU_SLT =>
            if signed(i1) < signed(i2) then
                o<=(31 downto 1 => '0') & '1';
            else
                o<=(31 downto 0 => '0');
            end if;
        when ALU_SLTU =>
            if unsigned(i1) < unsigned(i2) then
                o<=(31 downto 1 => '0') & '1';
            else
                o<=(31 downto 0 => '0');
            end if;
        when ALU_SLL =>
            shift_amount := TO_INTEGER(unsigned(i2(4 downto 0)));
            o<= std_logic_vector(shift_left(unsigned(i1),shift_amount));
        when ALU_SRL =>
            shift_amount := TO_INTEGER(unsigned(i2(4 downto 0)));
            o<= std_logic_vector(shift_right(unsigned(i1),shift_amount));
        when ALU_SRA =>
            shift_amount := TO_INTEGER(unsigned(i2(4 downto 0)));
            o<= std_logic_vector(shift_right(signed(i1),shift_amount));
        when others =>
    o <= (others => '0');   
    end case;
end process;

    

end Behavioral;
