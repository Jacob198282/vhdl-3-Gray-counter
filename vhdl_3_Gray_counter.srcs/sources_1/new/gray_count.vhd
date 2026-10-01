----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.10.2026 11:30:40
-- Design Name: 
-- Module Name: gray_count - Behavioral
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
use IEEE.STD_LOGIC_SIGNED.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use STD.STANDARD.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity gray_count is
    Generic ( N : natural := 3);
    Port ( clk_i : in STD_LOGIC;
           rst_i : in STD_LOGIC;
           led_o : out STD_LOGIC_VECTOR ((N-1) downto 0));
end gray_count;

architecture Behavioral of gray_count is
    --signal q : std_logic_vector ((N-1) downto 0); 
    signal state, next_state, hold, next_hold : std_logic_vector (N-1 downto 0);
begin
    reset: process(clk_i, rst_i) begin
        if rst_i = '1' then
            --q <= (others => '0');
            state <= (others => '0');
            led_o <= (others => '0');
        elsif rising_edge(clk_i) then
            --q <= q + 1;
            state <= next_state;
        end if;
    end process reset;
    
--    count: process(q) begin
--        L1: for i in 0 to N-2 loop
--            led_o(i) <= q(i+1) xor q(i);
--        end loop L1;
--        led_o(N-1) <= q(N-1);
--    end process count;
    hold <= state xor ('0' & hold(N-1 downto 1));
    next_hold <= hold + 1;
    next_state <= next_hold xor ('0' & next_hold(N-1 downto 1));
    led_o <= state;
       
    
end Behavioral;
