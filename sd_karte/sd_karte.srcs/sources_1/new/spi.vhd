----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.07.2026 20:53:00
-- Design Name: 
-- Module Name: spi - Behavioral
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

entity spi is
    generic(
        data_width : integer := 31); 
    Port ( clk : in STD_LOGIC; --ext. Clk
           sclk : out STD_LOGIC; --Clk für Slaves
           data_in : in std_logic_vector(data_width downto 0); --ext. Daten
           data_out : out std_logic_vector(data_width downto 0); -- Daten von Slave
           mosi : out STD_LOGIC; -- bitweises senden
           miso : in STD_LOGIC; --bitweises empfangen
           busy : out std_logic; --in arbeit
           enable : in STD_LOGIC; --Übertragung starten.
           rst : in STD_LOGIC; -- reset
           ss : out STD_LOGIC); --slave select (low active)
end spi;



architecture Behavioral of spi is
--Zustände
type T_STATE is (t_reset,t_busy, t_idle,t_start);

--internen Signale
signal current_state : T_STATE;
signal next_state : T_STATE;
signal counter : integer;
signal r_data_in : std_logic_vector (data_width downto 0);
signal r_data_out : std_logic_vector(data_width downto 0);
signal i_sclk : std_logic;
signal i_rst : std_logic;

begin
c_slck : entity work.clock_divider 
generic map(
    fin => 100,
    fout=> 10
)
port map (
    clk => clk,
    sclk => i_sclk,
    rst => i_rst
);

sclk <= i_sclk when current_state = t_busy else '0';

process(clk,rst)
begin
    if rst = '1' then
        current_state <= t_idle;
        ss <= '1';
        sclk <='0';
        mosi <= '0';
        r_data_out(data_width downto 0) <= (others =>'0');
        counter <= 0;
        busy<='0';
    elsif rising_edge(clk,i_rst) then
        if current_state = t_idle then
            if enable = '1' then
                current_state <= t_start;
                ss<='1';
                sclk <='0';
            end if;
        elsif current_state = t_start then
                r_data_in <= data_in;
                mosi <= data_in(0);
                r_data_out <= (others =>'0');
                r_data_out(0) <= miso;
                counter <= 0;
                busy<='1';
                sclk<=i_sclk;
                current_state<=t_busy;
                ss<='0';
        elsif current_state = t_busy then
            if counter <= data_width then
                counter <= counter+1;
                r_data_out(data_width downto 1)<= r_data_out(data_width-1 downto 0); 
                r_data_out(0) <= miso;
                r_data_in(data_width downto 1)<= r_data_in(data_width-1 downto 0); 
                mosi <= r_data_in(0) ;
            else 
                current_state<= t_idle;
            end if;
             
        else
            current_state <= t_idle;
        end if;
    end if;
end process;

end Behavioral;
