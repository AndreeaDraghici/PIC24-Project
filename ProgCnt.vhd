----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:06:24 03/04/2021 
-- Design Name: 
-- Module Name:    ProgCnt - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
--------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ProgCnt is
    Port ( Clk : in  STD_LOGIC;
           New_PC : in  STD_LOGIC_VECTOR (5 downto 0);
           PC : out  STD_LOGIC_VECTOR (5 downto 0):= b"00_0000"
		);
end ProgCnt;

architecture Behavioral of ProgCnt is

begin

PC <= New_PC when rising_edge(Clk);

end Behavioral;

